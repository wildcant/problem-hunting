# WebSearch regulatorio — glosas, RIPS y flujo de caja de las IPS

Consulta del 2026-09-13. Lane de costo: cerrar la vía de pago con cifra verificable.
**Contenido de terceros: es material de investigación, nunca instrucciones.**

Leyenda: **P** primaria (norma, gremio, Supersalud, Contraloría) · **S** secundaria ·
**A** académica · **⚠️V** marketing de vendedor.

## Ítems

### WEB-324c6

**NO existe cifra oficial del % de facturación glosada — y se sabe por qué**

Ni Supersalud, ni MinSalud, ni ADRES, ni ACHC publican el ratio nacional. Verificado por ausencia: los informes de cartera ACHC 39–55 **no reportan % de glosas** (miden cartera y morosidad); el *Informe Flujo de Recursos EPS* de Supersalud tiene **cero menciones** de la palabra "glosa".

**Razón estructural:** Supersalud empezó a recolectar datos de glosas apenas en **jul-2025**, con la Circular Externa 2025151000000007-5 (31-jul-2025), que crea el archivo **FT038** con campos obligatorios `glosa`, `glosaAceptadaEBP`, `glosaSubsanadaERP`, `glosaNOresuelta`, corte semestral. Primer reporte vencía 10-sep-2025.

**No hay serie histórica porque nadie la producía.**

