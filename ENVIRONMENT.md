# Environment setup

This repo runs two ways: locally on macOS, and in Claude Code cloud sessions.
The `SessionStart` hook (`scripts/session-start.sh`) branches on
`CLAUDE_CODE_REMOTE` and configures each.

---

## Security model

The `last30days` skill pulls untrusted third-party text — Reddit posts, YouTube
transcripts, web pages, X posts — straight into the agent's context. Treat every
local run as processing hostile input. The sandbox is a hard requirement, not a
nicety.

### What is sandboxed

`.claude/settings.json` sets `sandbox.enabled: true` with
`autoAllowBashIfSandboxed: true`, so Bash commands run inside the OS sandbox
(Seatbelt on macOS) and are auto-approved within its boundary instead of
prompting one at a time.

- **Writes**: the sandbox default is the working directory plus the session temp
  directory. Everything the skill writes is pointed inside the repo
  (`LAST30DAYS_CONFIG_DIR=<repo>/.last30days`,
  `LAST30DAYS_MEMORY_DIR=<repo>/research/briefs`, and `--save-dir` on every run),
  so nothing needs a wider grant. `.claude/settings.json` and
  `.claude/settings.local.json` are additionally in `denyWrite`, so a sandboxed
  command cannot widen its own access.
- **Reads**: `denyRead` covers `~/.ssh`, `~/.aws`, `~/.gnupg`, `~/.config/gh`,
  `~/.netrc`, `~/.claude/settings.json`, `~/Library/Keychains`, and the **Brave,
  Firefox and Safari** profile directories. Chrome's profile is deliberately
  *not* denied — the X lane reads its cookies.
- **Network**: `sandbox.network.allowedDomains` lists only the hosts the skill
  needs. No local binding (`allowLocalBinding` defaults off).

The sandbox covers **Bash only**. The `Read` tool runs in-process and is not
sandboxed, so `permissions.deny` repeats the same sensitive paths as `Read(...)`
rules. Both layers are needed.

### What is denied

`permissions.deny` blocks `rm -rf`, `sudo`, `git push --force`/`-f`,
`git reset --hard`, `chmod 777`, `security dump-keychain`, `launchctl`,
`crontab`, and reads of the credential and other-browser paths above.

Two notes on how these behave:

- `Edit(./.claude/settings.json)` and `Edit(./.claude/settings.local.json)` are
  denied, which means **the agent cannot edit its own permission config** —
  by design. Change those files yourself in an editor; Claude can't, and will
  report being blocked if it tries.
- `permissions.ask` contains `Bash(git push*)`, so **every push prompts**. If you
  want unattended cloud sessions to push without stopping, delete that `ask`
  block by hand. Force-push stays denied either way.
- `Bash(security ...)` denials apply to commands the agent runs *through the Bash
  tool*. They do **not** block the engine's own internal
  `security find-generic-password` call for the Chrome Safe Storage passphrase,
  which is a Python subprocess. The Chrome cookie lane still works.

### Two settings a project file cannot set

`sandbox.network.strictAllowlist` and `sandbox.network.allowLocalBinding` are
**user- or managed-scope only**. Setting them in `.claude/settings.json` has no
effect. Consequences:

- Local binding is already off by default, so nothing to do.
- Without `strictAllowlist`, a host outside the allowlist **prompts** rather than
  being hard-denied. To make the allowlist a hard boundary, add this to
  `~/.claude/settings.json`:

  ```json
  { "sandbox": { "network": { "strictAllowlist": true } } }
  ```

  Recommended, since it turns "the agent asked to reach an unexpected host" from
  a decision you make while tired into a refusal.

### What still requires your judgment

- **The Facebook browser lane.** There is no sandbox around a browser you are
  driving. `research/facebook/README.md` is read-only by rule, not by
  enforcement — nothing stops a misstep but you. The automated
  (Chrome-integration) version runs **only while you are watching**.
- **The research Chrome profile is a standing credential.** Anything that can
  read `~/Library/Application Support/Google/Chrome` can act as that X and
  Facebook account. That is the deliberate trade for keyless X access. Keep the
  accounts throwaway and keep nothing else logged in on that profile.
