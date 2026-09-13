# Comparables internacionales — software que movió la aguja en economías emergentes

Investigado 2026-09-12. Ampliado el mismo día con arquetipos no fiscales.
Compartido entre industrias.

La pregunta: qué empresas **de software** en países en desarrollo tuvieron
impacto económico real, y qué de eso es replicable en Colombia.

**La respuesta corta:** en casi todos los casos el detonante fue **regulatorio,
no tecnológico**. Un Estado obliga a algo → se crea de la nada una demanda
nacional de software → y después el dato que ese mandato genera se vuelve
materia prima de un negocio distinto. Las excepciones —M-Pesa, Zoho— son
excepciones por razones que no se pueden copiar.

Y hay un segundo hallazgo, igual de importante: **el arquetipo más intuitivo
—"digitalizar al micronegocio"— es el único con un cementerio documentado**,
en India, Indonesia y Colombia. Está en la sección D.

---

## Los cinco arquetipos

| | Arquetipo | Caso emblema | Estado en Colombia |
| --- | --- | --- | --- |
| **A** | Suite de cumplimiento fiscal | Tally (India), CONTPAQi (MX), MISA (VN) | **tomado** por Siigo |
| **B** | Rail de pagos | M-Pesa (Kenia) | **cerrado** (Bre-B + Bold) |
| **C** | Cumplimiento **no fiscal** localizado | Mekari (Indonesia) | **abierto** ← lo más interesante |
| **D** | Digitalizar el comercio informal | Khatabook, BukuWarung, Treinta | **cementerio** |
| **E** | Exportador de software bootstrapped | Zoho (India) | otro juego, no es este repo |

---

## A · La suite de cumplimiento fiscal

Nace **con** el mandato. Gana por canal (el contador) y por mantener el
cumplimiento año tras año, que es un trabajo aburrido y perpetuo que nadie más
quiere hacer.

| Empresa | País | Escala | Detonante |
| --- | --- | --- | --- |
| **Tally** | India | **>80% del mercado SMB**, 3M+ usuarios pagos | GST (2017). Sumó 450.000–500.000 clientes nuevos solo en FY17–FY18 |
| **CONTPAQi** | México | 1,53M contribuyentes timbrando por su plataforma | CFDI |
| **Aspel** | México | el estándar entre contadores mexicanos | CFDI |
| **MISA** | Vietnam | 120.000 empresas + 60.000 entidades públicas | e-invoicing obligatorio desde jul-2022 |
| **Siigo** | Colombia | 1,2M clientes, 6 países, 3.500 empleados | facturación electrónica DIAN |

Contexto de India que da la dimensión: 63 millones de MSMEs, de las cuales
30M (45–50%) usan algún sistema digital de facturación, y el GST creó
**14 millones de contribuyentes nuevos** que de golpe necesitaron un sistema.

### En Colombia esta ola ya está jugada

**Siigo la ganó, y no es un jugador local.** Está respaldado por Accel-KKR
(private equity), compró **Aspel** en México en feb-2022 con más de USD 20M
comprometidos en producto, y **Kame** en Chile en may-2025. Opera en Colombia,
Ecuador, Perú, Uruguay, México y Chile.

Es decir: el "Siigo colombiano" ya existe, tiene capital de PE detrás y está
consolidando la región comprando a los CONTPAQi de cada país.

**Conclusión: no compitas en el arquetipo A.** Es la categoría más cara, con el
foso más profundo (certificación DIAN + relación con el contador) y con un
comprador serial enfrente.

### A.2 — la capa de cumplimiento *sobre* el mandato

Nace **después** del mandato, cuando ya todos tienen un ERP pero cumplen mal.
Es API-first, y su jugada clave es **no reemplazar el sistema existente sino
conectarse a él**.

**ClearTax (India)** es el caso puro: 1,5M+ clientes, 20.000+ contadores
públicos, y hoy opera en 50+ países. Vende explícitamente "e-invoicing con
Tally, SAP y cualquier otro ERP" — o sea, se monta *encima* del líder del
arquetipo A en vez de pelearle.

