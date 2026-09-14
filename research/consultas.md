# Banco de consultas — compartido

Lo que sirve en cualquier industria: la taxonomía, las frases genéricas, y —lo
más importante— **los descartes medidos**, para que ninguna sesión futura repita
un error ya pagado.

Las consultas específicas de una industria viven en su propio directorio:
`research/industrias/<slug>/consultas.md`.

Marcadores: ✅ produjo evidencia · ⚠️ probado, delgado · ❌ descartado · ⬜ sin probar

---

## Frases de dolor genéricas

Sirven en cualquier sector. Buscan la voz del que sufre, no la jerga.

```
me toca digitar factura por factura
cuadrar el IVA a mano
me mandan las facturas por WhatsApp
paso todo a Excel
se me paso la fecha
hacerlo uno por uno
transcribir del banco al sistema
no me cuadra la conciliacion
lo hago en un excel aparte
```

## Patrones de string de error

Plantillas, no consultas literales. Sustituí el sistema.

```
<sistema> no me deja
error validacion <sistema>
<sistema> rechazado
me sale en tramite <sistema>
no me llega el acuse <sistema>
```

Los strings de error son la forma de consulta de mayor precisión que existe:
cero ruido, porque nadie escribe un mensaje de error salvo que lo haya visto.

---

## Descartes medidos — no volver a intentar ❌

Evidencia, no intuición. Cada fila costó una corrida.

| Consulta / fuente | Por qué | Medido |
| --- | --- | --- |
| `r/Contabilidad` como sub dedicado | 80 posts en 12 meses, máx. 7 comentarios por post, contenido mayoritariamente mexicano y español, y varios posts son otros founders validando ideas. Incapaz de producir recurrencia. | 2026-09-12, arctic-shift |
| `r/colombianos` | 0 posts. | 2026-09-12 |
| `r/emprendedores` para temas tributarios CO | "facturación electrónica" = 2 resultados en 12 meses. | 2026-09-12 |
| `r/Colombia` para dolor B2B | Activo, pero es un sub general y político. Los términos B2B caen en hilos de política. | 2026-09-12 |
| Cualquier marca sola como topic | Trajo una reacción a película de Tyler Perry (`Alegra`), "Algebra 1 Regents Review" (`Alegra`), política colombiana (`World Office`) y "GTA VI si hubiera sido grabado en Bogotá" (`SAP Business One en Colombia`). | 2026-09-12 |
| `--discover` como primer pase | "Nothing solid this window" en todas las verticales probadas. Rankea r/all y la portada de HN. | 2026-09-12 |
| YouTube para mecanismos de **coordinación** (2–5) | `como responder glosas EPS auditoria de cuentas medicas` devolvió **1 ítem**. Las mismas corridas sobre el trámite (`RIPS en JSON`, `RIPS rechazado`) dieron **69 y 50**. Confirma lo que `CLAUDE.md` afirmaba sin medir: nadie sube un tutorial de "cómo conciliar con la EPS". Para los mecanismos 2–5 la lane es el motor, ofertas de empleo y Facebook. | 2026-09-13, `scripts/yt-comentarios.sh` |
| `--hiring-signals` para Colombia | Solo lee ATS gringos (Greenhouse, Ashby, Lever, Workable, SmartRecruiters). Cae al tier 3 de búsqueda web ruidosa. | 2026-09-12, jobs.py |

---

## Lanes que sí funcionaron ✅

| Lane | Resultado | Medido |
| --- | --- | --- |
| Comentarios de YouTube bajo tutoriales de **trámite** (mecanismo 1) | Contadores: 56 ítems de 5 videos → 11 problemas catalogados. Salud: 69 y 50 ítems. Tutoriales con 116k/100k/100k vistas. **Solo sirve para el mecanismo 1** — ver el descarte de arriba. | 2026-09-13, `scripts/yt-comentarios.sh` |
