# Índice de industrias

Tablero de todo lo investigado. Una fila por industria; cada una es un
directorio autocontenido en `research/industrias/`.

Estados: ⬜ sin empezar · 🔍 en investigación · ✅ tesis viva · ❌ descartado

| Industria | Estado | Etapa | Puntaje | Siguiente paso |
| --- | --- | --- | --- | --- |
| [Contadores y firmas contables](industrias/contadores/) | 🔍 en investigación | 2 · dolor (parcial) | — | cerrar la sanción del art. 651 E.T. y correr `/mercado contadores` |
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
