---
description: Exportación total del historial completo de Cowork al vault de Obsidian. Lee TODAS las sesiones pasadas, archivos, skills y docs creados, y los vuelca como notas estructuradas bajo metodología PARA.
---

Lee el skill `cowork-dump` en `skills/cowork-dump/SKILL.md`. Luego ejecuta el workflow completo de exportación total.

## Qué hace este comando

NO guarda solo la sesión actual. Hace una exportación EXHAUSTIVA:

1. Lista todas las sesiones de Cowork con `mcp__ccd_session_mgmt__list_sessions`
2. Lee los transcripts completos de cada sesión con `mcp__ccd_session_mgmt__search_session_transcripts`
3. Escanea todos los archivos del proyecto: skills/, commands/, docs/, scripts/, agents/
4. Lee CLAUDE.md y CHANGELOG.md para el estado del proyecto
5. Construye un inventario completo antes de crear nada
6. Presenta el inventario al usuario para confirmar el alcance
7. Crea notas estructuradas en wiki/ bajo metodología PARA
8. Actualiza index.md, log.md y hot.md

## Uso

- `/cowork-dump` — exportación total: todas las sesiones + todos los archivos del proyecto
- `/cowork-dump sesiones` — solo el historial de sesiones, no escanea archivos
- `/cowork-dump archivos` — solo escanea archivos del proyecto, no lee sesiones
- `/cowork-dump [pilar]` — exportación filtrada a un pilar: socialdrop | sabueso | ventas | genix | club
- `/cowork-dump desde [fecha]` — solo sesiones a partir de esa fecha

## Antes de crear notas

Siempre presentar el inventario al usuario primero:
- Cuántas sesiones se encontraron y el período que cubren
- Qué archivos/skills/docs existen en el proyecto
- Cuántas notas se van a crear vs. actualizar
- Si hay contenido sensible que no se debe volcar

Esperar confirmación antes de escribir al wiki.

## Si no hay vault configurado

Si `wiki/` no existe o está vacío, informar al usuario y sugerir ejecutar `/wiki` primero para inicializar el vault.
