---
description: Mapea la oferta existente para un dolor — incumbentes, precios reales en COP, reseñas de 2 y 3 estrellas, y el hueco.
argument-hint: <slug>
---

# /oferta — panorama competitivo

Etapa 3. El objetivo no es listar competidores: es encontrar **qué no cubren**,
y a qué precio está anclado el mercado.

Argumento: `$ARGUMENTS`

## Paso 1 — inventario de incumbentes

Quién resuelve esto hoy en Colombia. Tres capas, y hay que mirar las tres:

- **El vertical del sector** — el software que se vende específicamente a esta
  industria. Suele ser local, caro de encontrar y sin precio público: software de
  droguería, de PH, de RNDC, de cuentas médicas, PMS hotelero.
- **El horizontal que ya está instalado** — suites contables y ERP que el sector
  ya compró y que podrían agregar el módulo: Siigo, World Office, Helisa,
  Contapyme, Alegra, Loggro, Ofima, Zeus, TNS, y en las medianas SAP Business One,
  Odoo o Dynamics BC con sus implementadores colombianos (que a veces son el
  verdadero competidor).
- **El stack real** — Excel, WhatsApp, correo, y el portal del regulador.
  **Casi siempre es el líder de mercado.** No lo omitas de la matriz.

Si la vía de pago de `1-mercado.md` §3 es la 1 (ya pagan por algo peor), agregá
una cuarta capa: **el competidor humano** — el consultor, el outsourcer o el BPO
que hoy cobra por hacerlo. Su tarifa es el precio que el mercado ya aceptó.

## Paso 2 — precio real, en COP

Página de precios, no estimación. Si no publican precio, decilo: "precio no
público, requiere cotización" es un dato competitivo en sí mismo (significa que
venden con fuerza comercial, lo cual es una barrera y una oportunidad).

Anotá por plan: precio mensual COP, límite de usuarios, límite de documentos o
transacciones, y si lo que resuelve el dolor está incluido o es un módulo aparte.

**El módulo aparte es la señal más útil de todo el playbook.** Si los cinco
incumbentes cobran esa función como add-on, el mercado ya demostró que se paga
por separado.

## Paso 3 — reseñas de 2 y 3 estrellas

Las de 1 estrella son gente furiosa por soporte; las de 5 son plantadas. **El
oro está en 2 y 3**: usuarios que se quedaron y describen exactamente qué les
falta.

Dónde: web (Capterra, GetApp, Software Advice, Google Reviews de la empresa) y
los comentarios de YouTube bajo los tutoriales del propio proveedor —
`scripts/yt-comentarios.sh "<marca> tutorial"` funciona igual de bien acá.

## Paso 4 — runs de comparación

Aquí, y **solo aquí**, los nombres de marca son consultas válidas:

```
"Siigo vs Alegra"        "World Office vs Helisa"
"<vertical A> vs <vertical B>"     "<incumbente> vs Excel"
```

Dispara `QUERY_TYPE=COMPARISON` en la skill, que tiene plantilla propia y trata
las marcas como entidades. Máximo dos o tres comparaciones; no barras todas las
combinaciones.

## Paso 5 — el hueco

Cerrá con tres afirmaciones concretas, cada una apuntando a evidencia:

1. **Qué hace todo el mundo igual** (y por lo tanto no es diferenciación).
2. **Qué no hace nadie** — con la reseña o el comentario que lo demuestra.
3. **Por qué no lo hacen.** Esta es la pregunta que la gente se salta. Casi
   siempre hay una razón: el mercado es muy chico, la regulación cambia todos
   los años, requiere integración con un sistema cerrado, o el margen no da.
   Si no encontrás la razón, **asumí que existe y que no la viste todavía**.

Un patrón frecuente: los incumbentes cubren bien el mecanismo 1 —generan el
documento— y nada de los mecanismos 2 a 5. Si el hueco es ahí, decilo así, porque
es el hueco que no se cierra contratando gente.

## Salida

`research/industrias/<slug>/3-oferta.md`:

```markdown
# 3 · Oferta — <industria>

## Matriz
| Producto | Precio COP/mes | ¿Cubre el dolor? | ¿Módulo aparte? | Fuente |
| --- | --- | --- | --- | --- |
| Excel + WhatsApp | 0 | parcial, a mano | — | — |

## Reseñas 2–3 estrellas
- "<cita>" — <producto>, <fecha> · [fuente](url)

## El hueco
1. Todos hacen: …
2. Nadie hace: … (evidencia: …)
3. Por qué no lo hacen: …

## Ancla de precio
El mercado paga <rango COP> por <cosa>. Ancla de 1-mercado.md §6: <cifra>,
tipo <salario del rol manual / tarifa del profesional escaso / lo que ya se
paga hoy>.
```

Cerrá actualizando el `README.md` de la industria y su fila en
`research/INDICE.md`.

## Reglas

- Precio con URL de la página de precios, con fecha de consulta.
- Marcá inline lo que venga del marketing del propio proveedor.
- El ancla de precio **no es automáticamente el salario de un auxiliar**: es la
  que quedó elegida en `1-mercado.md` §6, según la vía de pago.
- Si un competidor colombiano no tiene precio público **ni** reseñas
  encontrables, decilo — no lo llenes con suposiciones.