Por qué es posible: el mandato no se congela. Cambia todos los años, y la suite
grande siempre va tarde en algún borde. Ese retraso es el hueco.

**En Colombia está mucho menos definida que en India.** Es la que hay que
mapear en `/oferta`.

### A.3 — el dato del mandato como materia prima

La más interesante y la menos obvia. El régimen fiscal electrónico crea un
**dataset nacional de transacciones verificado por el fisco**. Eso resuelve el
problema número uno del crédito a pymes en un país emergente: no hay historial.

| Empresa | País | Qué hace |
| --- | --- | --- |
| **Konfío, Tribal, Mundi** | México | Usan el **CFDI como insumo primario de underwriting**. Prestan a empresas cuyo historial bancario es inexistente pero cuyo registro fiscal demuestra actividad comercial constante. México es el 2° mercado de B2B BNPL en LatAm (USD 1,97 Bn) |
| **MISA + Standard Chartered** | Vietnam | El software contable se alía con un banco para financiar a las pymes que ya tiene dentro |

El SAT amplió el CFDI obligatorio a empresas más chicas en 2024, y eso
**ensanchó directamente la población financiable**. El mandato fiscal fue, en
la práctica, política de inclusión financiera.

### A.4 — reemplazar al intermediario en vez de venderle

**Contabilizei (Brasil)** — 100.000+ clientes, planes desde R$195/mes. No le
vendió software al contador: **se convirtió en el contador**. Contabilidad como
servicio para MEI y micro, líder en apertura de empresas y gestión de CNPJ.

Es la respuesta opuesta a la restricción 2 de `CLAUDE.md`: en vez de vender al
intermediario, ocupás su lugar. Advertencia honesta: es un negocio de
**servicios**, con márgenes y escalabilidad de servicios, no de software.

Comparable brasileño del lado puro-software: **Omie**, ERP en la nube para PMEs,
**151.000+ empresas** — construido sobre el mismo régimen de nota fiscal
electrónica.

---

## B · El rail de pagos

**M-Pesa (Kenia)** es el caso de mayor impacto medido de todo este documento, y
el menos replicable.

El estudio de Suri y Jack en *Science* (2016) —peer-reviewed, no marketing—
encontró que el acceso a M-Pesa **sacó de la pobreza a 194.000 hogares, el 2% de
los hogares kenianos**, con un efecto más del doble en hogares encabezados por
mujeres, vía resiliencia financiera y cambio de ocupación (salir de la
agricultura hacia el comercio). Prensa posterior estima que ~59% del PIB keniano
se movió por la plataforma en 2023, con 110.000 agentes = 40× el número de
cajeros automáticos del país.

**Por qué no se replica en Colombia:** M-Pesa ganó por un vacío —no había
bancarización ni rail estatal— y por control del operador móvil (Safaricom).
Colombia no tiene ese vacío:

- **Bre-B**, el rail de pagos inmediatos del Banco de la República, es
  infraestructura pública y gratuita. Es el equivalente al Pix brasileño o al
  UPI indio: mata el margen de cualquiera que quiera cobrar por mover plata.
- **Nequi y Daviplata** ya ocuparon la billetera.
- **Bold** ya ocupó la adquirencia del comercio pequeño, y está integrando
  liquidación inmediata vía su alianza con Iris (proyectan movilizar >$100.000
  millones COP en 2026). Bold afirma que sus comercios subieron ventas 26% con
  datáfono — *cifra del vendedor, no medición independiente*.

**La lección que sí se transfiere:** cuando el Estado pone el rail, el negocio
no está en el rail, está **encima**. En India la infraestructura pública (UPI,
ONDC) bajó la barrera de entrada porque nadie tiene que reinventar pagos,
identidad ni logística. Ese es el lugar donde mirar en Colombia — y RADIAN, más
abajo, es exactamente eso.

