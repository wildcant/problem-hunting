# briefs/ — scratch del motor

Directorio de trabajo de `last30days` (`LAST30DAYS_MEMORY_DIR`). Acá caen el
store SQLite y los briefs que el motor genera durante una corrida.

**No es donde vive la evidencia.** Los crudos que respaldan un hallazgo se
mueven al directorio de su industria:

```
research/industrias/<slug>/briefs/
```

Los `.db` están en `.gitignore`; los `.md` que queden acá sueltos son restos de
corridas sin clasificar.
