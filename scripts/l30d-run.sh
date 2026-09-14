#!/bin/bash
# Corre el motor last30days con los flags obligatorios y deja la evidencia citable.
#
# Por qué existe: el comando del playbook usaba "$SKILL_DIR", que NO SE DEFINE
# EN NINGÚN LADO del repo — ni en session-start.sh, ni en .claude/last30days.env,
# ni en CLAUDE.md. O sea que el Paso 5 de /dolor no se podía ejecutar como estaba
# escrito. Este script resuelve el path y encapsula las cuatro reglas de
# CLAUDE.md → "Correr el motor", que son fáciles de olvidar y caras de olvidar.
#
# Uso:
#   scripts/l30d-run.sh <industria> "<topic temático dirigido>" [opciones]
#
# Opciones:
#   --etiqueta <txt>   nombre del brief (default: derivado del topic)
#   --dias <n>         default 90. NO bajes a 30 sin una razón
#   --search <lista>   default youtube,web
#   --nube             agrega --web-backend=parallel-mcp
#   --extra "<flags>"  flags sueltos para el motor
#
# Ejemplo:
#   scripts/l30d-run.sh salud-ips "glosas RIPS conciliacion cuentas medicas IPS EPS"

set -uo pipefail

INDUSTRIA="${1:?Uso: $0 <industria> \"<topic>\" [opciones]}"
TOPIC="${2:?Falta el topic. Tiene que ser temático y dirigido, nunca un nombre de marca suelto}"
shift 2

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO"

ETIQUETA=""; DIAS=90; SEARCH="youtube,web"; NUBE=""; EXTRA=""
while [ $# -gt 0 ]; do
  case "$1" in
    --etiqueta) ETIQUETA="${2:?}"; shift 2 ;;
    --dias)     DIAS="${2:?}";     shift 2 ;;
    --search)   SEARCH="${2:?}";   shift 2 ;;
    --extra)    EXTRA="${2:?}";    shift 2 ;;
    --nube)     NUBE="--web-backend=parallel-mcp"; shift ;;
    *) echo "Argumento inesperado: $1"; exit 1 ;;
  esac
done
[ -n "$ETIQUETA" ] || ETIQUETA="$TOPIC"

[ -d "research/industrias/$INDUSTRIA" ] || { echo "No existe la industria '$INDUSTRIA'."; exit 1; }

# --discover rankea r/all y la portada de HN, donde una queja B2B nicho jamás
# llega. Devolvió "Nothing solid this window" en todas las verticales probadas.
case "$EXTRA" in *--discover*) echo "✗ --discover no se usa como pase en este repo. Ver CLAUDE.md."; exit 1 ;; esac

# Un topic pelado devuelve basura. Medido: "SAP Business One en Colombia" trajo
# "GTA VI si hubiera sido grabado en Bogotá"; las marcas sueltas trajeron una
# reseña de una película de Tyler Perry.
if [ "$(echo "$TOPIC" | wc -w | tr -d ' ')" -lt 3 ]; then
  echo "⚠ '$TOPIC' parece un topic pelado. Los runs temáticos dirigidos son la regla;"
  echo "  un nombre de marca solo vale con 'vs' o minando reseñas de 2–3 estrellas."
  echo "  Ver CLAUDE.md → Taxonomía de consultas. Seguí en 5s con Ctrl-C para abortar."
  sleep 5
fi

# El hook de SessionStart tiene matcher "startup|resume": después de un /clear o
# un /compact no hay ninguna variable puesta, --save-dir se expande a vacío y el
# sandbox niega la escritura al default ~/.local/share/last30days/.
if [ -z "${LAST30DAYS_MEMORY_DIR:-}" ]; then
  if [ -f .claude/last30days.env ]; then
    set -a; . ./.claude/last30days.env; set +a
    echo "→ entorno cargado de .claude/last30days.env"
  else
    echo "✗ No hay LAST30DAYS_MEMORY_DIR ni .claude/last30days.env."
    echo "  Corré el hook de sesión: bash scripts/session-start.sh"
    exit 1
  fi
fi

# Esto es lo que faltaba: el skill es un plugin, y su ruta no estaba en ningún
# archivo del repo.
SKILL_DIR="${LAST30DAYS_SKILL_DIR:-}"
if [ -z "$SKILL_DIR" ]; then
  for c in ~/.claude/plugins/marketplaces/*/skills/last30days \
           ~/.claude/plugins/cache/*/last30days/*/skills/last30days; do
    [ -f "$c/scripts/last30days.py" ] && SKILL_DIR="$c" && break
  done
fi
[ -n "$SKILL_DIR" ] || { echo "✗ No encuentro el skill last30days. ¿Está instalado el plugin?"; exit 1; }

echo "→ skill:  $SKILL_DIR"
echo "→ topic:  $TOPIC"
echo "→ flags:  --days $DIAS --deep --emit=compact --store --search=$SEARCH $NUBE $EXTRA"

# shellcheck disable=SC2086
"${LAST30DAYS_PYTHON:-python3}" "$SKILL_DIR/scripts/last30days.py" "$TOPIC" \
  --days "$DIAS" --deep --emit=compact --store \
  --save-dir="$LAST30DAYS_MEMORY_DIR" \
  --search="$SEARCH" $NUBE $EXTRA
RC=$?

# Sin este paso la evidencia se pierde: last-report.json está gitignoreado y se
# sobrescribe en la corrida siguiente.
echo
echo "→ Convirtiendo la corrida en evidencia citable…"
scripts/l30d-brief.sh "$INDUSTRIA" "$ETIQUETA" || exit 1
exit $RC
