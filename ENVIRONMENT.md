# Cloud environment setup (one-time, ~5 minutes)

## 1. Push this repo to GitHub

    git init && git add -A && git commit -m "scaffold problem-hunting research repo"
    gh repo create problem-hunting --private --source=. --push
    # or create it in the GitHub UI and push manually

## 2. Create the cloud environment

At https://claude.ai/code, click the cloud icon above the message box →
**Add cloud environment**:

- **Name:** `research`
- **Network access:** `Full` for the first session. After `doctor` shows
  which hosts the skill actually uses, switch to **Custom** and paste the
  list below plus anything doctor reported.
- **Environment variables:** leave empty (the SessionStart hook sets them).
- **Setup script:** leave empty (yt-dlp installs via the hook; everything
  else is pre-installed).

Starting Custom allowlist (check "Also include default list of common
package managers"):

    reddit.com
    *.reddit.com
    news.ycombinator.com
    hn.algolia.com
    polymarket.com
    *.polymarket.com
    youtube.com
    *.youtube.com
    *.googlevideo.com
    arxiv.org
    export.arxiv.org
    techmeme.com
    *.techmeme.com
    digg.com
    *.digg.com

## 3. Start the first session

Select the `problem-hunting` repo and the `research` environment, then paste:

    Run /last30days doctor and report which sources are WORKING. Then
    research the first two verticals in research/verticals.md, fill in
    research/findings.md, and commit and push the results.

Or from your terminal inside the repo: `claude --cloud`.

## Notes

- Nothing persists between sessions except what gets committed. The hook
  and CLAUDE.md tell Claude to commit `research/` at the end of each run.
- No X/Twitter without a paid key. If you ever add one, put it in the
  environment as an API credential (Pro/Max), not an env var.
- Cloud sessions share your account rate limits; `--discover` across
  several verticals is a heavy run.