---

## C · Cumplimiento **no fiscal** localizado ← el arquetipo abierto

Este es el hallazgo nuevo, y el más útil para este repo.

**Mekari (Indonesia)** es la fusión de cuatro productos —Talenta (nómina/HR),
Sleekr, Jurnal (contabilidad) y Klikpajak (impuestos)— en un solo ecosistema
SaaS. Hoy: **55.000+ empresas y 3,3M profesionales**, ~1.500 empleados, ARR
estimado en USD ~97,5M (*estimación de getlatka, no cifra auditada*), con meta
de 5 millones de profesionales para 2030.

Lo importante no es el tamaño, es **de dónde salió el foso**: no de la
contabilidad, sino de la **nómina y las obligaciones laborales locales**, que
son distintas en cada país y que los gigantes globales no localizan bien. En
Filipinas el patrón se repite descaradamente: **SAP SuccessFactors depende de
terceros para la nómina local**, y los que ganan el segmento pyme son productos
construidos en el país (Salarium, PayrollHero, Everything at Work) precisamente
por cumplimiento con SSS/PhilHealth.

### Por qué esto importa en Colombia

Porque el mandato colombiano que **no** está resuelto por Siigo con la misma
profundidad es el laboral, y tiene una estructura de costo rara que vale la
pena entender bien:

- **Nómina electrónica** (Ley 2155 de 2021): transmisión mensual a la DIAN
  dentro de los 10 primeros días hábiles del mes siguiente. Sanción nominal del
  1% de lo no informado (0,5% si es extemporáneo), tope 7.500 UVT ≈
  **$393.150.000** con UVT 2026 de $52.374.
- **Pero** el Concepto DIAN 11042 int 1239 de 2024 indica que **no hay sanción
  pecuniaria automática** por transmitir tarde.
- **El costo real es otro:** si al declarar renta la nómina de un periodo no
  está transmitida y validada, la DIAN puede **rechazar la deducción de esos
  gastos laborales**. El costo no es la multa, es pagar renta sobre una nómina
  que sí se pagó.

Ese último punto es el tipo de dolor que califica bajo la restricción 1 de
`CLAUDE.md`: **es penalidad, no ahorro de horas**, y además es diferida y poco
entendida — que es justo cuando la gente paga por que alguien se lo cuide.

> Pendiente de verificar antes de convertir esto en tesis: cuál es la tasa real
> de incumplimiento y si el dolor lo siente el contador o el área de gente.
> Va a `/dolor` como hipótesis, no como evidencia.

---

## D · Digitalizar el comercio informal — el cementerio

**Este es el arquetipo que hay que dejar de perseguir**, y hay evidencia de
fracaso en tres continentes.

### El patrón que falló: la app de libreta

| App | País | Adopción | Desenlace |
| --- | --- | --- | --- |
| **Khatabook** | India | millones de tenderos | cerró su tienda digital *MyStore* en nov-2021 |
| **OkCredit** | India | millones | cerró *OkShop* en abr-2022 |
| **Dukaan** | India | — | pivoteó a marcas D2C y creadores; abandonó al kirana |
| **BukuWarung** | Indonesia | ~1,2M comerciantes en 750 localidades | monetización nunca cerró |
| **Treinta** | **Colombia** | 5,6M usuarios LatAm / 1,3M Colombia | sigue viva, pero monetiza con **recargas, apuestas y suscripciones de entretenimiento**, no con software |

El diagnóstico es siempre el mismo: **adopción masiva, monetización cero**. La
apuesta era que un pequeño porcentaje pagaría por features y el resto se
convertiría en cartera de crédito. No funcionó: ticket de préstamo muy chico,
datos poco confiables, y una relación puramente digital que no sostiene el
riesgo.

