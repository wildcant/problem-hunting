# Candidate verticals and discovery prompts

Start with 3–4. Add or remove as evidence comes in.

| Vertical | First-pass prompt | Why it's here |
| --- | --- | --- |
| Property management (SMB) | `/last30days --discover "property management software complaints"` | Spreadsheet + email workflows, recurring, budget exists |
| Accounting / bookkeeping firms | `/last30days --discover "bookkeeping firm workflow pain"` | Repetitive, deadline-driven, pays for time saved |
| Logistics / freight brokers | `/last30days --discover "freight broker software frustrations"` | Manual data re-entry between systems |
| Field services (HVAC, plumbing, electrical) | `/last30days --discover "HVAC contractor software complaints"` | Named in 2026 as low-saturation; scheduling/invoicing pain |
| LatAm SMB back-office | `/last30days --discover "facturación electrónica pymes problemas"` | Regional edge: language, DIAN/SII/SAT rules US tools get wrong |

## Follow-up patterns

- `/last30days "<specific complaint>" --days=90` — check if it's persistent, not a spike
- `/last30days --drill "cluster N"` — deeper on one finding
- `/last30days "<incumbent tool> reviews"` — mine 2–3 star review themes
- `/last30days "<Company>" --hiring-signals` — what a company is throwing headcount at
