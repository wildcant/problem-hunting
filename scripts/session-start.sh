#!/bin/bash
# Runs at the start of every Claude Code session.
#
# Two branches:
#   cloud (CLAUDE_CODE_REMOTE=true) — install the plugin, pin a Python the
#     engine accepts, keep cookie reads hard off.
#   local (anything else)           — write a project-scoped config the skill
#     trusts, opt in to Chrome cookies only, never touch ~/.config.
#
# Both branches keep every path the skill writes inside the repo, so the
# sandbox's "writes limited to the repo" rule holds. Neither branch ever
# writes an API key or a cookie value to a committed file.

set -u

REPO="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
BRIEFS_DIR="$REPO/research/briefs"
CONFIG_DIR="$REPO/.last30days"

mkdir -p "$BRIEFS_DIR" "$CONFIG_DIR"
chmod 700 "$CONFIG_DIR" 2>/dev/null || true

# The engine requires Python 3.12+; many machines still default python3 to
# 3.11 or older. Resolve the newest acceptable interpreter once.
pick_python() {
  local candidate
  for candidate in python3.14 python3.13 python3.12 python3; do
    command -v "$candidate" >/dev/null 2>&1 || continue
    if "$candidate" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 12) else 1)' 2>/dev/null; then
      command -v "$candidate"
      return 0
    fi
  done
  return 1
}

L30_PYTHON="$(pick_python || true)"

# ---------------------------------------------------------------------------
# Shared env for every later Bash command in this session.
# ---------------------------------------------------------------------------
write_session_env() {
  [ -n "${CLAUDE_ENV_FILE:-}" ] || return 0
  {
    echo "LAST30DAYS_CONFIG_DIR=$CONFIG_DIR"
    echo "LAST30DAYS_MEMORY_DIR=$BRIEFS_DIR"
    echo "LAST30DAYS_STORE=1"
    [ -n "$L30_PYTHON" ] && echo "LAST30DAYS_PYTHON=$L30_PYTHON"
    for kv in "$@"; do echo "$kv"; done
  } >> "$CLAUDE_ENV_FILE"
}

if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  # -------------------------------------------------------------------------
  # CLOUD
  # -------------------------------------------------------------------------
  write_session_env "FROM_BROWSER=off"

  # The plugin declared in .claude/settings.json is not always installed in a
  # fresh cloud container: enabledPlugins alone does not fetch it, so the
  # skill goes missing. Install it idempotently.
  if command -v claude >/dev/null 2>&1; then
    if ! claude plugin list 2>/dev/null | grep -q "last30days"; then
      claude plugin marketplace add mvanhorn/last30days-skill >/dev/null 2>&1 || true
      claude plugin install last30days@last30days-skill >/dev/null 2>&1 || true
    fi
  fi

  # Project-scoped config: no cookies, skip the first-run wizard.
  if [ ! -f "$CONFIG_DIR/.env" ]; then
    cat > "$CONFIG_DIR/.env" <<CFG
SETUP_COMPLETE=1
FROM_BROWSER=off
LAST30DAYS_MEMORY_DIR=$BRIEFS_DIR
LAST30DAYS_STORE=1
CFG
    chmod 600 "$CONFIG_DIR/.env"
  fi

  command -v yt-dlp >/dev/null 2>&1 || pip install -q yt-dlp >/dev/null 2>&1 || true
else
  # -------------------------------------------------------------------------
  # LOCAL (macOS)
  # -------------------------------------------------------------------------
  # LAST30DAYS_TRUST_PROJECT_CONFIG must reach the skill through the process
  # environment: a project config file cannot grant trust to itself.
  write_session_env "FROM_BROWSER=chrome" "LAST30DAYS_TRUST_PROJECT_CONFIG=1"

  # .claude/last30days.env is the exact path the skill searches for in each
  # parent directory (scripts/lib/env.py). It is gitignored: treat it as the
  # place for machine-local settings, never for keys you would not lose.
  PROJECT_ENV="$REPO/.claude/last30days.env"
  if [ ! -f "$PROJECT_ENV" ]; then
    mkdir -p "$REPO/.claude"
    cat > "$PROJECT_ENV" <<CFG
# Machine-local last30days config for this repo. Gitignored.
# Never put API keys or cookie values in a file that could be committed.
SETUP_COMPLETE=1
LAST30DAYS_CONFIG_DIR=$CONFIG_DIR
LAST30DAYS_MEMORY_DIR=$BRIEFS_DIR
LAST30DAYS_STORE=1
# Chrome only. Never 'auto' — auto would fall through to Brave, Firefox
# and Safari, which this repo must never read.
FROM_BROWSER=chrome
LAST30DAYS_TRUST_PROJECT_CONFIG=1
CFG
    chmod 600 "$PROJECT_ENV"
  fi

  # The global config is yours, not this repo's. Never write to it.
  if command -v yt-dlp >/dev/null 2>&1; then
    :
  elif command -v brew >/dev/null 2>&1; then
    brew list yt-dlp >/dev/null 2>&1 || brew install yt-dlp >/dev/null 2>&1 || true
  else
    pip3 install -q --user yt-dlp >/dev/null 2>&1 || true
  fi
fi

exit 0
