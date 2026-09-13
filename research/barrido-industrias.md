# Barrido de industrias — filtro de 60 sectores para Colombia

Hecho 2026-09-12. Archivo **compartido** y **de screening**.

> ⚠️ **Esto es opinión, no evidencia.** Es el equivalente global de un
> `4-tesis.md`: prioriza dónde buscar, no afirma que ahí duela. Ninguna fila de
> este archivo puede pasar a un `2-dolor.md` sin correr `/dolor <slug>`. Los
> mandatos y sanciones citados sí están verificados contra fuente (link al
> final); las inferencias sobre *quién sufre* y *cuánto paga* no.

Punto de partida: la taxonomía sectorial de renta variable (estilo TRBC) que
trajo el usuario, 60+ sectores. Es una taxonomía diseñada para clasificar
**empresas listadas en bolsa**, y esa es su principal limitación acá — se le
caen justo los sectores donde Colombia tiene masa de pymes. Por eso hay dos
partes: el filtro de la lista, y las **siete industrias que la lista no tiene**.

---

## El filtro

Cuatro criterios, cada uno 0–2 puntos, derivados de las tres restricciones de
`CLAUDE.md`. Máximo 8.

| | Criterio | 0 | 2 |
| --- | --- | --- | --- |
| **M** | **Masa** de empresas obligadas en Colombia | oligopolio de 3–10 actores | miles de pymes |
| **I** | **Intermediario** nombrable que sufre el dolor N veces | nadie agrega; cada empresa está sola | existe y se puede nombrar hoy |
| **$** | **Disposición a pagar** — ver las siete vías abajo | el único argumento es "ahorra horas" y no hay presupuesto | ya sale plata por esto todos los meses |
| **H** | **Hueco**: el incumbente no lo tomó | Siigo/SAP/un global ya está | nicho sin dueño claro |

Bandera extra: **⏱ pico estacional**.

### Las siete vías a la disposición a pagar

La multa es **una** de siete, no el filtro. Cualquiera de estas basta para
$ = 2, y varias son más fuertes que la sanción porque son continuas en vez de
probabilísticas:

1. **Ya pagan por algo peor.** Un consultor, un outsourcer, un proveedor legacy,
   una licencia vieja, un contratista. **Presupuesto existente es la señal más
   confiable de todas** y la única verificable sin entrevistar a nadie.
2. **Plata que no entra.** Glosas, cartera, facturas que no se pueden radicar,
   ventas perdidas. Más fuerte que una multa: la multa *puede* no llegar, la
   caja detenida ya pasó.
3. **Penalidad regulada.** Multa, sanción, caducidad, clausura, pérdida de
   deducción.
4. **Insumo escaso.** El cuello de botella es un profesional titulado y caro —el
   geólogo que avala el FBM, el director técnico de la droguería, el revisor
   fiscal—. El software se cotiza contra **su** tarifa, no contra el salario de
   un auxiliar. Acá la restricción 1 se invierte a favor.
5. **Requisito para vender.** El cliente grande exige el certificado, la debida
   diligencia o el estándar para comprarte. Se paga para no perder el contrato.
6. **Es parte del producto que el cliente revende.** El portal de residentes que
   la administradora le muestra al conjunto; el app de reservas del hotel. Es
   gasto de venta, no de administración — y la mano de obra mal pagada no compite
   con eso.
7. **Desbloquea financiamiento.** Habilitar la factura para factoring, generar
   el historial que permite el crédito. Ver RADIAN en
   [`comparables-internacionales.md`](comparables-internacionales.md).

**Regla de corte:** $ = 0 descalifica. Y $ = 0 significa una sola cosa —*el
único argumento es ahorrar horas de un auxiliar mal pagado y hoy nadie gasta
un peso en el problema*—, no "no encontré la multa".

### Disposición ≠ capacidad

