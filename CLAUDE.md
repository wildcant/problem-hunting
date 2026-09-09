# Problem hunting — B2B pain-point research

This repo is a research log. It runs the `/last30days` skill in Claude Code
cloud sessions to find recurring, unglamorous operational problems that
companies in specific verticals complain about — candidates for a paid product.

## How a session should work

1. Run `/last30days doctor` first. If free sources (Reddit, HN, Polymarket,
   YouTube, arXiv, Techmeme) report NOT WORKING because a host is unreachable,
   stop and list the hostnames so I can add them to the cloud environment's
   allowed domains.
2. Research the vertical(s) I name using the prompts in `research/verticals.md`.
   Prefer `--discover "<vertical>"` for a first pass, then `--drill` into the
   2–3 strongest clusters.
3. For each vertical, append findings to `research/findings.md` using the table
   format there. Only record problems that show evidence of BOTH recurrence
   (multiple threads / commenters) and cost (hours, money, staff, churn).
   Ignore one-off viral rants.
4. Briefs are saved automatically to `research/briefs/` (LAST30DAYS_MEMORY_DIR
   is set by the SessionStart hook). Commit everything at the end:
   `git add research && git commit -m "research: <vertical> <date>"` and push
   to the current branch.

## Rules

- Never read browser cookies or ask to set up X/Twitter. Free sources only
  unless I explicitly add a key.
- Don't propose product ideas in the findings file. Record problems, evidence,
  and who has them. Ideas come later, after interviews.
- If a source keeps failing, note it in the commit message and move on.