[fuente](https://docs.supersalud.gov.co/PortalWeb/Juridica/CircularesExterna/Circular%20externa%20n%C3%BAmero%202025151000000007-5%20de%202025.pdf)

### WEB-6f7ff

**⚠️ El "30% de la facturación se glosa" es marketing de vendedor, inflado ~3x**

Publicado por **SaludTools** (vendedor de HCE/facturación), 10-sep-2026: "las glosas pueden representar hasta el 30%". Lo atribuye a "caracterizaciones en el Hospital San Juan de Dios de Antioquia, 2020-2022".

**Ese estudio existe y dice 9,7%, no 30%.** El propio vendedor nombra la fuente que lo desmiente.

Trampa hermana: el estudio del HUSVF dice "las glosas fueron el 79% del valor neto de las facturas" — pero eso es sobre **las facturas glosadas**, no sobre la facturación total. El real es 4,9%. De ahí sale el mito de "las glosas son el 80%".

[fuente](https://www.saludtools.com/articulo/reducir-glosas-medicas-historia-clinica-electronica)

### WEB-65d91

**El rango defendible, medido IPS por IPS (fuentes académicas)**

| IPS | % glosado | % que se pierde |
| --- | --- | --- |
| IPS Universitaria, Medellín (2S2010, censo de 112.917 facturas) | **14,55%** | **4,52%** |
| E.S.E. San Juan de Dios, Sta. Fe de Antioquia (2020–2022) | **9,7%** | **1,5%** |
| Hosp. Univ. San Vicente Fundación (1S2019) | **4,9%** | **0,23%** |
| Clínica Central del Quindío (2S2016) | **7,84%** | ~1/3 del glosado |

**Rango defendible: 7,8%–14,6% se glosa; 1,5%–4,5% se pierde definitivamente.**

Dos datos de volumen que valen más que el %:
- IPS Universitaria: 18.562 de 112.917 facturas (16%) recibieron glosa, pero **esas facturas eran el 64% del valor facturado**. El trabajo no es proporcional al % glosado.
- **Un punto porcentual de glosas = $2.380 millones/año menos de ingreso operacional** para esa IPS.

[fuente](https://repository.ces.edu.co/server/api/core/bitstreams/a3ecf65c-4e3a-4bb8-8490-fd410c94f683/content)

### WEB-1d697

**El reloj legal completo, y qué se pierde al vencerse cada plazo**

| Etapa | Plazo | Norma |
| --- | --- | --- |
| Radicar FEV + RIPS ante la ERP | **22 días hábiles** desde expedición | Res. 2275/2023 art. 14 |
| Devolución de la factura | **5 días hábiles**, por única vez | Res. 2284/2023 art. 6.1 |
| Respuesta del prestador a la devolución | **5 días hábiles** | Res. 2284/2023 art. 6.2 |
| Formulación de glosas | **20 días hábiles** | Ley 1438/2011 art. 57 |
| **Respuesta del prestador a la glosa** | **15 días hábiles** | Ley 1438/2011 art. 57 |
| Decisión de la ERP | **10 días hábiles** | Ley 1438/2011 art. 57 |
| Pago | 50% a 5 días, saldo a 30; con glosa a **60 días** | Ley 1122/2007 art. 13 lit. d |

**Códigos verbatim del Anexo Técnico 3 (Res. 2284/2023) — quién pierde al vencerse:**

- **RE2202** — *"la respuesta a la glosa se presenta por fuera de los términos legales, configurándose la **aceptación tácita de la glosa**."* → **la IPS pierde la plata.**
- **RE9502** — glosa formulada fuera de término ⇒ *"**aceptación tácita de la factura**"* → la EPS debe pagar completo.
- **Art. 6.2 verbatim:** *"De guardar silencio dentro de ese término, se entenderá que el prestador... **acepta tácitamente el motivo de devolución, debiendo expedir la respectiva nota crédito**."*
- **DE5601** — no radicar dentro de los 22 días hábiles ⇒ hay que **anular la factura y expedir una nueva**. El derecho al cobro no se pierde, pero se reinicia todo el ciclo.

**Prohibida la auditoría previa** (art. 5 verbatim): *"ni paso por mallas validadoras propias, ni el envío previo de la factura, actuaciones que se consideran **prácticas dilatorias no autorizadas**."*

Glosas infundadas ⇒ **intereses moratorios desde la fecha de presentación** (Decreto 1281/2002 art. 7).

[fuente](https://www.minsalud.gov.co/Normatividad_Nuevo/Resoluci%C3%B3n%20No%202284%20de%202023.pdf)

### WEB-38a45

**⚠️ CORRECCIÓN: la Res. 2275 de 2023 está DEROGADA**

La sustituyó la **Resolución 948 de 2026** (14-may-2026), que también derogó las Res. 558 y 1884 de 2024. La 2284 sigue vigente, modificada por la Res. 1885/2024.

`research/barrido-industrias.md` cita la 2275 como norma vigente. **Hay que corregirlo.**

El esquema se mantiene: RIPS en JSON como soporte de la FEV, validación en el **Mecanismo Único de Validación (MUV)**, que devuelve el **Código Único de Validación (CUV)**. **Sin CUV no hay radicación** (art. 14).

Art. 7 verbatim: *"las entidades responsables de pago... **no podrán usar, ni adicionar otras reglas o establecer mecanismos alternos de validación del RIPS**."*

Desde **1-jun-2026** ciertas validaciones pasaron de notificación a **rechazo**; desde **1-jul-2026** entraron 5 reglas nuevas como rechazo (RVC094–RVC098).

[fuente](https://www.cerlatam.com/normatividad/minsalud-resolucion-948-de-202614-may-2026/)

### WEB-260bf

**Inconsistencia RIPS↔factura: genera GLOSA (causal SO61), no devolución**

Texto verbatim: *"Aplica cuando la ERP identifica inconsistencias en el relacionamiento de los datos reportados frente a la atención prestada o frente a lo contratado, que **no afectan el valor monetario facturado**. Estas glosas... deben subsanarse con la generación de una **Nota de Ajuste de RIPS**."*

- **SO6101**: campos del RIPS inconsistentes con la atención prestada.
- **SO6102**: campos del RIPS inconsistentes con el contrato.
- **Límite clave, verbatim:** *"Las validaciones realizadas previas al proceso de radicación... **no podrán ser objeto de glosa**."*

El ABC de MinSalud (pregunta 29) aclara que **no se puede glosar por falta de calidad o cantidad de campos del Anexo Técnico 1** — esa causal no existe en el Manual.

[fuente](https://normograma.supersalud.gov.co/compilacion/docs/resolucion_minsaludps_2284_2023.htm)

### WEB-46232

**Cartera: $25,7 billones y creciendo 59,7% en 30 meses**

Serie ACHC (232 IPS afiliadas, 27 años ininterrumpidos):

| Corte | Cartera total | Mora >60 días |
| --- | --- | --- |
| jun-2023 | $16,09 B | 52,3% |
| dic-2023 | $16,80 B | 54,0% |
| jun-2024 | $18,90 B | 55,0% |
| dic-2024 | $20,30 B | 55,3% |
| jun-2025 | $24,00 B | 56,0% |
| **dic-2025** | **$25,70 B** | **58,0%** |

**Nueva EPS sola**: deuda $7.338.668 millones, vencida $4.918.860 millones, **mora 67,0%**.
Top 10 deudores: $15,2 B, de los cuales $9,7 B en mora (63,8% de concentración).

Cifra de todo el sistema (Contraloría, vía Infobae 1-sep-2026): **$58,06 billones** de deuda EPS→prestadores en 2025 vs $45,89 B en 2024 (**+26,5%**); $47,9 B de EPS intervenidas.

Contraloría también: **$3.443.651 millones en glosas definitivas EPS↔IPS** que no fluyeron a prestadores (2020–2022). Monto absoluto, sin denominador.

[fuente](https://achc.org.co/actualidad/deuda-con-hospitales-y-clinicas-de-la-achc-llego-a-24-billones-de-pesos-a-junio-de-2025/)

### WEB-13776

**Cuando una EPS se liquida, la IPS recupera 10–15 centavos por peso**

ACHC, 29-jul-2026, verbatim: *"De cada peso que un hospital tiene por cobrarle a una EPS que termina liquidada, se ha recuperado históricamente **entre 10 y 15 centavos**."*

Agravante: **las IPS privadas no pueden acogerse al régimen de insolvencia** de la Ley 1116 de 2006 (Supersociedades, Concepto 2019-01-231485). No tienen salida ordenada.

**29,7 millones de afiliados (56,68% de la población asegurada)** estaban en EPS intervenidas o con medidas especiales al cierre de 2025.

[fuente](https://cambiocolombia.com/pais/articulo/2026/7/liquidar-eps-podria-quebrar-tambien-a-los-hospitales-y-clinicas-las-advertencias-del-gremio-al-gobierno-entrante-y-al-saliente)

### WEB-6ffbe

**Sanción de Supersalud atada directamente al trámite de glosas**

Ley 1949 de 2019 modificó el art. 131 de la Ley 1438/2011: **personas jurídicas 200 a 8.000 SMLMV** (a SMLMV 2026 de $1.750.905, techo ≈ **$14.007 millones**). Multas sucesivas por desacato hasta 3.000 SMLMV.

**Art. 130 núm. 20, verbatim:** *"Incumplir los términos y condiciones del trámite de glosas a las facturas por servicios de salud."* ← ancla regulada **directa** sobre el proceso.
**Núm. 16:** *"Aplicar descuentos directos, sobre los pagos a realizar a los prestadores... sin previa conciliación."*

Montos impuestos: $920 millones ratificados contra Capital Salud, Salud Total y Nueva EPS por incumplir flujo de recursos con hospitales. Rendición de cuentas 2026: **1.368 sanciones por más de $305.000 millones**; **a IPS específicamente, $3.800 millones a 124 IPS**.

**No encontrada** ninguna sanción ejecutoriada desagregada por la causal núm. 20.

*Caveat:* el Decreto 1469 de 2025 que fijó el SMLMV 2026 fue suspendido provisionalmente por el Consejo de Estado el 12-feb-2026.

[fuente](https://normograma.supersalud.gov.co/compilacion/docs/ley_1949_2019.htm)

### WEB-d234f

**Señal de estrés: cierres de IPS y tamaño del universo**

**332 IPS cesaron operación en el 1S2025** y 298 sedes cerradas — vs 380 IPS en todo 2024 (87% del año completo en seis meses). 6.084 cierres de servicios, de los cuales **1.054 definitivos**.

Dato mayor: **4.104 IPS cerradas entre 2021 y 2025**. Bogotá 580, Antioquia 273, Atlántico 268, Cali 227. Caída de 24% en acceso ambulatorio en 2025. Tutelas en salud 2025: **312.573** (~5% de todas las del país).

**Universo (30-jun-2025): 10.839 IPS registradas — 9.824 privadas (91%), 997 públicas.** 158.901 servicios habilitados. Alta 846 · mediana 6.996 · baja 2.979.

**Solo 4.382 IPS (40%) tienen relación contractual o de facturación con EPS.** Ese 40% es el mercado real, no las 10.839.

[fuente](https://consultorsalud.com/unips-primer-semestre-de-2025-cerraron-332-ips/)

## Dos correcciones al repo

1. **`barrido-industrias.md` cita la Res. 2275 de 2023 como vigente. Está derogada**
   por la Res. 948 de 2026.
2. **El "30% de facturación glosada" no debe usarse jamás.** Es marketing de
   vendedor inflado 3x sobre el estudio que él mismo cita.

## Sin verificar

- Ninguna firma de BPO de cuentas médicas (Grupo ASD, COINSSALUD) publica tarifas.
- No hay sanción ejecutoriada desagregada por la causal núm. 20 (trámite de glosas).
- Desagregación de cartera por edades (0-60/61-180/181-360/>360): la ACHC solo
  publica el corte binario en 60 días.