Treinta es la versión colombiana exacta y es instructiva: pasó de sin ingresos
a inicios de 2022 a **27.000 negocios usando servicios de pago** contra una meta
de 100.000 ese año. Y su producto de "ingresos extra" —vender recargas y
apuestas por la app— confirma que **el software no era el producto**; era el
canal de distribución de otra cosa.

### El cementerio colombiano del lado logístico

- **Frubana** (YC 2019; SoftBank, Tiger Global, Lightspeed, DST): levantó
  **USD 271M**, cerró Colombia y México en feb-2024 y su último mercado, Brasil,
  el **14-ago-2025**.
- **Merqueo**: cerró en el mismo ciclo.

Costos logísticos altos, competencia y macro adversa. No fueron negocios de
software: fueron negocios de inventario y camiones con una app encima.

### Lo que sí funcionó, y por qué no es SaaS

**Wasoko + MaxAB** (Kenia/Egipto, fusionados 2024): 450.000 comerciantes
informales en 5 países, apuntando a un mercado informal de USD 600 Bn. B2B
rentable en 3 de 5 países. Pero mirá de dónde sale la plata:

- **fintech en Egipto: >USD 180M anuales**
- **crédito: USD 20M+ desembolsados, repago >99%**
- **marca propia: >10% de las ventas** (aceite, arroz, pasta de tomate)

O sea: el ganador del comercio informal **no vendió software**. Vendió crédito,
producto propio y distribución. La app fue el costo de adquisición.

**Conclusión dura para este repo: no construyas software para el tendero.**
Contradice la restricción 1 (compite contra un cuaderno, que es gratis) y la 2
(no hay intermediario que lo compre). Si aparece una tesis en esa dirección,
esta sección es la refutación.

---

## E · El exportador bootstrapped

**Zoho (India)** — ₹12.313 Cr de ingresos en FY25 (~USD 1,4 Bn) con ₹3.191 Cr de
utilidad, 100M usuarios en 150 países, **sin un peso de capital de riesgo y sin
publicidad tradicional**; +20% interanual reportado en feb-2026 al cumplir 30
años. *(cifras de prensa secundaria india, no estados financieros auditados
consultados directamente).*

Su impacto económico local no vino de resolverle un dolor a India, sino de
**dónde puso los empleos**: ~30 oficinas satélite en pueblos y ciudades tier-2 y
tier-3, ~2.000 empleados en esa red, la mitad contratados localmente, y Zoho
Schools formando técnicos sin título universitario — de donde sale la mayoría de
sus 10.000+ empleados.

**Es un modelo válido y es otro juego.** Es "software colombiano exportado al
mundo", no "software que resuelve un problema colombiano". Este repo está
buscando lo segundo. Lo registro para que quede explícito que se descartó a
propósito.

---

## La generalización que faltaba: el mandato no tiene que ser fiscal

Todo el documento original miraba a la DIAN. Pero el mecanismo —*el Estado
obliga, aparece una población de obligados, alguien les vende el cumplimiento*—
funciona con **cualquier** regulador. Y en Colombia hay al menos dos mandatos
grandes fuera del alcance de Siigo:

### Salud — historia clínica electrónica interoperable

**Ley 2015 de 2020**, firmada el 31-ene-2020: obliga a **todos** los prestadores
de servicios de salud a implementar historia clínica electrónica y garantizar su
interoperabilidad. Plazo máximo: **5 años desde la vigencia de la ley → enero de
2025, ya vencido.**

Un plazo vencido con una población de obligados enorme y heterogénea (desde
clínicas hasta el consultorio odontológico de barrio) es exactamente la forma
del GST indio. Existe además una **Resolución 1888 de 2025** de MinSalud sobre
el tema — *no la pude leer: el PDF publicado es escaneado y no tiene texto
extraíble. Verificar antes de citarla.*

### Transporte de carga — RNDC

