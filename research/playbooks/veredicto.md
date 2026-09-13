---
description: Puntúa un dolor investigado contra las tres restricciones del mercado colombiano y escribe la tesis (o el descarte).
argument-hint: <slug>
---

# /veredicto — ¿vale la pena?

Etapa 4. La única etapa donde se permite opinar. Requiere que existan
`2-dolor.md` y `3-oferta.md` en el mismo directorio de industria.

Argumento: `$ARGUMENTS`

## Las dos compuertas

Se evalúan primero. Si falla una, **se descarta** y no se puntúa nada más. El
descarte se escribe igual, con la razón — un descarte razonado es producto útil
del pipeline.

### Compuerta A — el test del auxiliar

> ¿Un auxiliar de salario mínimo puede hacer esto, si le das tiempo suficiente?

**Si no puede, a ningún salario** → la compuerta pasa de entrada. Nombrá cuál de
los cinco imposibles es (coordinar entre organizaciones, optimizar, detectar en
volumen, reaccionar en tiempo real, ser prueba ante un tercero). No estás
vendiendo horas ahorradas: no hay nada contra lo que comparar el precio.

**Si sí puede** → hace falta una de las siete vías de `CLAUDE.md`, con cifra, y
el costo anual del dolor tiene que superar el **ancla de precio** de
`1-mercado.md` §6. Cuál es el ancla depende de la vía:

- vías 2, 3 y 5 → costo empleador del rol manual (sueldo × 1.5 × 12)
- vía 4 → la tarifa del profesional titulado, que es mucho más alta
- vía 1 → lo que ya se está pagando hoy al consultor, outsourcer o proveedor

Si el dolor cuesta menos que su ancla, **no hay negocio**, por más real que sea.

*Sobre la vía 3:* una sanción se evalúa por valor esperado (monto ×
probabilidad), no por el monto publicado. Una multa que nunca se aplica vale
menos que una cartera detenida, que ya pasó.

*Disposición ≠ capacidad:* si el sector quiere pagar y no puede, la compuerta no
falla pero el eje de vía de pago baja. Decí cuál de las dos es.

### Compuerta B — ¿la oferta actual ya lo cubre?

Si un incumbente lo resuelve bien y a precio accesible, se descarta. "Lo resuelve
mal" no es lo mismo que "no lo resuelve": pedí la reseña que lo demuestre.

## El puntaje — sobre 10

| Eje | Pregunta | Puntos |
| --- | --- | --- |
| Vía de pago | ¿Está nombrada una de las siete, con cifra y fuente? | 0–3 |
| Escala del intermediario | ¿Alguien sufre esto ×N clientes? ¿Está nombrado? | 0–3 |
| Mecanismo | ¿En qué terreno se juega, de los diez mecanismos? | 0–2 |
| Canal | ¿Hay una vía identificada para llegar (gremio, intermediario, distribuidor)? | 0–2 |

**Vía de pago (0–3).** 0 = ninguna de las siete, y eso significa que el único
argumento es ahorrar horas de una persona mal pagada mientras nadie gasta un peso
hoy → descarta. 1 = vía nombrada sin cifra, o con cifra y sin capacidad de pago.
2 = vía nombrada con cifra verificable. 3 = además ya sale plata por esto hoy
(vías 1, 2 o 4), que es la señal más confiable y la única verificable sin
entrevistar a nadie.

**Mecanismo (0–2).** 0 = solo el mecanismo 1 (generar y radicar) y el auxiliar sí
puede hacerlo con tiempo. 1 = mecanismo 1 con un volumen o plazo que el auxiliar
no absorbe, o alguno de los mecanismos 6–10. 2 = mecanismos 2 a 5 —coordinar,
optimizar, detectar, despachar—, donde el auxiliar no compite a ningún precio.

Interpretación:

- **8–10** — construilo. Andá a entrevistas ya.
- **5–7** — hipótesis viva. Necesita más evidencia en el eje más flojo antes de
  invertir. Nombrá cuál.
- **0–4** — descartá. Escribí por qué.

**Un puntaje bajo en un eje no es lo mismo en todos los ejes.** Una industria
puede no tener penalidad y seguir siendo buena por la vía 6 —propiedad
horizontal es el caso—; pero ninguna sobrevive sin vía de pago ni sin
intermediario.

## Lo que el puntaje no puede decidir

**Nada de esto reemplaza hablar con diez personas del sector.** El pipeline sirve
para elegir a quiénes llamar y qué preguntarles, no para saltarse la llamada. Un
puntaje de 9 sin una sola entrevista sigue siendo una corazonada con tabla.

Por eso el veredicto siempre cierra con las tres preguntas de `CLAUDE.md`
aterrizadas a esta industria, y esas preguntas son la parte más valiosa de la
salida.

## Salida — `research/industrias/<slug>/4-tesis.md`

Escribí la tesis ahí, actualizá el bloque "De un vistazo" y las casillas de
etapa en el `README.md` de la industria, y actualizá su fila en
`research/INDICE.md` (estado y puntaje).

```markdown
## <nombre corto de la tesis>

**Veredicto:** <construir | hipótesis viva | descartado> — <puntaje>/10
**Fecha:** <YYYY-MM-DD>

**El problema:** <una línea, en la voz del que lo sufre>
**Quién lo tiene:** <rol concreto, no "las empresas">
**Quién pagaría:** <el intermediario nombrado, y por qué él y no el usuario final>
**Mecanismo(s):** <de los diez>

**Compuerta A — el test del auxiliar:** pasa / no pasa
<si no puede: cuál de los cinco imposibles. Si sí puede: la vía, la cifra, y el
cálculo contra el ancla de 1-mercado.md §6>

**Compuerta B — la oferta actual:** pasa / no pasa — <por qué, con la reseña>

| Eje | Puntos | Sostenido por |
| --- | --- | --- |
| Vía de pago nombrada | x/3 | `D1` |
| Escala del intermediario | x/3 | `D2` |
| Mecanismo | x/2 | `D1` |
| Canal | x/2 | `D3` |

**El eje más flojo:** <cuál, y qué evidencia lo cerraría>

**Las tres preguntas para la entrevista:**
0. <si te doy dos personas más mañana, ¿esto se resuelve?>
1. <¿en qué línea del presupuesto sale esto hoy, y quién la firma?>
2. <si mañana desaparece la herramienta o la persona, ¿qué se rompe primero?>

**Qué me haría abandonar esto:** <condición concreta y falsable>
```

## Reglas

- Cada eje cita el **ID de la fila** de `2-dolor.md` que lo sostiene (`D1`, `D2`,
  …). Un eje sin ID vale 0, no importa cuán obvio parezca.
- La celda de costo de esa fila tiene que nombrar su vía. Si no la nombra, la
  fila no estaba cerrada y el eje de vía de pago no puede valer 2 ni 3.
- "Qué me haría abandonar esto" es obligatorio y tiene que ser falsable. Si no
  podés escribir qué te haría cambiar de opinión, no investigaste: te
  enamoraste.
