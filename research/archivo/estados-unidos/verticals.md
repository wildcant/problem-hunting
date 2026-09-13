# Candidate verticals and research prompts

**Estado (2026-09-12): este archivo es el archivo histórico del mercado
estadounidense.** Las filas de property management y bookkeeping produjeron la
evidencia real que está en `findings.md` y se conservan como referencia de
patrón.

**La fila de LatAm está refutada, no sin probar.** `r/Contabilidad` tiene 80
posts en 12 meses con un máximo de 7 comentarios, contenido mexicano y español,
y varios posts son de otros founders validando ideas. Es estructuralmente
incapaz de producir recurrencia. Ver `CLAUDE.md` → restricción 3.

**Para Colombia usá `research/industrias/<slug>/consultas.md`** y el banco
compartido `research/consultas.md`, con los playbooks de `research/playbooks/`.

---

Start with 3–4. Add or remove as evidence comes in.

Every run is a **targeted topic run** with the subreddit lists below, `--days 90`,
and `--save-dir`. `--discover` is not used here — see `CLAUDE.md` for why.

| Vertical | Topic string | Why it's here |
| --- | --- | --- |
| Property management (SMB) | `property management software complaints` | Spreadsheet + email workflows, recurring, budget exists |
| Accounting / bookkeeping firms | `bookkeeping firm workflow pain` | Repetitive, deadline-driven, pays for time saved |
| Logistics / freight brokers | `freight broker software frustrations` | Manual data re-entry between systems |
| Field services (HVAC, plumbing, electrical) | `HVAC contractor software complaints` | Named in 2026 as low-saturation; scheduling/invoicing pain |
| ~~LatAm SMB back-office~~ | ~~`facturación electrónica pymes problemas`~~ | **REFUTADO** — ver el encabezado. Reemplazado por `research/consultas.md`. |

## Subreddit lists

`--dedicated-subreddits` are communities whose whole purpose is the topic; the
engine pulls these in full and skips the relevance floor. `--subreddits` are
mixed communities that stay relevance-floored. Don't put a mixed community in
the dedicated bucket — that is what filled a drill with off-topic r/RealEstate
threads.

| Vertical | `--dedicated-subreddits` | `--subreddits` |
| --- | --- | --- |
| Property management | `PropertyManagement,Landlord` | `realestateinvesting,RealEstate,smallbusiness` |
| Accounting / bookkeeping | `Bookkeeping,Accounting` | `QuickBooks,smallbusiness,taxpros` |
| Logistics / freight | `freight,FreightBrokers` | `logistics,Truckers,smallbusiness` |
| Field services | `HVAC,Plumbing,electricians` | `smallbusiness,Contractor,selfemployed` |
| ~~LatAm SMB back-office~~ | ~~`Contabilidad`~~ (80 posts/12 meses) | ~~`mexico,colombia,chile,emprendedores`~~ |

The property-management and bookkeeping rows are confirmed — they produced the
evidence in `findings.md`. The other three are unverified first guesses; check
each subreddit exists and is active before trusting a thin result from it.

## Worked example

```bash
"$LAST30DAYS_PYTHON" "$SKILL_DIR/scripts/last30days.py" "bookkeeping firm workflow pain" \
  --plan "$PLAN_FILE" \
  --dedicated-subreddits="Bookkeeping,Accounting" \
  --subreddits="QuickBooks,smallbusiness,taxpros" \
  --days 90 --deep --emit=compact --store \
  --web-backend=parallel-mcp \
  --save-dir="$LAST30DAYS_MEMORY_DIR"
```

Drop `--web-backend=parallel-mcp` locally unless host-native web search comes
back empty.

## Follow-up patterns

- `/last30days "<specific complaint>" --days=90` — check if it's persistent, not a spike
- `/last30days "<incumbent tool> reviews"` — mine 2–3 star review themes
- `/last30days "<Company>" --hiring-signals` — what a company is throwing headcount at
- `--drill "<cluster N>"` — **only when explicitly asked.** It re-researches the
  cluster's sources, not its comments, and dilutes niche topics.