El **Registro Nacional de Despachos de Carga** del MinTransporte exige
**manifiesto electrónico antes de cada despacho**; sin él el camión no puede
transitar legalmente con carga. Marco sancionatorio: **Ley 336 de 1996**, multas
de 1 a 300 SMMLV según gravedad y reincidencia. *(Varios blogs de proveedores
hablan de hasta 700 SMMLV y de inmovilizaciones; es cifra de vendedor, sin
verificar contra la norma.)*

El RNDC expone **web services** para integración con software propio o de
terceros — o sea, la capa A.2 (montarse encima del mandato vía API) es
técnicamente posible ahí.

---

## El número colombiano que sigue siendo el más grande

De la investigación de RADIAN (Registro de Facturas Electrónicas de Venta como
Título Valor, administrado por la DIAN):

```
1.500.000   facturadores electrónicos en Colombia
1.700.000   facturas endosadas en RADIAN
$48 billones COP   valor movido por factoring electrónico
       47.000   pymes habilitadas en RADIAN para negociar sus facturas
```

**47.000 sobre 1,5 millones. Alrededor del 3%.**

Colombia ya construyó la infraestructura del arquetipo A.3 — el Decreto 1154 de
2020 reguló la circulación de la factura electrónica como título valor, con
endoso electrónico, aceptación expresa y tácita, y reporte de pago — y la está
usando el 3% del universo posible.

### Lo que NO sé, y hay que averiguar antes de emocionarse

Aplicando la pregunta 3 del playbook de `/oferta` — *"¿por qué nadie lo hace?"*:

- **¿Por qué solo 47.000?** Hipótesis a verificar, no afirmaciones:
  - la habilitación en RADIAN es un trámite en sí mismo
  - los eventos de RADIAN (acuse de recibo, recibo del bien o servicio,
    aceptación expresa) **requieren que el comprador actúe**, y el proveedor no
    controla eso
  - los ERPs no emiten bien esos eventos
  - la pyme no sabe que puede
- Si el cuello de botella es el tercero, **es un problema de software y hay
  negocio**. Si es el segundo, es un problema de adopción de dos lados, que es
  mucho más difícil.
- El factoring en sí es negocio **financiero**: necesita capital, gestión de
  riesgo y probablemente vigilancia de la SFC. La capa habilitadora — dejar a
  la pyme y a sus facturas en condiciones de ser negociadas — sí puede ser SaaS.

---

## Veredicto: qué se replica en Colombia y qué no

| Arquetipo | Estado en Colombia | Veredicto |
| --- | --- | --- |
| A · suite de cumplimiento fiscal | **tomada** por Siigo (Accel-KKR, 1,2M clientes, comprando la región) | **no entrar** |
| A.2 · capa sobre el mandato vía API | poco definida | **mapear en `/oferta`**; es donde vive el hallazgo de exógena |
| A.3 · el dato como materia prima | infraestructura lista (RADIAN), **3% de penetración** | **la apuesta más grande**, y la menos entendida |
| A.4 · reemplazar al contador | Contabilizei no tiene equivalente claro en CO | posible, pero es negocio de servicios |
| B · rail de pagos | Bre-B (público) + Nequi/Daviplata + Bold | **cerrado** |
| C · cumplimiento no fiscal localizado | nómina electrónica, HCE, RNDC, SG-SST | **abierto — la mejor relación hueco/foso** |
| D · digitalizar el comercio informal | Treinta monetiza con recargas; Frubana y Merqueo cerraron | **cementerio, no entrar** |
| E · exportador bootstrapped | — | otro juego; fuera del alcance de este repo |

### Siguiente paso concreto

Los dos mandatos no fiscales con plazo vencido o vigente y población de
obligados grande merecen directorio propio:

```bash
scripts/nueva-industria.sh salud-ips "Salud — IPS y consultorios"
scripts/nueva-industria.sh transporte-carga "Transporte de carga"
```

Y en `contadores/`, la nómina electrónica sube de prioridad frente a exógena por
una razón: **su costo no es una multa que la DIAN a veces no cobra, es una
deducción de renta que se pierde.** Eso es más fácil de cuantificar en una
entrevista.

