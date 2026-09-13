# Contadores y firmas contables

**Estado:** 🔍 en investigación
**Última actualización:** 2026-09-13
**Veredicto:** — (catálogo poblado; falta `/mercado` y `/oferta`)

Estados posibles: ⬜ sin empezar · 🔍 en investigación · ✅ tesis viva · ❌ descartado

## Por qué esta industria

Es comprador **y** canal a la vez. Sufre cada dolor multiplicado por sus 20–60
clientes, tiene presupuesto propio, y venderle a uno da acceso a decenas de
PYMEs. Es la restricción 2 de `CLAUDE.md` en su forma más pura.

No salió del barrido —es anterior a él— y por eso no tiene fila con Σ. Lo más
cercano en [`barrido-industrias.md`](../../barrido-industrias.md) es el
intermediario de "empresas pequeñas en general". **Pendiente:** darle fila y Σ,
o dejar constancia de que se investiga como intermediario transversal y no como
sector.

## De un vistazo

| | |
| --- | --- |
| Fila del barrido | sin fila — ver arriba |
| **Test del auxiliar** | **sí puede** — presentar exógena es digitación y paciencia. Por eso el caso depende enteramente de la vía de pago |
| **Vía de pago** (de las siete) | **3 · penalidad regulada** — art. 651 E.T. **cerrada**: 0,7% por error, 0,5% por extemporaneidad, tope 7.500 UVT ≈ $392,8 M, mínima 10 UVT = $523.740 (UVT 2026 = $52.374), reducible al 10% por subsanación voluntaria |
| **Mecanismo(s) de valor** (de los diez) | **1 · generar y radicar** en las 11 filas. Los mecanismos 2, 7 y 10 siguen sin mirar |
| Intermediario que agrega el dolor | el contador mismo — es el intermediario |
| **Eje D · distribución** | **sin cerrar.** La Junta Central de Contadores publica consulta individual de inscritos, pero **no está verificado** que se pueda descargar el padrón completo. Primer trabajo de `/mercado` |
| **Problemas en el catálogo** | **11** — 10 candidatos · 1 calificado (`D3`) |
| Ancla de precio | — falta `/mercado`. Tipo: costo empleador del auxiliar contable, con techo en la sanción del 651 |
| Pico estacional | exógena (abr–may), renta PN (ago–oct), cierre fiscal (ene–mar) |
| Puntaje `/veredicto` | — /10 |

Las siete vías y los cinco imposibles están en `CLAUDE.md` → restricción 1. Los
diez mecanismos, en `CLAUDE.md` → mecanismos de valor.

## Etapas

- [ ] **1 · Mercado** — [`1-mercado.md`](1-mercado.md) · `/mercado contadores`
- [x] **2 · Dolor** — [`2-dolor.md`](2-dolor.md) · *catálogo de 11 problemas, 1 calificado; solo mecanismo 1*
- [ ] **3 · Oferta** — [`3-oferta.md`](3-oferta.md) · `/oferta contadores`
- [ ] **4 · Tesis** — [`4-tesis.md`](4-tesis.md) · `/veredicto contadores`

## Siguiente paso

Tres cosas, en este orden:

1. **Cerrar el eje D**: bajar el padrón de la Junta Central de Contadores. Si se
   puede extraer en bloque, contadores es D=2 y la distribución es outbound puro;
   si solo se consulta uno por uno, es D=1 y hay que construir la lista. Decide
   la estrategia de venta entera y cuesta una tarde.
2. **Correr `/mercado contadores`** para el ancla de precio — cuántos contadores
   hay, cuánto cobran, y contra qué se cotiza el software. Alimenta la compuerta
   A de `/veredicto`.
3. **Buscar el problema grande detrás del trámite.** Las 11 filas del catálogo
   son **todas mecanismo 1**, donde el auxiliar sí compite. Sin mirar: cobranza
   al cliente que no paga (mec. 7), coordinación con el cliente que manda las
   facturas por WhatsApp (mec. 2), y rotación del auxiliar (mec. 10). Son
   mecanismos sin tutorial: la lane es Facebook y ofertas de empleo, no YouTube.

**Lo que ya no bloquea:** el costo. El art. 651 quedó cerrado con cifra y `D3`
subió a `calificado`. El hallazgo más fuerte no fue el consecutivo sino la
**corrección de un envío ya radicado** — seis contadores distintos preguntando
cómo liquidar la sanción, que es gente autocorrigiéndose para pagar el 10%.

## Contenido del directorio

```
consultas.md    las queries de esta industria, con marcadores de resultado
1-mercado.md    test del auxiliar, tamaño, intermediario, vía de pago, ancla de precio
2-dolor.md      EVIDENCIA — cero ideas de producto
3-oferta.md     incumbentes, precios COP, el hueco
4-tesis.md      HIPÓTESIS — el único archivo del directorio donde se opina
briefs/         crudos de esta industria
entrevistas/    notas de llamadas con humanos
```
