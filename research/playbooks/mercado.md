---
description: Mapea un sector de la economía colombiana — test del auxiliar, intermediario, vía de pago, mecanismos, ancla de precio. Sin last30days.
argument-hint: <slug> | --comparar <slug1,slug2,slug3>
---

# /mercado — mapa de sector

Etapa 1. Decide **dónde** buscar dolor, antes de gastar un run buscándolo. El
slug sale de `research/barrido-industrias.md`, no de la intuición.

No usa `last30days`. Usa el WebSearch del host, que corre fuera del sandbox de
Bash y por lo tanto no necesita tocar la allowlist de red.

Argumento: `$ARGUMENTS`

## Paso 0 — el test del auxiliar

Antes de recolectar nada:

> ¿Un auxiliar de salario mínimo puede hacer esto, si le das tiempo suficiente?

- **No puede, a ningún salario** → la restricción 1 no aplica. Nombrá cuál de los
  cinco imposibles es (coordinar entre organizaciones, optimizar, detectar en
  volumen, reaccionar en tiempo real, ser prueba ante un tercero). Es la mejor
  posición posible y cambia todo lo demás: no hay que buscar un ancla contra la
  cual comparar horas.
- **Sí puede** → el sector solo califica si el campo 3 encuentra una de las siete
  vías. Sin ninguna, se escribe el mapa igual y se recomienda no correr `/dolor`.

## Qué recolectar — siete campos, todos con URL

Si un campo no se puede sostener con fuente, se escribe `sin dato` — nunca se
estima.

### 1. Tamaño y forma
Cuántas empresas formales hay en Colombia en ese sector, y qué porcentaje son
micro y pequeñas. Fuentes: Confecámaras (registro RUES), DANE, el gremio del
sector. Lo que importa no es el total: es **cuántas están en el rango que puede
pagar algo** (típicamente pequeña y mediana, no micro).

### 2. El intermediario que agrega el dolor
La pregunta más importante del playbook. ¿Existe alguien que sufre el mismo
problema multiplicado por N clientes? La tabla de intermediarios ya identificados
está en `CLAUDE.md` → restricción 2. Otros candidatos según el sector:

- contador público independiente o firma contable (20–60 clientes)
- operador tecnológico / proveedor autorizado de facturación
- gremio o asociación (Fenalco, Colfecar, Acopi, Asobancaria, Andi…)
- distribuidor mayorista o franquiciante
- outsourcing de nómina o de BPO contable

**Nombralo concretamente.** "Los contadores" no sirve; "el contador
independiente que lleva 30 PYMEs de comercio en Medellín" sí. Anotá también si es
además el **canal de distribución** — cuando lo es, vale el doble. Si no existe
intermediario, el sector es mucho más caro de vender y hay que decirlo.

### 3. La vía de pago — cuál de las siete
El campo que decide si hay negocio. Basta **una** de las siete vías de
`CLAUDE.md` → restricción 1, y la multa es una de siete, no el filtro. Recorré
las siete y marcá las que apliquen, cada una con cifra y fuente:

1. **Ya pagan por algo peor** — consultor, outsourcer, licencia legacy,
   contratista. Es la más confiable y la única verificable sin hablar con nadie.
2. **Plata que no entra** — glosa, cartera, facturas que no se pueden radicar.
3. **Penalidad regulada** — multa, sanción, caducidad, clausura. Nombrá entidad,
   norma y monto. Entidades según el sector: DIAN, Supersociedades, SIC,
   Supersalud, Mintransporte, Invima, UGPP, MinTrabajo, Supervigilancia, ANM.
4. **Insumo escaso** — un profesional titulado y caro es el cuello de botella.
5. **Requisito para vender** — el cliente grande exige el certificado.
6. **Parte del producto que el cliente revende.**
7. **Desbloquea financiamiento** — factoring, historial de crédito.

Si ninguna aplica, decilo explícitamente: *el único argumento es ahorrar horas de
una persona mal pagada y hoy nadie gasta un peso en el problema*. Eso es "no
califica todavía", no "no encontré la multa".

