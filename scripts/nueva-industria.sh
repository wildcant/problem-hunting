#!/bin/bash
# Crea un directorio de industria nuevo desde la plantilla y lo registra en el índice.
#
#   scripts/nueva-industria.sh <slug> "<Nombre legible>"
#   scripts/nueva-industria.sh transporte-carga "Transporte de carga"
#
# Cada industria queda autocontenida en research/industrias/<slug>/ — mercado,
# dolor, oferta y tesis viven juntos y no se mezclan con los de otra industria.

set -euo pipefail

SLUG="${1:?Uso: $0 <slug> \"<Nombre legible>\"}"
NOMBRE="${2:?Uso: $0 <slug> \"<Nombre legible>\"}"

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLANTILLA="$REPO/research/_plantilla-industria"
DEST="$REPO/research/industrias/$SLUG"
INDICE="$REPO/research/INDICE.md"
FECHA=$(date +%Y-%m-%d)

case "$SLUG" in
  *[!a-z0-9-]*) echo "El slug solo admite minúsculas, números y guiones: '$SLUG'"; exit 1 ;;
esac
[ -d "$DEST" ] && { echo "Ya existe: research/industrias/$SLUG"; exit 1; }

mkdir -p "$(dirname "$DEST")"
cp -R "$PLANTILLA" "$DEST"

# PLANTILLA.md explica la plantilla, no pertenece a la industria. Y .claude es
# ruido del harness.
rm -f "$DEST/PLANTILLA.md"
rm -rf "$DEST/.claude"

# Sustituir los marcadores de la plantilla.
find "$DEST" -name '*.md' -type f | while read -r f; do
  sed -i '' -e "s|{{NOMBRE}}|$NOMBRE|g" -e "s|{{SLUG}}|$SLUG|g" -e "s|{{FECHA}}|$FECHA|g" "$f"
done

# Registrar en el índice, justo antes del marcador de fin de tabla.
if [ -f "$INDICE" ] && grep -q '<!-- fin-tabla -->' "$INDICE"; then
  FILA="| [$NOMBRE](industrias/$SLUG/) | ⬜ sin empezar | — | — | — | correr \`/mercado $SLUG\` |"
  python3 - "$INDICE" "$FILA" <<'PY'
import sys, re
p, fila = sys.argv[1], sys.argv[2]
s = open(p).read()

# El ancho de la fila está hardcodeado acá arriba. Si alguien le agrega una
# columna a INDICE.md y se olvida de este script, la tabla queda desalineada
# sin que nada avise. Comprobamos contra el encabezado real.
enc = next((l for l in s.splitlines() if l.startswith('| Industria')), None)
if enc and enc.count('|') != fila.count('|'):
    sys.exit(f"INDICE.md tiene {enc.count('|')-1} columnas y la fila trae "
             f"{fila.count('|')-1}. Actualizá FILA en scripts/nueva-industria.sh.")

open(p, 'w').write(s.replace('<!-- fin-tabla -->', fila + '\n<!-- fin-tabla -->'))
PY
  echo "  registrada en research/INDICE.md"
fi

echo "Creada: research/industrias/$SLUG/"
echo "Siguiente: /mercado $SLUG"
