#!/bin/bash
# Runs at the start of every Claude Code session (local and cloud).
# In the cloud it points last30days at the repo so briefs get committed,
# skips the interactive onboarding wizard, and hard-disables cookie reads.

if [ "$CLAUDE_CODE_REMOTE" != "true" ]; then
  exit 0
fi

BRIEFS_DIR="$CLAUDE_PROJECT_DIR/research/briefs"
mkdir -p "$BRIEFS_DIR" ~/.config/last30days

# Persist env vars for every later bash command in this session.
if [ -n "$CLAUDE_ENV_FILE" ]; then
  {
    echo "LAST30DAYS_MEMORY_DIR=$BRIEFS_DIR"
    echo "LAST30DAYS_STORE=1"
    echo "FROM_BROWSER=off"
  } >> "$CLAUDE_ENV_FILE"
fi

# Global config for the skill: no cookies, skip first-run wizard.
if [ ! -f ~/.config/last30days/.env ]; then
  cat > ~/.config/last30days/.env << CFG
SETUP_COMPLETE=1
FROM_BROWSER=off
LAST30DAYS_MEMORY_DIR=$BRIEFS_DIR
LAST30DAYS_STORE=1
CFG
  chmod 600 ~/.config/last30days/.env
fi

# yt-dlp unlocks YouTube transcripts/comments (free, keyless).
command -v yt-dlp >/dev/null 2>&1 || pip install -q yt-dlp || true
exit 0