**Disposición ≠ capacidad.** Un sector puede querer pagar y no poder —un
acueducto comunitario tiene sanción clarísima y caja mínima—. Anotá cuál de las
dos es.

### 4. Los mecanismos en juego
De los diez mecanismos de `CLAUDE.md`, cuáles aplican. **El trámite que
encontrás suele ser la punta visible de un problema mayor**: detrás del RIPS está
la conciliación IPS↔EPS, detrás del manifiesto RNDC está el despacho y el precio
del flete. Nombrá los dos, el visible y el de fondo.

Si alguno cae en los mecanismos 2 a 5, decilo: ahí el auxiliar no compite a
ningún precio, y es donde hay que buscar el dolor aunque sea más difícil.

### 5. Estacionalidad
¿Hay pico? ¿Cuándo? Un pico anual de tres semanas es una oportunidad, porque no
se resuelve contratando. Ejemplos: exógena (abril–mayo), renta personas
naturales (agosto–octubre), cierre fiscal (enero–marzo). Es una **bandera**, no
un eje del veredicto: para coordinación o despacho no significa nada.

### 6. El ancla de precio
El número contra el que competís. **No asumas que es el salario** — depende de la
vía del campo 3:

- **Vías 2, 3 y 5** → costo empleador del rol manual. Buscá en Computrabajo,
  elempleo y Magneto vacantes reales del rol (auxiliar contable, analista de
  glosas, programador de turnos, digitador…), registrá el rango COP/mes y
  **multiplicá por ~1.5** por prestaciones y parafiscales.
- **Vía 4** → la tarifa del profesional titulado (geólogo, director técnico,
  revisor fiscal). Es mucho más alta, y acá la restricción 1 se invierte a favor.
- **Vía 1** → lo que ya se le paga al consultor, outsourcer o proveedor legacy.
  Tarifas de consultoría publicadas y precios en COP de los incumbentes.

Anotá cuántas **vacantes activas** hay del rol manual. Para el mecanismo 1 es un
dato de precio; para los mecanismos 2–10 es **evidencia de dolor**: un cargo
abierto de "analista de glosas" prueba que el problema existe, tiene presupuesto
y hoy se resuelve con gente.

### 7. Software ya instalado
Qué usan hoy. En Colombia el piso suele ser Excel y WhatsApp, y encima
Siigo, World Office, Helisa, Contapyme, Alegra, Loggro, Ofima, o SAP Business
One en las medianas. Si el sector ya está saturado de software, el hueco tiene
que ser específico, no general.

## Modo comparación

Con `--comparar`, hacé los siete campos para cada sector y cerrá con una tabla y
una recomendación explícita:

| Sector | Empresas objetivo | Intermediario | ¿Puede el auxiliar? | Vía de pago | Mecanismos | Ancla de precio | Software actual |
| --- | --- | --- | --- | --- | --- | --- | --- |

La recomendación tiene que nombrar **por qué** gana el que gana, en términos de
las tres restricciones, y **qué la refutaría**.

## Salida

`research/industrias/<slug>/1-mercado.md`.

Si la industria todavía no tiene directorio, creálo primero:

```bash
scripts/nueva-industria.sh <slug> "<Nombre legible>"
```

Cerrá actualizando el bloque "De un vistazo" del `README.md` de la industria
—incluida la sección "Por qué esta industria", con la fila y el Σ del barrido— y
su fila en `research/INDICE.md`.

Si corriste `--comparar`, creá un directorio por cada sector comparado y además
escribí la tabla comparativa en `research/INDICE.md`, en una sección
`## Comparación <fecha>`.

## Reglas

- Cada cifra con URL. Cifra de proveedor se marca inline como
  `(cifra de proveedor, no independiente)`.
- Nada de proponer producto todavía. Ni una línea.
- Si un sector no tiene intermediario identificable **y** ninguna de las siete
  vías, decilo y recomendá descartarlo, en vez de forzar un mapa completo.
- Cerrá diciendo **dónde va a estar la evidencia** del siguiente paso: YouTube
  para el mecanismo 1, Facebook y ofertas de empleo para los mecanismos 2–10,
  entrevistas para coordinación. `/dolor` arranca de ahí.
