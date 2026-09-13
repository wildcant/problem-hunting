# 2 · Dolor — Contadores y firmas contables

Playbook: `/dolor contadores` · Última corrida: 2026-09-12

> **Este archivo es evidencia. Cero ideas de producto, cero interpretación.**
> Las hipótesis van en [`4-tesis.md`](4-tesis.md).

## Califican

Recurrencia **y** costo. Ver reglas de evidencia en `CLAUDE.md`.

Cada fila lleva un **ID** (`D1`, `D2`, …): es lo que cita `4-tesis.md` para
sostener un eje del puntaje. La celda de costo **nombra cuál de las siete vías
aplica**; sin vía, la fila no está cerrada.

| Problema (con ID) | Quién lo tiene → quién lo agrega | Mec. | Workaround hoy | Costo + vía | Recurrencia (# fuentes indep., fechas) | Fuente |
| --- | --- | :-: | --- | --- | --- | --- |

*(vacío — nada ha cerrado costo todavía)*

## Registrado pero no califica

### Exógena — el "consecutivo del envío" se equivoca y nadie sabe si genera sanción

**Recurrencia: sí. Costo: todavía no.**
**Mecanismo 1** (generar y radicar) · **vía candidata: 3, penalidad regulada** —
art. 651 E.T., monto sin verificar.

Al menos 4 comentarios independientes en dos tutoriales distintos, todos con la
misma pregunta. Textuales:

- *"Sí por error, me olvido de cambiar el número de envío, ¿Me generaría sanción?"*
- *"si no se edita el número del envío o sea si subo 4 formatos diferentes y el envío no lo edite y todos los subí como 1 es sancionable? O que se puede hacer?"*
- *"Luego empecé a subir medios y decía que utilizara consecutivo 2 pero se me olvidó cambiarlo y quedó con 1. Me dejó pasar normal y en el estado dice solicitud recibida. ¿Debo remplazar el archivo…?"*
- *"Me quedó con error… el error en el número de registros era 3 y coloqué que tenía 4, entonces lo fui a remplazar y cuando llamo me dice que no tengo registros, ¿cómo hago para verlos?"*

Dos fallas adyacentes en las mismas fuentes:

- **El prevalidador arroja excepciones de Java a contadores:** *"me sale el
  siguiente error después de firmarlo: java.rmi.ServerException: RuntimeException;
  nested exception is: java.lang.NullPointerException"*
- **El acuse nunca llega:** *"después de que lo firmo el PDF me sale en trámite,
  no me sale recibo, y cuando miro consultar envío de solicitudes me sale que no
  tengo ninguna solicitud 😢"* — repetido por otro comentarista.

**Señal de volumen** (vistas de los tutoriales del trámite, no del dolor en sí):

| Vistas | Video |
| ---: | --- |
| 116.501 | [Curso Completo: Cómo Presentar Información Exógena en la DIAN Paso a Paso](https://www.youtube.com/watch?v=T68j1keF4tw) |
| 100.320 | [Cómo Corregir y Reemplazar Información Exógena en la DIAN](https://www.youtube.com/watch?v=a03EPssDN28) |
| 100.224 | [Cómo Presentar Información Exógena en la DIAN Paso a Paso (Desde Cero)](https://www.youtube.com/watch?v=4UuFvnn-CUM) |

**Qué falta para que califique:** el monto de la sanción del art. 651 E.T. por
información exógena errónea o extemporánea. Nadie en la fuente lo nombró — solo
expresaron miedo a ella, que es señal pero no cifra. Con el monto, la vía 3 queda
nombrada y la fila entra como `D1`.

**Crudo:** [`briefs/exogena-yt-comentarios-2026-09-12.md`](briefs/exogena-yt-comentarios-2026-09-12.md)
(48 comentarios con marcador de dolor, de 4 videos)

## Descartado en este pase

- **Tutoriales de proveedor tratados como queja.** Los videos de Contapyme,
  Siigo y Helisa son marketing. Sus vistas son señal de volumen; sus comentarios
  sí son dolor; el video en sí no es evidencia de nada.
- **Autopromo en comentarios.** El primer comentario del video de 116k vistas es
  del propio canal vendiendo su software. Filtrado por el script.
- **Reddit.** `r/Contabilidad` da 80 posts en 12 meses y los pocos relevantes
  son de otros founders validando ideas ("¿Facturas con Zoho Books en Colombia?
  Busco 5 negocios para probar GRATIS"). Ver `research/consultas.md` → descartes.

## Notas de método

- **Mecanismos cubiertos: solo el 1.** Todo este pase fue YouTube sobre
  tutoriales de trámite, que es la lane correcta para generar y radicar y **la
  equivocada para todo lo demás**. Los mecanismos 2, 7 y 10 de esta industria
  —coordinación con el cliente que manda facturas por WhatsApp, cobranza, y
  rotación del auxiliar— están **sin mirar**, y no van a aparecer en YouTube.
  Lane para esos: ofertas de empleo y grupos de Facebook.
- Ventana: comentarios completos de 4 videos, ordenados por `top` y `new`.
- Herramienta: `scripts/yt-comentarios.sh "como presentar informacion exogena DIAN paso a paso" 4 120`
- El motor `last30days` no se corrió en este pase; el lane de comentarios llegó
  primero y produjo suficiente para justificar la etapa 3.
- **No verificado:** el monto de la sanción, la frecuencia real con que se
  materializa, y si algún software incumbente ya valida el consecutivo.
- **Test del auxiliar:** presentar exógena lo puede hacer un auxiliar de salario
  mínimo con tiempo. Por eso este hallazgo **depende enteramente** de cerrar la
  vía de pago; sin ella no hay caso, por más recurrencia que tenga.