- **Prompt injection.** A Reddit post or group comment can try to instruct the
  agent. `CLAUDE.md` tells it to treat page content as data, but that is a
  disposition, not a control. If a session starts doing something you didn't
  ask for, the cause is probably something it read.

### Recommendation: a separate macOS user account

If the Facebook or X browser lane ever gets automated — driven by Chrome
integration rather than by hand — move this repo to its own macOS user account.
Seatbelt and the deny rules protect files by path, but a browser profile in your
own account sits next to everything else you are logged into. A separate account
gives the browser lane its own home directory, its own Keychain, and its own
Chrome profile, so the worst case is scoped to the research identity instead of
your primary one. Until then, keep the lane manual and watched.

---

## Local setup (macOS)

### 1. Prerequisites

- Claude Code v2.1.219 or later (for `strictAllowlist`; the rest works earlier).
- Python **3.12+**. The engine refuses anything older. The hook picks the newest
  of `python3.14/3.13/3.12/python3` that satisfies this and exports
  `LAST30DAYS_PYTHON`.
- `yt-dlp` (the hook installs it via Homebrew or pip if missing).
- `openssl` on `PATH` — required to decrypt Chrome cookies.
- Chrome, with the throwaway X account and the Facebook account logged in under
  the **Default** profile.

### 2. What the hook does locally

It writes `.claude/last30days.env` (gitignored) with the repo-scoped config dir,
memory dir, `LAST30DAYS_STORE=1`, and `FROM_BROWSER=chrome`, and exports
`LAST30DAYS_TRUST_PROJECT_CONFIG=1` through `CLAUDE_ENV_FILE`.

`.claude/last30days.env` is the exact path the skill searches for in each parent
directory (`scripts/lib/env.py`). Config precedence, highest first:

1. process environment
2. trusted `.claude/last30days.env` ← this repo
3. `~/.config/last30days/.env` ← **your global config; the hook never touches it**
4. macOS Keychain items prefixed `last30days-`

Trust must arrive through the process environment: a project config file cannot
grant trust to itself.

**Never put an API key or a cookie value in any file under this repo**, including
the gitignored ones. Keys belong in `~/.config/last30days/.env` or the Keychain.

### 3. X via Chrome cookies

`FROM_BROWSER=chrome` selects **only** Chrome. Do not set `auto` — it falls
through `chrome → brave → edge → vivaldi → opera → arc → chromium → firefox →
safari`, and Brave, Firefox and Safari must never be read here. The deny rules
are the backstop; `chrome` is the intent.

Chrome's default profile on macOS:

```
~/Library/Application Support/Google/Chrome/Default/Cookies
```

The engine copies that SQLite file to a temp location, then asks macOS for the
AES passphrase stored in the Keychain under the service name
**`Chrome Safe Storage`**, via `security find-generic-password`.

**The Keychain prompt.** The first time this runs you get a system dialog:

> **"Claude Code" wants to access key "Chrome Safe Storage" in your keychain.**
> Enter your keychain password to allow this.

Choose **Always Allow** if you want the lane to work unattended afterwards;
**Allow** grants it once. This prompt is macOS asking, not the skill — there is
no way to pre-approve it from config.

**If Seatbelt blocks the Keychain call.** The sandbox can block the Mach lookup
`security` needs, and cookie extraction then fails with no usable key. The
fallback, once:

1. Quit the sandboxed session.
2. Start Claude Code with the sandbox off for one run:
   `claude --settings '{"sandbox":{"enabled":false}}'`
3. Run setup so the grant is recorded:
   `"$LAST30DAYS_PYTHON" "$SKILL_DIR/scripts/last30days.py" setup --allow-browser-cookies`
4. Approve the Keychain dialog with **Always Allow**.
5. Exit, and go back to normal sandboxed sessions.

Do **not** leave the sandbox off, and do not add an `excludedCommands` entry to
route cookie extraction around it. One unsandboxed setup run is the whole
concession.

**Confirming X works:**

```
/last30days doctor
```

X should appear under `● WORKING` with a named backend. If it shows under
`○ COULD BE ON` as "unconfigured; no backend configured", the cookie read
failed — check `openssl` is present and redo the Keychain step above.

**Guardrail:** one or two X topics per session, read-only, never post or
interact. See `CLAUDE.md`.

