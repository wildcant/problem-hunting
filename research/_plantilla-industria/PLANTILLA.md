# Plantilla de industria

Este directorio es el **esqueleto** que se copia para abrir una industria nueva.
No es investigación: los `{{NOMBRE}}`, `{{SLUG}}` y `{{FECHA}}` son marcadores
que sustituye el script.

```bash
scripts/nueva-industria.sh transporte-carga "Transporte de carga"
```

El script copia todo salvo este archivo, sustituye los marcadores y registra la
fila en `research/INDICE.md`. **No copies el directorio a mano** — el índice
queda desincronizado.

Los cuatro archivos numerados los llena su playbook (`research/playbooks/`), en
orden. Si cambiás un campo de la plantilla, cambiá también el bloque de salida
del playbook que lo escribe, o la próxima corrida lo vuelve a escribir con la
forma vieja.