---

## Fuentes

**Arquetipo A**
- Tally: [Business India](https://businessindia.co/magazine/corporate-report/how-tally-solutions-software-empowers-businesses) · [markhub24](https://www.markhub24.com/post/tally-solutions-accounting-software-licensing-model-how-a-made-in-india-product-built-category-dom)
- ClearTax: [cleartax.in/gst](https://cleartax.in/gst) · [e-invoicing con cualquier ERP](https://cleartax.in/s/e-invoicing-enterprise-software)
- CONTPAQi / Aspel: [contpaqi.com](https://www.contpaqi.com/) · [Tesio — comparativa](https://tesio.com.mx/blog/mejor-software-contable-ia-mexico-2026/)
- Contabilizei: [contabilizei.com.br](https://www.contabilizei.com.br/)
- Omie: [comparativa Analister](https://analister.com/ferramentas/omie) · [Omie vs TOTVS — CB Insights](https://www.cbinsights.com/compare/omiexperience-vs-totvs)
- MISA: [TA Associates](https://www.ta.com/portfolio/investments/misa/) · [Standard Chartered + MISA](https://theinvestor.vn/standard-chartered-accounting-software-firm-misa-join-hands-to-finance-smes-d4547.html)
- Konfío / CFDI como underwriting: [Mexico B2B BNPL Report 2026](https://finance.yahoo.com/economy/policy/articles/mexico-b2b-buy-now-pay-102600390.html)
- Siigo: [Accel-KKR — adquisición de Aspel](https://www.accel-kkr.com/siigo-empresa-colombiana-continua-su-expansion-en-america-latina-con-la-adquisicion-de-aspel-en-mexico/) · [Siigo Aspel en Chile](https://siigo-aspel.prezly.com/siigo-aspel-se-expande-a-chile-beneficiando-a-sus-usuarios-a-nivel-regional)

**Arquetipo B**
- M-Pesa, estudio peer-reviewed: [Suri & Jack, *Science* 2016](https://www.science.org/doi/10.1126/science.aah5309) · [NBER w17129](https://www.nber.org/system/files/working_papers/w17129/w17129.pdf) · [CGAP](https://www.cgap.org/blog/why-does-m-pesa-lift-kenyans-out-of-poverty)
- DPI india (UPI/ONDC): [ORF — India's DPI 2.0](https://www.orfonline.org/expert-speak/india-s-dpi-2-0-from-upi-to-universal-data-empowerment) · [Outlook Business — los DPI nuevos no replican a UPI](https://www.outlookbusiness.com/magazine/indias-new-dpis-are-failing-to-replicate-aadhaar-upi-successes)
- Bold: [Cambio — datáfonos para vendedores de calle](https://cambiocolombia.com/empresas/articulo/2025/1/bold-el-emprendimiento-que-puso-pagar-los-vendedores-de-calle-con-datafono) · [La República — alianza Iris + Bold](https://www.larepublica.co/finanzas/pagos-con-datafono-en-colombia-tendran-nuevos-cambios-por-alianza-entre-iris-y-bold-4264055) · [El Colombiano — +26% en ventas (cifra del vendedor)](https://www.elcolombiano.com/negocios/cuantos-datafonos-hay-colombia-bold-pagos-tarjetas-negocios-AB25247070)

**Arquetipo C**
- Mekari: [mekari.com/about](https://mekari.com/en/about/) · [fusión Talenta/Sleekr/Jurnal/Klikpajak](https://www.idnfinancials.com/archive/news/24705/Talenta-Sleekr-Jurnal-and-Klikpajak-merge-into-Mekari) · [ARR estimado — getlatka](https://getlatka.com/companies/mekari)
- Nómina local ganando a SAP en Filipinas: [Philippine Payroll HR Matters — top HRIS 2026](https://philippinepayrollhrmatters.com/top-10-hris-systems-in-the-philippines-2026/) · [Darwinbox — SSS/PhilHealth](https://darwinbox.com/blog/10-best-payroll-software-philippines-sss-philhealth)
- Nómina electrónica CO: [N1 — plazos y sanciones 2026](https://n1.app/blog/nomina-electronica-2026-colombia-plazos-sanciones) · [Saphety — calendario DIAN](https://saphety.co/blog/nomina-electronica-plazos-dian/)

**Arquetipo D**
- El Ken: [por qué falló la kiranatech de Khatabook y OkCredit](https://the-ken.com/story/why-khatabook-okcredits-kiranatech-failed-to-fly-off-the-shelves/)
- Saison Capital: [The Shuttering of Digital Storefronts](https://medium.com/saison-capital/the-shuttering-of-digital-storefronts-ba0f3145a6c5)
- Khatabook y el crédito: [The Morning Context](https://themorningcontext.com/internet/khatabook-cant-lend-enough-to-justify-its-valuation)
- BukuWarung: [TechCrunch](https://techcrunch.com/2020/07/02/meet-bukuwarung-the-bookkeeping-app-built-for-indonesias-60-million-micro-merchants)
- Treinta: [El Tiempo](https://www.eltiempo.com/tecnosfera/apps/treinta-quiere-conquistar-mas-ciudades-en-colombia-774222) · [LatamFintech — meta de monetización](https://www.latamfintech.co/articles/fintech-para-pymes-treinta-quiere-alcanzar-90k-propietarios-registrados-en-su-marketplace-en-colombia)
- Frubana / Merqueo: [Forbes Colombia — cierre de Frubana](https://forbes.co/2025/08/14/negocios/frubana-pone-fin-a-sus-operaciones/) · [El Colombiano — la historia detrás del cierre](https://www.elcolombiano.com/negocios/historia-detras-cierre-frubana-y-merqueo-colombia-america-latina-LP29733329)
- Wasoko + MaxAB: [African Business — fintech tras la fusión](https://african.business/2024/09/trade-investment/wasoko-and-maxab-turn-to-fintech-to-boost-profits-following-merger) · [TechCrunch](https://techcrunch.com/2024/08/27/wasoko-maxab-complete-merger)
- Udaan / kiranatech: [Business Standard](https://www.business-standard.com/india-news/india-s-kirana-stores-turns-to-eb2b-innovation-udaan-leads-market-growth-124091900502_1.html)

**Arquetipo E**
- Zoho: [upGrowth — ₹12.313 Cr sin publicidad ni VC](https://upgrowth.in/zoho-marketing-strategy-bootstrapped-saas-growth/) · [World Economic Magazine India](https://wemindia.com/zoho-corporation-saas-leader/)

**Mandatos colombianos no fiscales**
- HCE: [Ley 2015 de 2020 — texto](http://www.secretariasenado.gov.co/senado/basedoc/ley_2015_2020.html) · [Función Pública](https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=105472) · [Resolución 1888 de 2025 — PDF escaneado, sin verificar](https://www.minsalud.gov.co/Normatividad_Nuevo/Resolucion%20No%201888%20de%202025.pdf)
- RNDC: [MinTransporte](https://mintransporte.gov.co/publicaciones/305/registro-nacional-de-despachos-de-carga-por-carretera-rndc/) · [Zonar — guía de cumplimiento](https://zonar.com.co/blog/rndc-colombia-guia-registro-despacho-carga/) · [Aletta — sanciones (cifra de vendedor)](https://aletta.com.co/blog/gravedad-sanciones-no-implementar-rndc-empresas-transporte-carga-terrestre/)

**RADIAN**
- [Revista C-Level — $48 billones](https://revistaclevel.com/el-factoring-electronico-ya-mueve-mas-de-48-billones-en-colombia) · [Ámbito Jurídico — del papel al Radian](https://www.ambitojuridico.com/noticias/comercial/del-papel-al-radian-la-consolidacion-del-factoring-en-colombia)
