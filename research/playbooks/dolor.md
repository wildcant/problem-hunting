---
description: Busca dolor operativo real en una industria colombiana — lane según el mecanismo, con las reglas de evidencia del repo.
argument-hint: <slug>
---

# /dolor — búsqueda de dolor

Etapa 2. Aquí sí corre el motor. El orden importa: la lane correcta depende del
mecanismo que `1-mercado.md` §4 dejó nombrado.

Argumento: `$ARGUMENTS`

## Paso 0 — verificar el entorno (obligatorio)

El hook de SessionStart no corre después de un `/clear`, y sin él
`--save-dir` se expande a vacío:

```bash
env | grep -q LAST30DAYS_MEMORY_DIR || source .claude/last30days.env
echo "MEMORY_DIR=$LAST30DAYS_MEMORY_DIR  PYTHON=${LAST30DAYS_PYTHON:-python3}"
```

Si `doctor` no tiene cache fresco, corrélo. Una fuente **gratis** que reporte
NOT WORKING por host inalcanzable se para y se listan los hostnames. Una fuente
en `COULD BE ON` no está rota: está sin configurar. No la reportes como falla.

Ignorá el `FIRST_RUN_DETECTED` de SKILL.md — ver `CLAUDE.md`, problema conocido 2.

## Paso 1 — elegir la lane según el mecanismo

Abrí `1-mercado.md` §4 y mirá qué mecanismos quedaron nombrados. **Esto decide
todo lo que sigue**, porque las fuentes no son intercambiables:

| Mecanismo | Lane principal | Lane de apoyo |
| --- | --- | --- |
| **1** — generar y radicar | comentarios de YouTube (paso 3) | web, motor |
| **2–5** — coordinar, optimizar, detectar, despachar | **ofertas de empleo (paso 4) y Facebook (paso 6)** | entrevistas — para coordinación no hay atajo |
| **6–10** — profesional escaso, cobranza, demanda, prueba, rotación | ofertas de empleo, Facebook | web |

**Nadie sube un tutorial de "cómo conciliar con la EPS".** Si el mecanismo no es
el 1 y arrancás por YouTube, el pase vuelve vacío y la conclusión va a ser falsa:
parecerá que no hay dolor cuando lo que no hay es tutorial.

## Paso 2 — armar el plan de consultas

Sacá las consultas de `research/industrias/<slug>/consultas.md`, y las genéricas
de `research/consultas.md`. La mezcla depende del mecanismo:

- **Mecanismo 1:** 3 frases de dolor + 2 strings de error + 2 nombres de trámite.
- **Mecanismos 2–10:** las formas 2 y 3 **no existen** —no hay formulario ni
  mensaje de error—. Van 5 o 6 **frases de dolor**, escritas como las diría el
  que sufre y no como las nombra el sector: *"la EPS me glosó todo"*, *"no me
  cuadra el turno"*, *"el cliente no me paga y no sé cuánto me deben"*. Más las
  búsquedas de cargos del paso 4.

**Cero nombres de marca sueltos.** Si la industria no tiene consultas todavía,
construilas con la taxonomía de `CLAUDE.md` y **agregalas a
`research/industrias/<slug>/consultas.md`** al terminar, con su marcador de
resultado. Un descarte medido va al banco compartido `research/consultas.md`.

## Paso 3 — comentarios de YouTube (lane principal del mecanismo 1)

Es el yacimiento para trámites y documentos.

```bash
./scripts/yt-comentarios.sh "<consulta del trámite>" 8 200 --industria <slug>
```

Corrélo para 2 o 3 consultas distintas del mismo trámite. Con `--industria`
escribe directo en `research/industrias/<slug>/briefs/` — no lo muevas a mano.
Si un video puntual no sale en la búsqueda pero la evidencia ya lo señaló,
agregalo con `--mas-videos ID1,ID2`.

**Cada ítem sale con un ID estable** (`YT-<video>-<hash>`) derivado del
`comment_id` nativo, y con un permalink `watch?v=…&lc=…` que abre YouTube **en
ese comentario**. Citá el ID en `2-dolor.md`; no pegues URLs a mano.

Leé la salida con tres lentes separadas:

1. **Vistas del tutorial = tamaño del dolor.** 116.000 vistas en un tutorial de
   un trámite tributario de un solo país es una señal enorme por sí sola.
2. **Comentarios-pregunta = el punto exacto de fricción.** Agrupá por *qué campo
   o paso* rompe. Tres personas distintas atascadas en el mismo campo es
   recurrencia, y es más fuerte que un hilo largo de Reddit.
3. **Comentarios con la palabra sanción/multa = el costo.** Ahí está la cifra que
   piden las reglas de evidencia. Ojo: el miedo a la sanción **no** es la cifra.

El script filtra elogios y autopromo, pero revisá igual: el filtro es
heurístico, no un juez.

## Paso 4 — ofertas de empleo (lane principal de los mecanismos 2–10)

WebSearch sobre Computrabajo, elempleo y Magneto. `--hiring-signals` del motor
**no sirve** acá: solo lee ATS gringos.

Buscá el cargo que hace la tarea a mano: *analista de glosas*, *auditor de
cuentas médicas*, *programador de turnos*, *analista de cartera*, *coordinador de
despacho*, *auxiliar de conciliación*. Para cada vacante anotá qué dice el perfil
que la persona tiene que hacer a mano, el rango salarial, y cuántas hay abiertas.

**Un cargo abierto prueba tres cosas de una:** el problema existe, tiene
presupuesto, y hoy se resuelve con gente. Para los mecanismos 2–10 eso es
evidencia de dolor, no solo un dato de precio — y la descripción del cargo suele
ser la mejor fuente que vas a tener sobre el workaround actual.

