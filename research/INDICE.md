# Índice de industrias

Tablero de todo lo investigado. Una fila por industria; cada una es un
directorio autocontenido en `research/industrias/`.

Estados: ⬜ sin empezar · 🔍 en investigación · ✅ tesis viva · ❌ descartado

**Problemas** = filas del catálogo de `2-dolor.md`. `candidato` tiene ≥2 fuentes
independientes; `calificado` además tiene el costo con su vía nombrada. Es el
número que alimenta la tabla índice del sitio.

| Industria | Estado | Etapa | Problemas | Puntaje | Siguiente paso |
| --- | --- | --- | :-: | :-: | --- |
| [Contadores y firmas contables](industrias/contadores/) | 🔍 en investigación | 2 · dolor | **11** (10 cand. · 1 calif.) | — | `/mercado contadores`: cerrar el eje D y el ancla de precio |
<!-- fin-tabla -->

## Agregar una industria

```bash
scripts/nueva-industria.sh transporte-carga "Transporte de carga"
```

Crea el directorio desde `research/_plantilla-industria/` y agrega la fila acá.

## Qué es compartido y qué no

**Por industria** (`research/industrias/<slug>/`): mercado, dolor, oferta,
tesis, consultas, briefs crudos, entrevistas. Nada de esto se mezcla entre
industrias.

**Compartido** (`research/`):

- [`consultas.md`](consultas.md) — taxonomía y descartes medidos
- [`comparables-internacionales.md`](comparables-internacionales.md) — los cinco arquetipos de software que movieron la aguja en economías emergentes, cuál está tomado en Colombia, cuál es cementerio y cuál sigue abierto
- [`barrido-industrias.md`](barrido-industrias.md) — filtro de las 60 industrias de la taxonomía global contra las restricciones colombianas: qué se descarta, qué pasa y en qué orden atacarlo
- [`playbooks/`](playbooks/) — las cuatro etapas
- [`facebook/`](facebook/) — lane manual
- [`archivo/estados-unidos/`](archivo/estados-unidos/) — investigación previa, congelada