Un sector puede querer pagar y no poder. Las ESP pequeñas (#7) y los acueductos
comunitarios tienen sanción clarísima y caja mínima. Eso baja $ a 1, y no es lo
mismo que no querer.

### Cómo se verifica $ sin entrevistar a nadie

Las tres son baratas y ninguna requiere hablar con un humano:

- **Ofertas de empleo.** Un cargo abierto para hacer la tarea a mano es un
  presupuesto declarado, con cifra. `CLAUDE.md` ya tiene esta lane: WebSearch
  sobre Computrabajo, elempleo y Magneto.
- **Precios publicados en COP** de los incumbentes. Si alguien ya cobra, alguien
  ya paga. Es además la entrada natural a `/oferta`.
- **Tarifas de consultoría.** Lo que cobra un consultor SG-SST o un oficial de
  cumplimiento externo es el techo de precio del SaaS que lo reemplaza.

---

## El criterio que va ANTES de todos: el test del auxiliar

La restricción 1 de `CLAUDE.md` dice que competimos contra un auxiliar contable
mal pagado. De ahí **no** se sigue que haya que buscar una multa: la salida de un
regulador siempre es un documento, así que anclar el precio en el regulador
encoge el espacio a "generar y radicar formularios". La pregunta que sí ordena
todo es otra:

**¿Un auxiliar de salario mínimo puede hacer esto, si le das tiempo suficiente?**

- **Sí puede** → estás compitiendo contra mano de obra mal pagada y
  **necesitás** un ancla de precio: penalidad, pico estacional, escala del
  intermediario, o alguna de las siete vías de la sección anterior.
- **No puede, a ningún salario** → la restricción 1 **no aplica**. No estás
  vendiendo horas ahorradas; estás vendiendo algo que no existe sin software.

Hay cinco cosas que ninguna persona puede hacer, a ningún salario, y ninguna
produce un documento:

| | Lo que el auxiliar no puede | Por qué |
| --- | --- | --- |
| **Coordinar entre organizaciones** | solo ve **un lado** del problema. Poné 50 auxiliares en la IPS: siguen sin ver el sistema de la EPS |
| **Optimizar** | asignar rutas, precios o turnos no es cuestión de horas, es de cómputo |
| **Detectar en volumen** | encontrar la fuga, la merma o el fraude en 400.000 registros |
| **Reaccionar en tiempo real** | despachar, reprogramar, alertar mientras pasa |
| **Ser prueba ante un tercero** | su palabra no es trazabilidad auditable |

### Los diez mecanismos de valor del software

La tabla de la Parte 2 se apoya sobre todo en el mecanismo 1. Estos son los diez:

| # | Mecanismo | Ejemplo colombiano | ¿Documento? |
| --- | --- | --- | :-: |
| 1 | **Generar y radicar** ante un regulador | RIPS, manifiesto RNDC, FBM, Reporte 75 | sí |
| 2 | **Coordinar entre dos organizaciones** | conciliación IPS↔EPS; generador↔transportador↔conductor; eventos de RADIAN, que exigen que **el comprador** actúe | no |
| 3 | **Optimizar y fijar precio** | flete contra SICE-TAC; revenue management hotelero; ruteo | no |
| 4 | **Detectar lo que nadie mira** | pérdidas no técnicas de energía; merma; fuga de inventario | no |
| 5 | **Despachar recursos físicos** | turnos de guardas, cuadrillas técnicas, ambulancias, rutas escolares | no |
| 6 | **Multiplicar a un profesional escaso** | copiloto del radiólogo, del geólogo, del director técnico | no |
| 7 | **Que la plata entre** | cobranza, recaudo, conciliación de pagos, cartera | no |
| 8 | **Traer demanda** | el software que consigue clientes — lo único que el tendero sí paga | no |
| 9 | **Probar ante un tercero** | trazabilidad de cadena de frío, de origen, de custodia | parcial |
| 10 | **Retener el proceso pese a la rotación** | memoria institucional donde la gente rota cada 8 meses | no |

**Nueve de diez no generan un documento.** Y los mecanismos 2 a 5 son
precisamente donde el auxiliar mal pagado **no compite a ningún precio**: la
mejor posición bajo la restricción 1.

---

## Parte 1 · Los descartes en bloque

De los ~60 sectores de la lista, **41 salen sin necesidad de investigar**. Las
razones se agrupan en cinco.

### a) No es una industria — es una etiqueta

`Any Industry` · `Government Activity` · `Institutions, Associations & …` ·
`Investment Holding Companies` · `Collective Investments` · `Diversified
Industrial Goods Wholesale`

`Government Activity` merece nota aparte: **govtech se descarta a propósito**,
no por falta de dolor sino por ciclo de venta. Contratación pública en Colombia
= licitación, vigencias fiscales y rotación política. Es un negocio válido y es
otro negocio.

### b) Oligopolio: 3 a 20 actores que compran SAP, no SaaS

`Oil & Gas` · `Oil & Gas Related Equipment` · `Coal` · `Uranium` ·
`Electrical Utilities & IPPs` · `Natural Gas Utilities` · `Multiline Utilities` ·
`Telecommunications Services` · `Banking Services` · `Investment Banking` ·
`Chemicals` · `Beverages` · `Containers & Packaging` · `Paper & Forest
Products` · `Consumer Goods Conglomerates` · `Transport Infrastructure` ·
`Automobiles & Auto Parts` · `Residential & Commercial REITs` · `Renewable
Energy`

En todos: M=0. No hay long tail. Y donde sí hay dolor —reportería regulatoria—
el comprador tiene equipo de TI interno y presupuesto de consultoría, que es
otro juego (implementación, no producto).

**Excepción rescatada:** las **ESP pequeñas** (<2.500 usuarios) dentro de
utilities. Va a la Parte 2.

### c) No existe en Colombia a escala relevante

`Aerospace & Defense` · `Semiconductors` · `Biotechnology & Medical Research` ·
`Computers, Phones & Household Electronics` · `Electronic Equipment & Parts` ·
`Integrated Hardware & Software` · `Office Equipment` · `Leisure Products` ·
`Household Goods` · `Machinery, Tools, Heavy Vehicles & Trains`

Hay importadores y distribuidores, pero eso es *retail/logística*, no la
industria. Se cuenta en otra fila.

### d) Existe y sí paga, pero el hueco está tomado

`Textiles & Apparel` · `Personal & Household Products` · `Media & Publishing` ·
`Specialty Retailers` · `Diversified Retail` · `Homebuilding & Construction
Supplies` · `Construction Materials` · `Miscellaneous Educational Service
Providers` · `Software & IT Services`

**$ no es el problema acá.** Casi todos pagan: un retailer ya compra POS y ERP,
una confección ya compra software de producción.

Mueren por **H = 0 e I ≤ 1**: es exactamente el terreno de Siigo, Alegra, Bold y
Shopify, y no hay un intermediario que agregue el dolor. Se descartan por hueco
y por canal, no por disposición a pagar — y el motivo es lo que hay que poder
defender, no la conclusión.

`Software & IT Services` es además nuestro propio sector — vendernos a nosotros
mismos es el error clásico de founder.

### e) Tomado por un incumbente identificado

`Financial Technology (Fintech)` — Bre-B mató el margen del rail; Bold, Nequi y
Daviplata ocupan la superficie. Ver arquetipo B en
[`comparables-internacionales.md`](comparables-internacionales.md).

---

## Parte 2 · Los 14 que pasan el filtro

Ordenados por puntaje. La columna **"por qué pagan"** nombra cuál de las siete
vías aplica — sin ella la fila no vale nada.

| # | Sector (de la lista) | Traducción colombiana | M | I | $ | H | **Σ** | Por qué pagan (vía) |
| --- | --- | --- | :-: | :-: | :-: | :-: | :-: | --- |
| 1 | Healthcare Providers & Services | **IPS pequeñas y consultorios** | 2 | 2 | 2 | 2 | **8** | **plata que no entra** (2): RIPS rechazado ⇒ no se puede radicar; inconsistencia RIPS↔factura ⇒ glosa automática. Además ya pagan facturador tercerizado (1) |
| 2 | Freight & Logistics Services | **Transporte de carga** | 2 | 2 | 2 | 1 | **7** | **penalidad** (3): sin manifiesto RNDC el camión no rueda. Ya pagan proveedor de RNDC/TMS (1) |
| 3 | *(transversal)* | **Cumplimiento laboral y LA/FT** | 2 | 2 | 2 | 1 | **7** | **ya pagan** (1): consultor SG-SST y oficial de cumplimiento son línea de gasto vigente. Multas de refuerzo (3) |
| 4 | Metals & Mining | **Pequeña minería titulada** | 1 | 2 | 2 | 2 | **7** | **insumo escaso** (4): el FBM lo avala un geólogo o ingeniero titulado. Caducidad del título (3) |
| 5 | Real Estate Operations | **Propiedad horizontal** | 2 | 2 | 2 | 0 | **6** | **es parte del producto que revenden** (6): el portal de residentes es lo que la administradora le muestra al conjunto. Cartera de cuotas (2) |
| 6 | Insurance | **Corredores y agencias de seguros** | 1 | 2 | 2 | 1 | **6** | **ya pagan** (1) CRM y sistemas de ramos; comisión en riesgo si se cae la renovación (2) |
| 7 | *(no está en la lista)* | **Agenciamiento aduanero** | 1 | 2 | 2 | 1 | **6** | **penalidad** (3): 100% del FOB por sustracción, 10% por inexactitud. Ya pagan software aduanero (1) |
| 8 | *(no está en la lista)* | **Vigilancia y seguridad privada** | 1 | 1 | 2 | 2 | **6** | **penalidad** (3): $9.000M a 240 empresas solo por no radicar estados financieros. **Requisito para vender** (5): sin licencia no hay contrato |
| 9 | School, College & University | **Colegios privados** | 2 | 1 | 2 | 1 | **6** ⚠️ | **ya pagan** (1) plataforma académica; **parte del producto** (6): el boletín y el portal de padres |
| 10 | Construction & Engineering | **Constructoras medianas** | 2 | 1 | 2 | 1 | **6** | **requisito para vender** (5): sin SG-SST al día no se licita. Ya pagan ERP de obra (1) |
| 11 | Multiline / Water Utilities | **ESP pequeñas (<2.500 usuarios)** | 1 | 1 | 1 | 2 | **5** | **penalidad** (3) fuerte, pero **capacidad de pago mínima** → $ baja a 1 |
| 12 | Hotels & Entertainment | **Hoteles y agencias de viajes** | 2 | 1 | 2 | 0 | **5** ⏱ | **parte del producto** (6): motor de reservas. Ya pagan PMS y channel manager (1) |
| 13 | Food & Drug Retailing / Pharmaceuticals | **Droguerías independientes** | 2 | 1 | 2 | 0 | **5** | **insumo escaso** (4): director técnico 8 horas. Ya pagan software de droguería (1) |
| 14 | Food & Tobacco | **Procesadores de alimentos** | 2 | 1 | 1 | 1 | **5** | **requisito para vender** (5): registro sanitario INVIMA y auditoría del cliente grande |

### Las filas que hay que leer con cuidado

- **Propiedad horizontal (#5).** La Ley 675 no deja al administrador imponer
  sanciones, así que no hay penalidad — pero es de los sectores con disposición a
  pagar más obvia: las administradoras ya le pagan a Jelpit y similares, y el
  portal es parte del servicio que le venden al conjunto. Su problema es **H=0**,
  y eso se resuelve con `/oferta`, no descartándola de entrada.
- **Corredores de seguros (#6), colegios privados (#9) y hoteles (#12)** entran
  por presupuesto vigente, no por sanción. Ninguno muere por plata.
- **Constructoras (#10).** No es "ahorra horas": es la vía 5 — sin SG-SST al día
  no se licita.

**La pregunta de entrevista que se deriva de esto** no es *"¿te han multado?"*,
que casi siempre da no, sino **"¿en qué línea del presupuesto sale esto hoy y
quién la firma?"** — que siempre tiene respuesta, y la respuesta es el precio.

### Por qué el #1 está arriba

Salud junta **las tres restricciones de `CLAUDE.md` a la vez**, cosa que ningún
otro sector de la lista hace:

- **Masa real:** 10.839 IPS habilitadas a jun-2025, **91% privadas**. Más los
  profesionales independientes, que también son prestadores.
- **La vía de pago es la 2, no la 3, y por eso es más fuerte.** Con la Res.
  2275/2023 el RIPS dejó de ser un `.txt` aparte: es **soporte obligatorio de la
  factura electrónica en JSON**, y una inconsistencia entre RIPS y factura hace
  que **la EPS glose automáticamente**. Si MinSalud rechaza el RIPS, la IPS **no
  puede radicar** hasta corregir. No es una multa que puede o no llegar: es caja
  que ya se detuvo.
- **El intermediario está clarísimo:** la firma de facturación y auditoría de
  cuentas médicas, que sufre lo mismo por 30 IPS a la vez.
- **Segundo mandato encima:** HCE interoperable (Ley 2015/2020), plazo vencido
  desde enero de 2025.
- **Señal de estrés:** en el primer semestre de 2025 cerraron 332 IPS y hubo
  6.084 cierres de servicios. Puede leerse como mercado en crisis (malo) o como
  presión que fuerza a profesionalizar el ciclo de ingresos (bueno). **Hay que
  resolver esta ambigüedad antes de invertir tiempo.**

### Por qué el #3 no es un sector sino un producto transversal

SG-SST y SAGRILAFT no pertenecen a una industria: son obligaciones que cruzan
todas. Es el arquetipo C de `comparables-internacionales.md` — la jugada de
Mekari en Indonesia. Y la vía de pago dominante es la 1, presupuesto existente:
el consultor SG-SST y el oficial de cumplimiento externo **ya se están pagando**,
y su tarifa es el techo de precio del producto.

- MinTrabajo impuso **>$18.000 millones en multas de SG-SST en abril de 2024**, y
  la causa dominante fue que las empresas **no sabían qué estándar les aplicaba
  según tamaño y clase de riesgo**. Eso es literalmente un árbol de decisión que
  nadie resolvió.
- En SAGRILAFT las faltas más sancionadas son procedimentales: registro tardío
  del oficial de cumplimiento en SIREL, **Reporte 75 entregado tarde**,
  capacitación insuficiente. Calendario y evidencia documental, o sea, software.

Contra: ya hay incumbentes (SafetYA, Pirani, ISOTools). H=1, no 2.

### La bandera roja que queda

**#9 Colegios privados:** los 11.188 del DUE son un mercado que **se está
contrayendo — más de 700 cerraron en año y medio**. Disposición a pagar hay; lo
que no está claro es que haya a quién cobrarle dentro de tres años. Un mercado
que encoge castiga por churn y por precio a la vez. Entra con la contracción
como primera pregunta, no como nota al pie.

---

## Parte 3 · El problema grande detrás del documento

Releyendo los seis primeros con los diez mecanismos: **en todos, el trámite que
encontré es la punta visible de un problema mayor que no genera papel.** El
documento sirve como puerta de entrada —es lo que la gente busca en Google y lo
que aparece en los comentarios de YouTube— pero no es el producto.

| Sector | Lo que encontré (mec. 1) | El problema grande detrás | Mecanismos |
| --- | --- | --- | --- |
| **Salud — IPS** | RIPS en JSON, radicación | **La conciliación IPS↔EPS.** Cada lado ve la mitad del expediente y la glosa nace en la brecha. Ningún auxiliar la cierra: no tiene acceso al otro sistema. Más agenda, quirófanos y autorizaciones previas | **2**, 5, 7 |
| **Transporte de carga** | Manifiesto RNDC | **El despacho y el precio.** Casar carga, vehículo, propietario y conductor en tiempo real; y cotizar contra SICE-TAC — que es justo por lo que Supertransporte formuló cargos a 10 empresas y 53 generadores | **3**, **5**, 2 |
| **Cumplimiento SST / LA-FT** | Reporte 75, estándares mínimos | **El evento, no el papel.** El accidente que no se investigó a tiempo, el proveedor que entró sin debida diligencia. El documento es la evidencia posterior | 9, 10, 1 |
| **Pequeña minería** | FBM anual | **Control de producción y báscula.** Cuánto salió realmente del título, contra lo declarado y lo pagado en regalías | 4, 6 |
| **Vigilancia privada** | Estados financieros a Supervigilancia | **Programar y verificar miles de turnos y rondas.** Puro despacho en tiempo real. **Cero documentos**, y es el corazón del negocio | **5**, 4, 10 |
| **Propiedad horizontal** | — (nunca tuvo trámite) | **Recaudo de cartera y coordinación con residentes y proveedores.** No produce papel en ninguna parte, y por eso es fácil de subestimar | **7**, 2, 8 |

### Lo que esto implica

**Vigilancia privada y propiedad horizontal valen más de lo que sugiere su
trámite**, porque su valor no pasa por un formulario. PH no tiene problema de
disposición a pagar ni de mecanismo — tiene un problema de **hueco**, y ese sí es
real.

**Y define dónde buscar la evidencia.** El mecanismo 1 se investiga bien con
comentarios de YouTube bajo tutoriales de trámites, que es la lane que
`CLAUDE.md` tiene montada. Los mecanismos 2 a 7 **no aparecen ahí**: nadie sube
un tutorial de "cómo conciliar con la EPS". Viven en:

- **grupos de Facebook** (la lane manual de `research/facebook/`) — que pasa de
  fuente secundaria a fuente principal para todo lo que no sea trámite
- **ofertas de empleo** — un cargo de "analista de glosas" o "programador de
  turnos" es la prueba de que el problema existe, tiene presupuesto y hoy se
  resuelve con gente
- **entrevistas** — para coordinación entre organizaciones no hay atajo

**Esto manda sobre el plan de investigación, no solo sobre la tabla.** Un
`/dolor salud-ips` que solo busque "RIPS rechazado" encuentra una fracción del
problema.

---

## Parte 4 · Las siete que la lista no tiene

La taxonomía es de renta variable global. En Colombia el peso económico está en
formas societarias que ninguna bolsa clasifica. Estas **no salieron del filtro
porque nunca estuvieron en la lista**:

| Industria ausente | Por qué importa en Colombia | Regulador / mandato |
| --- | --- | --- |
| **Agro y pecuario** | La lista no tiene agricultura, punto. En Colombia mover un solo animal exige documento | ICA — **GSMI**, único documento legal para movilizar bovinos, equinos, porcinos, aves…, tramitada en **SIGMA**; requisitos unificados en Res. 8940 de 2024 |
| **Cooperativas y fondos de empleados** | Sector enorme y con reportería propia que ningún ERP comercial cubre bien | Supersolidaria ⚠️ *no verificado en este barrido* |
| **Agenciamiento aduanero** | Ya en la tabla (#7); la lista solo tiene "Freight & Logistics" | DIAN / VUCE / Dto. 1165 de 2019 |
| **Vigilancia y seguridad privada** | Ya en la tabla (#8) | Supervigilancia |
| **Empresas de servicios temporales** | Intermediario laboral puro: sufren nómina y SST por cientos de empleados en misión | MinTrabajo ⚠️ *no verificado* |
| **ESAL, fundaciones y cajas de compensación** | Régimen tributario especial con reportería propia | DIAN / Supersalud ⚠️ *no verificado* |
| **Propiedad horizontal** | Ya en la tabla (#5), con Σ = 6 | Ley 675 de 2001 |

Las tres marcadas ⚠️ son las que hay que investigar antes de la próxima ronda de
priorización. Son huecos de este barrido, no conclusiones.

---

## Veredicto: por dónde seguir

**Abrir directorio ahora (los tres del podio):**

```bash
scripts/nueva-industria.sh salud-ips        "Salud — IPS pequeñas y consultorios"
scripts/nueva-industria.sh transporte-carga "Transporte de carga"
scripts/nueva-industria.sh cumplimiento-sst "Cumplimiento laboral y LA/FT (transversal)"
```

**El orden importa.** Salud primero, y por una razón operativa además de la
puntuación: es el único donde el costo se puede medir con **una sola pregunta en
una llamada** —*¿qué % de tu facturación está glosado?*— sin que el entrevistado
tenga que estimar horas. Una cifra que el entrevistado ya conoce vale más que una
que hay que ayudarle a construir.

**Las tres preguntas** que van en toda entrevista de `/dolor`, sin importar la
industria. La primera es la del test del auxiliar y va primero:

0. *Si te doy dos personas más mañana, ¿esto se resuelve?* — un **no** vale más
   que cualquier multa: significa que no competís contra mano de obra.
1. *¿En qué línea del presupuesto sale esto hoy, y quién la firma?*
2. *Si mañana desaparece la herramienta o la persona que lo hace, ¿qué se rompe
   primero?*

La 0 dice si hay mercado. La 1 da el precio. La 2 distingue entre "molesto" y
"no puedo operar".

**Consultas iniciales sugeridas** (taxonomía de `research/consultas.md`,
tipos 2 y 3 — string de error y nombre del trámite):

```
salud-ips          "RIPS rechazado"  "glosa por RIPS"  "validador RIPS no me deja"
                   "cómo generar RIPS en JSON"  "historia clínica interoperable"
transporte-carga   "RNDC error"  "no me deja generar el manifiesto"
                   "rechazo RNDC"  "SICE-TAC"
cumplimiento-sst   "estándares mínimos SG-SST"  "me visitó el Ministerio de Trabajo"
                   "Reporte 75 UIAF"  "oficial de cumplimiento SAGRILAFT"
```

**Antes de creerle a este archivo, tres cosas que NO sé:**

1. **Si el dolor de RIPS lo siente la IPS o su facturador tercerizado.** Cambia
   completamente quién es el comprador. Es la pregunta de `/mercado`, no de
   `/dolor`.
2. **Si las IPS que cierran son el mercado o son la señal.** 332 cierres en un
   semestre puede ser demanda o puede ser un sector sin capacidad de pago.
3. **Si SafetYA y Pirani ya cerraron el hueco de cumplimiento.** El #3 asume H=1
   sin haber corrido `/oferta`. Puede ser H=0.

---

## Fuentes

**Salud**
- [Res. 2275 de 2023 — MinSalud (PDF)](https://www.minsalud.gov.co/Normatividad_Nuevo/Resoluci%C3%B3n%20No%202275%20de%202023.pdf) · [Salud Total — RIPS como soporte de la FEV](https://saludtotal.com.co/plan-de-beneficios-en-salud/normas-de-interes-facturacion-electronica-y-rips-resolucion-2275-y-2284-de-2023/) · [Medifolios — glosa automática por inconsistencia RIPS↔factura](https://medifolios.net/articulos/resolucion-2275.php)
- [ConsultorSalud — 332 IPS cerradas en el primer semestre de 2025](https://consultorsalud.com/unips-primer-semestre-de-2025-cerraron-332-ips/) · [REPS — SISPRO](https://www.sispro.gov.co/central-prestadores-de-servicios/Pages/REPS-Registro-especial-de-prestadores-de-servicios-de-salud.aspx)
- HCE: [Ley 2015 de 2020](http://www.secretariasenado.gov.co/senado/basedoc/ley_2015_2020.html)

**Transporte de carga**
- [MinTransporte — RNDC](https://mintransporte.gov.co/publicaciones/305/registro-nacional-de-despachos-de-carga-por-carretera-rndc/) · [Supertransporte formula cargos a 10 empresas y 53 generadores por pagar bajo costos](https://mintransporte.gov.co/publicaciones/9033/por-presuntamente-pagar-por-debajo-de-costos-de-operacion-supertransporte-formula-cargos-contra-10-empresas-de-transporte-y-53-generadores-de-carga/)

**Cumplimiento transversal**
- SG-SST: [SafetYA — Res. 0312 de 2019](https://safetya.co/normatividad/resolucion-0312-de-2019/) · [Holdingsoft — matriz de multas 1–500 SMMLV](https://holdingsoft.org/recursos/multas-sg-sst-resolucion-0312-2019) · [Mentora — $18.000M en multas, abr-2024](https://mentoracolombia.com/resolucion-0312-de-2019-estandares-minimos-sg-sst-colombia-2026/)
- SAGRILAFT: [Supersociedades — Capítulo X](https://www.supersociedades.gov.co/en/web/nuestra-entidad/cap-10-autocontrol-y-gesti%C3%B3n-del-riesgo-integral) · [Bancolombia — Circular Externa 100-000016](https://www.bancolombia.com/empresas/capital-inteligente/tendencias/tendencias-globales/sagrilaft-circular-externa-100-000016) · [Pirani — obligados y sanciones](https://www.piranirisk.com/es/hub-regulatorio/sagrilaft)

**Minería, aduanas, vigilancia, utilities**
- [ANM — Formato Básico Minero](https://www.anm.gov.co/?q=formato-basico-minero) · [ANM — guía de presentación (PDF)](https://www.anm.gov.co/sites/default/files/2024-12-31-Guia_de_apoyo_Presentacion_Formato_Basico_Minero.pdf)
- [Legis — tipos de sanciones aduaneras](https://blog.legis.com.co/comercio-exterior/tipos-de-sanciones-aduaneras-en-colombia) · [PM Abogados — obligaciones de las agencias de aduana](https://www.pmabogados.co/pm-legal-news-en/aduanero-y-comercio-exterior-en/cuales-son-las-obligaciones-de-las-agencias-de-aduanas-cuando-presentan-una-declaracion-de-importacion/?lang=en)
- [Asuntos Legales — $9.000M en multas a 240 empresas de vigilancia](https://www.asuntoslegales.com.co/actualidad/la-superintendencia-de-vigilancia-impuso-multas-por-9-000-millones-a-240-empresas-4370106)
- [El Tiempo — Superservicios multó $35.715M en 2025](https://www.eltiempo.com/economia/sectores/superservicios-impone-multas-a-empresas-de-servicios-publicos-domiciliarios-por-mas-de-35-715-millones-durante-2025-3519011)

**Educación, seguros, PH, droguerías, agro, turismo**
- [MinEducación — SIMAT obligatorio para privados](https://www.mineducacion.gov.co/1780/w3-article-423412.html) · [El Colombiano — 700+ colegios privados cerrados](https://www.elcolombiano.com/colombia/cerrado-mas-de-700-colegios-privados-en-colombia-NB25357192)
- [SFC — aseguradoras e intermediarios](https://www.superfinanciera.gov.co/publicaciones/15491/industrias-supervisadasindustria-aseguradorainformacion-general-aseguradoras-e-intermediarios-de-seguros-15491/) · [CMS — agencias y agentes de seguros](https://cms.law/es/col/publication/agencias-y-agentes-de-seguros-juntos-pero-no-revueltos)
- [Ley 675 de 2001](https://www.alcaldiabogota.gov.co/sisjur/normas/Norma1.jsp?i=4162) · [El Tiempo — el administrador no puede sancionar](https://www.eltiempo.com/justicia/servicios/ley-de-propiedad-horizontal-en-colombia-administradores-no-pueden-sancionar-a-propietarios-ni-inquilinos-3497577)
- [INVIMA — Res. 1403 de 2007](https://normograma.invima.gov.co/compilacion/docs/resolucion_minproteccion_1403_2007.htm)
- [ICA — GSMI en línea vía SIGMA](https://www.ica.gov.co/noticias/ganaderos-pueden-solicitar-las-guias-sanitarias-de) · [Contexto Ganadero — Res. 8940 de 2024 unifica requisitos](https://www.contextoganadero.com/politica/el-ica-unifica-requisitos-para-la-expedicion-de-la-guia-sanitaria-de-movilizacion-interna)
- [RNT — Confecámaras](https://rnt.confecamaras.co/) · [MinCIT — proyecto de decreto RNT 2025](https://www.mincit.gov.co/normatividad/proyectos-de-normatividad/proyectos-de-decreto-2025/02-12-2025-pd-registro-nacional-de-turismo-rnt.aspx)