### 4. Web search locally

The host's own WebSearch is the backend: the skill sets
`LAST30DAYS_NATIVE_SEARCH=1` when the runtime has native web search, and
`doctor` reports web as *"host-native web search active"* rather than as a
configured source. That is expected and correct — it does not need a key.

If web results come back empty locally, fall back per run with
`--web-backend=parallel-mcp` (keyless). `search.parallel.ai` is already in the
sandbox allowlist for this.

### 5. First local run checklist

Run these in order and confirm each before trusting the setup.

- [ ] **Permission mode is "Accept edits", not "Auto".** Auto mode lets a
      classifier approve actions driven by content the skill just ingested. Use
      `/config` to check.
- [ ] **Sandbox actually activated.** Run `/sandbox`. You want the Mode, Overrides
      and Config tabs — **not** a lone Dependencies tab, which means a required
      package is missing. The Config tab's "Denied within allowed" list should
      show the two settings files.
- [ ] **`/last30days doctor` runs with no unexpected denials.** One benign
      violation is expected: the plugin's own SessionStart hook does
      `mkdir -p "${LAST30DAYS_MEMORY_DIR:-$HOME/Documents/Last30Days}"`, which can
      fire before our env vars are visible to it. The mkdir is `|| true`, so it
      fails silently and nothing is written there. Any *other* denial is real —
      note the path or host it names and bring it back rather than widening the
      allowlist reflexively.
- [ ] **X shows WORKING** in `doctor`, per the step above.
- [ ] **Nothing written outside the repo.** After one real topic run:
      ```bash
      ls ~/.local/share/last30days 2>/dev/null   # must not exist
      ls ~/Documents/Last30Days 2>/dev/null      # may exist, must be EMPTY
      git -C . status --short                     # new briefs under research/briefs/
      ls .last30days/                             # last-report.json, doctor-cache.json
      ```
      `research.db` must be in `research/briefs/`, not `~/.local/share`. If it is
      in the home directory, the run was missing `--save-dir`.
- [ ] **The global config is untouched.** `~/.config/last30days/.env` should have
      the same mtime as before the session.
- [ ] Optionally add `strictAllowlist` to `~/.claude/settings.json` (above).

---

## Cloud setup

### Environment

At https://claude.ai/code → cloud icon → **Add cloud environment**:

- **Name:** `research`
- **Network access:** `Custom`, with the list below. It mirrors
  `sandbox.network.allowedDomains` in `.claude/settings.json`.
- **Environment variables:** leave empty — the hook sets them.
- **Setup script:** leave empty — the hook handles the plugin and `yt-dlp`.

```
reddit.com
*.reddit.com
arctic-shift.photon-reddit.com
news.ycombinator.com
hn.algolia.com
polymarket.com
*.polymarket.com
youtube.com
*.youtube.com
*.googlevideo.com
github.com
api.github.com
search.parallel.ai
pypi.org
files.pythonhosted.org
registry.npmjs.org
```

`arctic-shift.photon-reddit.com` is load-bearing, not optional: the keyless
Reddit path backfills post scores and comments through it. Without it Reddit
coverage silently degrades.

X and `twimg.com` are omitted here on purpose — the cloud branch runs
`FROM_BROWSER=off` and has no cookie source, so X cannot work there. X is a
local-only lane.

### What the hook does in the cloud

- **Installs the plugin.** `enabledPlugins` in `.claude/settings.json` does not
  fetch it; a fresh container can come up with the skill missing entirely
  (`installed_plugins.json` empty). The hook runs `claude plugin marketplace add`
  + `claude plugin install` idempotently.
- **Pins `LAST30DAYS_PYTHON`.** The container's default `python3` is 3.11, which
  the engine rejects outright; `python3.12` is present but not default.
- Keeps `FROM_BROWSER=off` and points config/memory dirs into the repo.

### Cloud web search

Pass `--web-backend=parallel-mcp` on every run — keyless, and verified working
from a cloud session (4 web pages returned where earlier runs reported "Web
unreachable"). There is no env var for it, so it is a per-run flag.

### Notes

- Nothing persists between cloud sessions except what is committed. Commit
  `research/` at the end of every run.
- Cloud sessions share your account rate limits.
- No X without a local browser or a paid key.
