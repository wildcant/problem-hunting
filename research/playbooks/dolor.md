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
./scripts/yt-comentarios.sh "<consulta del trámite>" 8 200
```

Corrélo para 2 o 3 consultas distintas del mismo trámite. El script escribe en
`research/briefs/` (scratch del motor); movelo después a
`research/industrias/<slug>/briefs/`.

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

## Paso 8 — filtrar y escribir

Aplicá las reglas de evidencia de `CLAUDE.md`. Descartá explícitamente:

- posts de otros founders validando ideas
- tutoriales de proveedor tratados como si fueran queja
- cifras de case studies de proveedor sin marcar

Escribí **todo** en `research/industrias/<slug>/2-dolor.md`. Cada fila que
califica lleva:

- un **ID** (`D1`, `D2`, …) — es lo que va a citar `4-tesis.md`
- el **mecanismo**, de los diez
- la celda de costo con **cuál de las siete vías** aplica. Una cifra sin vía
  nombrada no cierra la fila: va a "Registrado pero no califica", diciendo qué
  falta exactamente.

Mové los crudos a `research/industrias/<slug>/briefs/`. Actualizá el `README.md`
de la industria (estado, siguiente paso, "De un vistazo") y su fila en
`research/INDICE.md`.

**Verificá cada URL con grep contra el brief crudo antes del commit.** Nunca
reconstruyas una URL de memoria.

## Criterio de parada

Parás cuando pase una de dos cosas:

- tenés 2 o 3 problemas con recurrencia y costo con vía nombrada, listos para
  `/oferta`; o
- tres consultas distintas del banco no produjeron nada **en la lane correcta
  para el mecanismo**. En ese caso el resultado **es** "esta industria no tiene
  dolor detectable en las fuentes disponibles" — escribilo y pasá a la siguiente.
  Es un resultado válido y ahorra semanas.

Un pase vacío que solo probó YouTube sobre un mecanismo 2–5 no es un criterio de
parada: es la lane equivocada.
