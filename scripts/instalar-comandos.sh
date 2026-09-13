#!/bin/bash
# Instala los playbooks de research/playbooks/ como slash commands en .claude/commands/.
#
# Hay que correrlo a mano: el sandbox del harness le prohíbe al agente escribir
# en .claude/ (protege commands/, skills/, hooks/, agents/). Vos sí podés.
#
#   bash scripts/instalar-comandos.sh
#
# Después: /mercado, /dolor, /oferta, /veredicto

set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO/research/playbooks"
DST="$REPO/.claude/commands"

mkdir -p "$DST"
n=0
for f in "$SRC"/*.md; do
  b=$(basename "$f")
  [ "$b" = "README.md" ] && continue
  ln -sf "../../research/playbooks/$b" "$DST/$b"
  echo "  /${b%.md}"
  n=$((n+1))
done
echo "$n comandos instalados en .claude/commands/ (symlinks — se actualizan solos al editar el playbook)."
echo "Reiniciá la sesión de Claude Code para que los tome."