## Paso 5 — el run del motor

```bash
"${LAST30DAYS_PYTHON:-python3}" "$SKILL_DIR/scripts/last30days.py" "<consulta>" \
  --plan "$PLAN_FILE" \
  --search=youtube,web \
  --days 90 --deep --emit=compact --store \
  --save-dir="$LAST30DAYS_MEMORY_DIR"
```

En la nube, agregá `--web-backend=parallel-mcp`.

Apenas termine, **convertilo en evidencia citable** — el JSON del motor se
sobrescribe en la corrida siguiente:

```bash
scripts/l30d-brief.sh <slug> "<etiqueta del run>"
```

Si la salida dice `CORRIDA DEGRADADA`, algún lane vino limitado o falló: esa
corrida **no puede marcar una consulta como ❌**, solo `⚠️ probado, degradado`.

Sin `--discover`. Sin `--drill`. Sin topics de marca sueltos.

## Paso 6 — grupos de Facebook (manual)

Para los mecanismos 2–10 es **fuente principal**, no último recurso: es donde
está la conversación que no tiene tutorial. Para el mecanismo 1, es a donde se va
cuando hay recurrencia pero ninguna cifra de costo.

Seguí `research/facebook/README.md` al pie de la letra: solo lectura, tope de
~20 cargas de página, y **solo con un humano mirando**.

## Paso 7 — validación de patrón en inglés (opcional, barato)

Si el dolor parece genérico y no específico de Colombia, corré un run separado
contra las comunidades anglo para ver si el patrón existe allá y cómo lo
resolvieron:

```bash
--dedicated-subreddits=Bookkeeping,Accounting --subreddits=smallbusiness,taxpros
```

Esto **valida el patrón, no el mercado**. Un dolor que ya tiene diez soluciones
en EE.UU. y ninguna en Colombia puede ser una oportunidad de localización — o
una señal de que el mercado local no paga. No confundas las dos.

## Paso 8 — agrupar y escribir el catálogo

**Esta etapa produce un catálogo, no un veredicto.** La salida es el listado de
problemas de la industria — la materia prima del sitio. Decidir cuál construir
es trabajo de `/veredicto`.

Aplicá las reglas de evidencia de `CLAUDE.md`. Descartá explícitamente:

- posts de otros founders validando ideas
- tutoriales de proveedor tratados como si fueran queja
- cifras de case studies de proveedor sin marcar

### Agrupá primero, escribí después

El error caro es escribir fila por comentario. **Agrupá los ítems del brief por
*qué se rompe*** y contá cuántas personas distintas describen cada cosa. Ese
conteo es la recurrencia. Un solo brief de 40 ítems suele contener 8 a 12
problemas distintos; si sacás 2, agrupaste de más.

Cuidado con dos sesgos que ya nos pasaron:

- **Confundir "llamativo" con "recurrente".** Un stacktrace de Java se ve muy
  concreto y puede tener un solo caso, mientras "¿estoy obligado a presentar
  esto?" se ve genérico y tener cinco. Contá, no impresiones.
- **Meter dos problemas en un grupo** porque suenan parecido. "Puse mal el
  consecutivo" y "quiero reemplazar un envío ya radicado" son distintos.

### El estado de cada fila

| Estado | Cuándo |
| --- | --- |
| `candidato` | **≥2 IDs de evidencia independientes**. Entra al catálogo y al sitio |
| `calificado` | además: costo con **una de las siete vías** nombrada |
| `descartado` | con la razón escrita |

Escribí **todo** en `research/industrias/<slug>/2-dolor.md`. Cada fila lleva:

- un **ID** (`D1`, `D2`, …) — es lo que va a citar `4-tesis.md`
- el **problema en la voz del que sufre**, no en jerga del sector
- el **mecanismo**, de los diez
- **B2B o B2C** y el **eje D** (¿podés listar a los compradores hoy?)
- una **solución en software de una línea** — es lo único interpretativo que se
  permite acá, y va en su propia columna
- los **IDs de evidencia** (`YT-…`, `L3D-…`), nunca URLs pegadas a mano
- el **costo con su vía**, si ya cerró

Actualizá el `README.md` de la industria (estado, siguiente paso, "De un
vistazo", **conteo de candidatos**) y su fila en `research/INDICE.md`.

### Verificá antes del commit

```bash
scripts/verificar-evidencia.sh <slug>
```

Comprueba que todo ID citado exista en un brief, que ninguna URL de plataforma
minada se haya inventado, y que cada fila cite ≥2 IDs. El hook de pre-commit lo
corre solo si activaste `git config core.hooksPath scripts/hooks`.

## Criterio de parada

Parás cuando pase una de dos cosas:

- el catálogo tiene **todos los grupos del brief representados** y al menos 2 o
  3 subieron a `calificado` con vía nombrada, listos para `/oferta`; o
- tres consultas distintas del banco no produjeron nada **en la lane correcta
  para el mecanismo**. En ese caso el resultado **es** "esta industria no tiene
  dolor detectable en las fuentes disponibles" — escribilo y pasá a la siguiente.
  Es un resultado válido y ahorra semanas.

Dos cosas que **no** son criterio de parada:

- Un pase vacío que solo probó YouTube sobre un mecanismo 2–5: es la lane
  equivocada, no una industria sin dolor.
- Una corrida del motor marcada `⚠ CORRIDA DEGRADADA`. Un lane con rate limit
  devuelve pocos ítems, igual que una industria sin dolor. No se distinguen, así
  que no concluye nada — repetila.
