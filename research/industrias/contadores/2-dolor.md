# 2 · Dolor — Contadores y firmas contables

Playbook: `/dolor contadores` · Última corrida: 2026-09-13

> **Este archivo es evidencia. Cero ideas de producto, cero interpretación.**
> La única columna interpretativa es "Solución en software", que existe porque
> es lo que consume el sitio. Las tesis van en [`4-tesis.md`](4-tesis.md).

**Niveles de evidencia** (ver `CLAUDE.md` → Reglas de evidencia):

| Estado | Bar |
| --- | --- |
| `candidato` | ≥2 IDs de evidencia independientes. Entra al catálogo y al sitio |
| `calificado` | además, costo con una de las siete vías **nombrada** |

Las fuentes son IDs del brief crudo, no URLs pegadas a mano.
`scripts/verificar-evidencia.sh contadores` comprueba que cada una exista.

## Catálogo

**11 problemas en el catálogo: 10 candidatos y 1 calificado.**

Eje **D** para toda la industria: **sin cerrar**. La Junta Central de Contadores
publica consulta individual de contadores inscritos, pero que se pueda extraer
el padrón completo no está verificado — es pregunta de `/mercado`, no se asume
D=2. Todo el catálogo es **B2B**.

| ID | Problema (voz del que sufre) | Mec. | Solución en software | Costo + vía | Fuentes (# indep.) | Estado |
| --- | --- | :-: | --- | --- | --- | --- |
| **D1** | *"el PDF me sale en trámite, no me sale recibo, y cuando miro consultar envío me sale que no tengo ninguna solicitud"* — nadie sabe si quedó radicado | 1 | Watcher que consulta el estado del envío en el portal DIAN y avisa cuando pasa a RECIBIDO, o cuando se quedó en TRÁMITE | **sin cerrar** — nadie nombró cifra. Vía candidata 3: un envío no radicado es extemporáneo | `YT-T68j-e466` `YT-4UuF-a977` `YT-4UuF-f255` `YT-4UuF-92a6` `YT-4UuF-0e9b` `YT-4UuF-b77d` `YT-T68j-377a` `YT-4UuF-97cd` `YT-a03E-68c6` `YT-T68j-dc26` (10) | candidato |
| **D2** | *"si tengo dos archivos en la página, uno con errores y otro el correcto… ¿cómo soluciono?"* — no se sabe cuándo aplica reemplazo total, parcial, ni qué versión de prevalidador usar | 1 | Asistente de corrección que compara el XML nuevo contra lo radicado y dice si aplica reemplazo total o parcial, con qué versión y qué consecutivo | **sin cerrar** — la mecánica es el dolor; la cifra está en D3 | `YT-a03E-a881` `YT-a03E-6475` `YT-a03E-eb21` `YT-a03E-fe51` `YT-a03E-531f` `YT-a03E-fc47` `YT-a03E-cdee` `YT-a03E-24c1` `YT-a03E-e87f` (9) | candidato |
| **D3** | *"¿cómo puedo liquidar la sanción para reemplazar un formulario 1067 del trimestre anterior?"* — corrigen solos y no saben cuánto deben pagar | 1 | Liquidador del art. 651: calcula 0,7% / 0,5% sobre la base, aplica tope y mínima, y emite el recibo con la reducción al 10% por subsanación voluntaria | **art. 651 E.T.** (mod. art. 80 Ley 2277/2022): **0,7%** por error, **0,5%** por extemporaneidad, **1%** por no enviar. Tope **7.500 UVT ≈ $392,8 M**; mínima **10 UVT = $523.740** (UVT 2026 = $52.374). Se reduce al **10%** si se subsana antes del pliego de cargos. **Vía 3 · penalidad regulada** | `YT-a03E-c391` `YT-a03E-45ab` `YT-a03E-c8ab` `YT-a03E-6c9c` `YT-a03E-6684` `YT-a03E-8e28` (6) | **calificado** |
| **D4** | *"me olvido de cambiar el número de envío, ¿me generaría sanción?"* | 1 | Control de consecutivos por NIT / año / formato que numera solo y bloquea el envío duplicado | **sin cerrar.** Dos preguntan literalmente si es sancionable, pero eso es **miedo, no cifra** — y no está verificado que un consecutivo repetido configure el 651 | `YT-T68j-77ca` `YT-T68j-dabb` `YT-4UuF-d7ff` `YT-Paut-62db` (4) | candidato |
| **D5** | *"mi empresa desde que se creó no ha tenido ningún movimiento, ¿qué tendría que presentar?"* — llega el correo de la DIAN y no saben si aplica | 1 | Chequeo de obligación: cruza topes, RUT y el correo de la DIAN, y responde sí/no citando la resolución | **sin cerrar** | `YT-T68j-9117` `YT-T68j-5d67` `YT-T68j-bd9a` `YT-wfeE-6c0a` (4) | candidato |
| **D6** | *"¿me puedes ayudar con qué formatos debe presentar una propiedad horizontal residencial?"* | 1 | Selector de formatos por tipo de entidad (PH, fundación, JAC, persona natural comerciante) | **sin cerrar** | `YT-4UuF-5dda` `YT-wfeE-5843` `YT-T68j-4e08` (3) | candidato |
| **D7** | *"hace 8 días los bajé y empecé a poner la información, y cuando vi tu video quedé aaahh"* — el prevalidador del año sale sin aviso y el trabajo hecho se pierde | 1 · 10 | Aviso de publicación del prevalidador del año y migración de lo ya cargado a la versión nueva | **rework nombrado** (8 días de trabajo rehecho), pero **sin cifra en plata ni vía cerrada** | `YT-wfeE-72b6` `YT-4UuF-c24c` `YT-4UuF-5f3a` (3) | candidato |
| **D8** | *"generar el XML donde dice año inicial año final no decía 2023 sino 2022… ¿crees que vaya a tener problemas con la DIAN?"* — pasa la prevalidación y queda mal | 1 | Validación de coherencia año gravable ↔ fechas del XML antes de firmar | **sin cerrar.** Es fallo silencioso: produce información errónea sin avisar, lo que remite a D3 | `YT-T68j-6ee7` `YT-T68j-e34f` `YT-a03E-e87f` (3) | candidato |
| **D9** | *"estoy firmando la segunda parte de solicitud de envío y no me permite, dice que debo hacerlo en oficina"* | 1 | Pre-chequeo de firma (certificado, clave dinámica, vigencia) antes de arrancar el envío | **sin cerrar** | `YT-T68j-4e08` `YT-Paut-e81c` `YT-4UuF-b6ef` (3) | candidato |
| **D10** | *"a mí me salen todos sin el XML al final, ¿es normal?"* — el workaround es agregarlo a mano | 1 | Verificación de que cada formato generó su XML antes de radicar | **sin cerrar** | `YT-Paut-d3cf` `YT-Paut-8cfd` (2) | candidato |
| **D11** | *"son 2 archivos con más de 5.000 registros, unos 7.000, ¿cómo los coloco y cómo los subo?"* | 1 | Partición automática por tope de registros, con numeración de envío consistente (se cruza con D4) | **sin cerrar** | `YT-4UuF-7f7e` `YT-Paut-5d51` (2) | candidato |

### Señal de volumen

Vistas de los tutoriales del trámite. **No es dolor** — es tamaño del mercado
que busca ayuda. Los comentarios debajo sí son dolor.

| Vistas | Video |
| ---: | --- |
| 116.505 | [Curso Completo: Cómo Presentar Información Exógena en la DIAN Paso a Paso](https://www.youtube.com/watch?v=T68j1keF4tw) |
| 100.330 | [Cómo Corregir y Reemplazar Información Exógena en la DIAN](https://www.youtube.com/watch?v=a03EPssDN28) |
| 100.227 | [Cómo Presentar Información Exógena en la DIAN Paso a Paso (Desde Cero)](https://www.youtube.com/watch?v=4UuFvnn-CUM) |
| 13.068 | [Guía para principiantes en Información Exógena](https://www.youtube.com/watch?v=wfeE7YFmXqM) |
| 5.723 | [Cómo presentar y enviar formatos de Exógena en la DIAN 2026](https://www.youtube.com/watch?v=PautoOVJIy0) |

## Registrado pero no califica

- **Error `503007 error validación archivo`** — `YT-a03E-02fd`. String de error
  de altísima precisión, pero **una sola fuente**. La consulta
  `"503007 error validación archivo"` está en `consultas.md` sin correr; si
  aparece una segunda fuente independiente, entra como candidato.

## Descartado en este pase

- **Autopromo del canal.** 12 de 62 ítems de la corrida anterior eran el propio
  canal enlazando otros videos suyos. El filtro `RUIDO` de
  `scripts/yt-comentarios.sh` se reforzó para descartarlos y la corrida final
  bajó a 56 ítems limpios.
- **Elogio y pedido de clases.** `YT-a03E-db17`, `YT-wfeE-9061`,
  `YT-wfeE-48ce`, `YT-wfeE-9e6d`, `YT-T68j-7237` — pasan el regex de dolor por
  llevar `?` o la palabra "sanción", pero no describen un problema.
- **Tutoriales de proveedor tratados como queja.** El video es marketing; sus
  vistas son señal de volumen; sus comentarios son la evidencia. Tres cosas.
- **Reddit.** `r/Contabilidad` da 80 posts en 12 meses y los relevantes son
  otros founders validando ideas. Ver `research/consultas.md` → descartes.

## Notas de método

- **Mecanismos cubiertos: solo el 1.** Todo el pase fue YouTube sobre tutoriales
  de trámite, la lane correcta para *generar y radicar* y **la equivocada para
  todo lo demás**. Los mecanismos 2, 7 y 10 —coordinación con el cliente que
  manda facturas por WhatsApp, cobranza, rotación del auxiliar— siguen **sin
  mirar**. Lane para esos: ofertas de empleo y grupos de Facebook.
- **El brief es una muestra, no el censo.** `yt-dlp` toma hasta `max_comments`
  por video y el conjunto **varía entre corridas**: un ítem del video de
  corrección apareció en una corrida y desapareció en la siguiente. Un grupo puede encoger sin que el problema
  haya cambiado. Por eso el conteo de fuentes es un piso, no una medición.
- **Test del auxiliar: sí puede.** Presentar exógena lo hace un auxiliar de
  salario mínimo con tiempo. Por eso todo el catálogo depende de la vía de pago,
  y por eso **D3 es la única fila que hoy se sostiene sola**.
- Herramienta: `scripts/yt-comentarios.sh "como presentar informacion exogena DIAN paso a paso" 4 120 --industria contadores --mas-videos a03EPssDN28,wfeE7YFmXqM`
- El motor `last30days` **no se corrió** en este pase.
- **No verificado:** si el consecutivo repetido configura el 651 (afecta D4), la
  frecuencia real con que la sanción se materializa, y si algún incumbente ya
  valida el consecutivo o el año gravable.
