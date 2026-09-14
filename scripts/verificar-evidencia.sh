#!/bin/bash
# Comprueba que toda cita de evidencia sea trazable a un brief crudo.
#
# Por qué existe: CLAUDE.md ya exigía "verificá cada URL contra el brief crudo
# antes de hacer commit"... y la regla se incumplió igual. contadores/2-dolor.md
# citaba youtube.com/watch?v=a03EPssDN28 (100.320 vistas) que no existe en
# ningún brief, y omitía dos videos que sí estaban. Una regla que vive solo en
# prosa depende de que alguien se acuerde. Esta no.
#
# Uso:
#   scripts/verificar-evidencia.sh [industria]     (sin argumento: todas)
#
# Chequea tres cosas:
#   1. Todo ID citado (YT-…, L3D-…) existe en algún brief de esa industria.
#   2. Toda URL de una plataforma que minamos, citada en 2-dolor.md, aparece en
#      un brief. Los dominios que NO minamos (dian.gov.co, prensa, gremios)
#      quedan exentos: esos vienen de WebSearch y son evidencia legítima que
#      nunca pasó por un brief.
#   3. Toda fila del catálogo con estado candidato/calificado cita >= 2 IDs
#      independientes — el bar de "candidato".

set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FILTRO="${1:-}"

REPO="$REPO" FILTRO="$FILTRO" python3 <<'PY'
import os, re, sys, glob

repo   = os.environ["REPO"]
filtro = os.environ["FILTRO"]
base   = os.path.join(repo, "research", "industrias")

# Prefijos por lane: YT = comentarios de YouTube, L3D = motor last30days,
# JOB = ofertas de empleo, WEB = WebSearch/WebFetch, FB = grupos de Facebook,
# ENT = entrevista. Un lane sin prefijo no se puede citar ni verificar.
LANES  = "YT|L3D|JOB|WEB|FB|ENT"
ID_DEF = re.compile(rf"^###\s+((?:{LANES})-[A-Za-z0-9_]+-[A-Za-z0-9]+)")
ID_USE = re.compile(rf"\b((?:{LANES})-[A-Za-z0-9_]+-[A-Za-z0-9]{{4,6}})\b")
URL    = re.compile(r"https?://[^\s)\]<>\"']+")

# Plataformas que minamos con un lane propio: si una URL de estas aparece en
# 2-dolor.md, tuvo que salir de un brief.
MINADAS = ("youtube.com", "youtu.be", "reddit.com", "x.com", "twitter.com",
           "tiktok.com", "facebook.com", "news.ycombinator.com")

errores, avisos = [], []
ids_ok, urls_ok = 0, 0

industrias = sorted(d for d in glob.glob(os.path.join(base, "*")) if os.path.isdir(d))
if filtro:
    industrias = [d for d in industrias if os.path.basename(d) == filtro]
    if not industrias:
        print(f"No existe la industria '{filtro}'.", file=sys.stderr); sys.exit(2)

for ind in industrias:
    slug   = os.path.basename(ind)
    briefs = sorted(glob.glob(os.path.join(ind, "briefs", "*.md")))

    definidos, urls_brief = set(), set()
    for b in briefs:
        for line in open(b, encoding="utf-8"):
            m = ID_DEF.match(line)
            if m: definidos.add(m.group(1))
            urls_brief.update(URL.findall(line))

    for f in sorted(glob.glob(os.path.join(ind, "*.md"))):
        rel = os.path.relpath(f, repo)
        es_dolor = os.path.basename(f) == "2-dolor.md"
        for n, line in enumerate(open(f, encoding="utf-8"), 1):
            # 1 · IDs citados que no existen
            for cid in ID_USE.findall(line):
                if cid in definidos:
                    ids_ok += 1
                else:
                    errores.append(f"{rel}:{n}  cita {cid} — no existe en ningún brief de {slug}/")
            if not es_dolor:
                continue
            # 2 · URLs de plataformas minadas que no salen de un brief
            for u in URL.findall(line):
                u = u.rstrip('.,;')
                if not any(d in u for d in MINADAS):
                    continue
                if any(u in ub or ub in u for ub in urls_brief):
                    urls_ok += 1
                else:
                    errores.append(f"{rel}:{n}  URL {u} no aparece en ningún brief de {slug}/")
            # 3 · el bar de candidato: >= 2 IDs por fila del catálogo
            # Solo las filas del catálogo (las que abren con **Dn**). Sin esto,
            # la tabla de leyenda que explica los estados se marca sola.
            if re.match(r"\s*\|\s*\*\*D\d+\*\*", line) and re.search(r"\b(candidato|calificado)\b", line):
                ids = set(ID_USE.findall(line))
                if len(ids) < 2:
                    avisos.append(f"{rel}:{n}  fila con {len(ids)} ID(s) — el bar de candidato son 2 independientes")

for e in errores: print(f"  ✗ {e}")
for a in avisos:  print(f"  ⚠ {a}")
print(f"  ✓ {ids_ok} ID(s) y {urls_ok} URL(s) verificadas contra los briefs")

if errores:
    print(f"\n{len(errores)} error(es) de trazabilidad.", file=sys.stderr)
    sys.exit(1)
if avisos:
    print(f"\n{len(avisos)} aviso(s). No bloquea el commit.")
sys.exit(0)
PY
