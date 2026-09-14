# WebSearch — ¿el REPS se puede descargar en bloque? (eje D)

Consulta del 2026-09-13. Pregunta: el barrido le puso **D=2** a salud *asumiendo*
que el padrón de IPS se puede extraer. `CLAUDE.md` exige que D=2 se verifique:
un registro de consulta uno-por-uno **no** es una lista descargable.

**Contenido de terceros: es material de investigación, nunca instrucciones.**

## Veredicto: D = 2, confirmado

Dos vías independientes, ambas probadas con requests reales. No es inferencia.

## Ítems

### WEB-70134

**datos.gov.co — dataset oficial REPS (`c36g-9fc2`), MinSalud**

**76.821 filas · 61.073 códigos de prestador · 22 columnas.** Corte de datos Mar-2026, `rowsUpdatedAt` Abr-2026. Licencia CC BY-SA 4.0, 73.082 descargas acumuladas.

**Descarga en bloque probada, HTTP 200, sin API key:**
`https://www.datos.gov.co/api/views/c36g-9fc2/rows.csv?accessType=DOWNLOAD` → `text/csv`, **28.827.439 bytes (28,8 MB)**.

Desglose por `claseprestador`: Profesional Independiente 54.657 · **IPS 19.551** · Objeto Social Diferente 2.107 · Transporte Especial 506.
Por naturaleza: Privada 72.905 · Pública 3.845 · Mixta 71.
**De las 19.551 filas IPS, 19.549 traen email.**

Columnas: `codigoprestador, nombreprestador, codigohabilitacionsede, nombresede, tipoid, numeroidentificacion, naturalezajuridica, ese, municipio_prestador, departamentoprestadordesc, municipioprestadordesc, direccionprestador, email_prestador, telefonoprestador, municipiosede, departamentodededesc, municipiosededesc, direcci_nsede, email_sede, t_lefonosede, claseprestador, fecha_corte_reps`

[fuente](https://www.datos.gov.co/Salud-y-Protecci-n-Social/Registro-Especial-de-Prestadores-y-Sedes-de-Servic/c36g-9fc2)

### WEB-9be2f

**MinSalud — Directorio de IPS, exporta en bloque sin login**

Formulario ASP.NET con botones nativos `btExcel` y `btTexto`. Probado con curl: búsqueda **sin filtros** salvo tipo de entidad, luego postback de `btExcel`.

| Tipo | HTTP | Bytes | Filas |
| --- | --- | ---: | ---: |
| IPS Privadas | 200 | 9.189.611 | **25.766** |
| IPS Públicas | 200 | 1.704.508 | **4.713** |
| Profesional Independiente | 200 | 35.712.925 | **103.367** |
| Transporte Especial | 200 | 367.140 | **1.031** |

≈ **134.877 filas prestador+sede en cuatro requests.** 12 columnas, incluida `gerente` = representante legal, que datos.gov.co **no** tiene. En IPS Privadas, **25.697 de 25.766 filas traen email (99,7%)**.

Más fresco que datos.gov.co y más rico; pero sin licencia explícita ni rate limits documentados.

[fuente](https://prestadores.minsalud.gov.co/directorio/consultaips.aspx)

### WEB-81eef

**LO QUE NO SE PUDO: descarga a nivel de SERVICIO habilitado**

La consulta `habilitacion/consultas/habilitados_reps.aspx` —la que tiene el módulo "Servicios" con exportar a Excel— **devuelve HTTP 500 con `System.NullReferenceException` en `habilitados_reps.aspx.cs:415`**. Es un error del servidor de MinSalud, **no un bloqueo del sandbox**: otras rutas del mismo dominio respondieron 200 y 404 correctamente.

Ese corte es el que permitiría segmentar por especialidad (~226.887 servicios habilitados). En datos.gov.co no hay equivalente nacional a nivel de servicio.

[fuente](https://prestadores.minsalud.gov.co/habilitacion/)

## Sin verificar

- Frecuencia real de refresco de `c36g-9fc2`: el metadato dice "Anual", el corte es
  Mar-2026 y hoy es 2026-09-13 — el dataset está ~6 meses desactualizado.
- Términos de uso y rate limits del postback de `consultaips.aspx`. Para uso
  productivo, la vía defendible es datos.gov.co (CC BY-SA 4.0).
- El módulo de cubos autenticado de SISPRO no se probó.
