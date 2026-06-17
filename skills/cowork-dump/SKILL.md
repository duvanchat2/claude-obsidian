---
name: cowork-dump
description: >
  Exportación total del historial completo de Cowork al vault de Obsidian.
  Lee TODAS las sesiones pasadas, todos los archivos creados, todos los skills,
  docs y artefactos del proyecto, los sintetiza y los vuelca como una red de notas
  estructuradas bajo metodología PARA, conectadas con wikilinks al ecosistema existente.
  Triggers: "/cowork-dump", "/dump", "/export-all", "guarda todo el historial",
  "vuelca todo cowork", "exporta todo al wiki", "dump completo", "exporta el historial",
  "guarda todo desde el inicio", "vuelca todo lo que has hecho".
allowed-tools: Read Write Edit Glob Grep Bash
---

# cowork-dump: Exportación Total del Historial de Cowork

Este skill hace una sola cosa pero a fondo: saca TODO el conocimiento acumulado en Cowork — cada sesión desde el inicio, cada archivo creado, cada skill construido, cada decisión tomada — y lo estructura permanentemente en Obsidian.

No es un resumen de la sesión actual. Es el volcado completo del proyecto.

---

## Diferencia Clave con `/save`

| `/save` | `/cowork-dump` |
|---------|---------------|
| Guarda la conversación actual | Exporta TODAS las sesiones del historial |
| 1 nota de sesión | Múltiples notas organizadas por pilar |
| Rápido | Exhaustivo |
| Para insights puntuales | Para capturar el estado completo del proyecto |

---

## Paso 0: Obtener el Historial Completo

### 0.1 — Listar todas las sesiones

Usar la herramienta de gestión de sesiones de Cowork para obtener el historial:

```
mcp__ccd_session_mgmt__list_sessions
```

Esto devuelve todas las sesiones pasadas con sus IDs, títulos y fechas.

### 0.2 — Leer los transcripts completos

Para cada sesión en la lista, obtener el contenido completo:

```
mcp__ccd_session_mgmt__search_session_transcripts
  query: "[término relevante del proyecto]"
```

Hacer múltiples búsquedas con los términos clave del proyecto para capturar todo:
- "SocialDrop"
- "El Sabueso"
- "automatización ventas"
- "Genix Academy"
- "Club AI Marketing"
- "Make scenario"
- "Apify"
- "AssemblyAI"
- "WhatsApp"
- "skill"
- "Obsidian"

### 0.3 — Leer todos los archivos del proyecto

Escanear sistemáticamente todos los archivos creados en el proyecto de Cowork:

```bash
# Listar skills creados
find skills/ -name "SKILL.md" | sort

# Listar comandos
find commands/ -name "*.md" | sort

# Listar documentación
find docs/ -name "*.md" | sort

# Listar scripts
find scripts/ -name "*.py" -o -name "*.sh" -o -name "*.js" | sort

# Listar agentes
find agents/ -name "*.md" | sort

# Listar notas del wiki ya existentes
find wiki/ -name "*.md" | sort

# Ver el CLAUDE.md para entender el estado actual del proyecto
cat CLAUDE.md

# Ver el CHANGELOG para el historial de versiones
cat CHANGELOG.md 2>/dev/null || echo "Sin CHANGELOG"
```

---

## Paso 1: Inventario de Conocimiento

Antes de crear notas, construir un inventario mental de todo lo encontrado:

```
INVENTARIO COWORK
=================
SESIONES: [N sesiones encontradas, rango de fechas]
SKILLS CREADOS: [lista]
COMANDOS CREADOS: [lista]
DOCS CREADOS: [lista]
SCRIPTS CREADOS: [lista]
DECISIONES ARQUITECTÓNICAS: [lista de decisiones clave]
SISTEMAS CONFIGURADOS: [lista]
CLIENTES/PROYECTOS TRABAJADOS: [lista]
APRENDIZAJES NO OBVIOS: [lista]
TAREAS PENDIENTES MENCIONADAS: [lista]
```

Presentar este inventario al usuario ANTES de crear notas, para confirmar el alcance.

---

## Paso 2: Clasificar por Pilar PARA

Organizar todo el inventario en los pilares del Segundo Cerebro:

### Proyectos (`wiki/projects/`)

| Contenido del historial | Destino |
|------------------------|---------|
| Todo sobre SocialDrop | `wiki/projects/socialdrop/` |
| Todo sobre El Sabueso / viral / Apify | `wiki/projects/el-sabueso/` |
| Todo sobre ventas / OBS / AssemblyAI / WhatsApp | `wiki/projects/automatizacion-ventas/` |
| Todo sobre Genix Academy | `wiki/projects/genix-academy/` |
| Todo sobre otros clientes | `wiki/projects/[cliente]/` |

### Áreas (`wiki/areas/`)

| Contenido del historial | Destino |
|------------------------|---------|
| Todo sobre Club AI Marketing / Skool | `wiki/areas/club-ai-marketing/` |

### Recursos (`wiki/resources/`)

| Contenido del historial | Destino |
|------------------------|---------|
| Skills creados, su propósito y uso | `wiki/resources/skills/` |
| Stack tecnológico, herramientas | `wiki/resources/herramientas/` |
| Plantillas, prompts, templates | `wiki/resources/plantillas/` |
| Scripts y automatizaciones | `wiki/resources/scripts/` |

### Meta (`wiki/meta/`)

| Contenido del historial | Destino |
|------------------------|---------|
| Decisiones arquitectónicas del proyecto | `wiki/meta/decisiones/` |
| Línea de tiempo del proyecto | `wiki/meta/timeline-cowork.md` |
| Estado actual del sistema | `wiki/meta/estado-actual.md` |

---

## Paso 3: Verificar Notas Existentes

Antes de crear cualquier nota nueva, escanear lo que ya existe en wiki/:

```bash
# Ver estructura actual completa
find wiki/ -name "*.md" | sort

# Buscar notas que podrían solaparse con lo que se va a crear
grep -r "SocialDrop\|El Sabueso\|Genix\|AssemblyAI" wiki/ --include="*.md" -l
```

Para cada nota que ya existe y tiene contenido relacionado:
- **Actualizar** con el nuevo conocimiento del historial
- Agregar sección `## Actualización [fecha]` al final si la nota ya tiene contenido
- **No duplicar** — si ya existe `El Sabueso - Hub.md`, enriquecerla, no crear otra

---

## Paso 4: Crear las Notas

### Nota de Timeline (siempre crear)

`wiki/meta/timeline-cowork.md`

```yaml
---
title: "Timeline del Proyecto Cowork"
tags:
  - meta
  - timeline
  - historial
fecha: YYYY-MM-DD
estado: activo
metodologia: PARA/Meta
relacionado:
  - "[[index]]"
  - "[[hot]]"
---
```

Contenido: línea de tiempo cronológica de todo lo construido:
```
[fecha] — [qué se hizo / decidió / creó]
[fecha] — [qué se hizo / decidió / creó]
...
```

### Notas de Hubs (crear o enriquecer)

Para cada pilar con contenido en el historial, asegurarse de que su Hub tiene:
- Contexto completo del estado actual
- Todos los componentes y su estado (activo / en desarrollo / pendiente)
- Decisiones arquitectónicas tomadas durante las sesiones
- Aprendizajes no obvios descubiertos

### Nota de Skills Instalados (si hay skills nuevos)

`wiki/resources/skills/Skills Instalados.md`

Documentar cada skill creado durante las sesiones de Cowork:
- Nombre, comando de trigger
- Qué hace exactamente
- Cuándo usarlo
- Archivos: `skills/[nombre]/SKILL.md`, `commands/[nombre].md`

### Notas de Decisiones Arquitectónicas

`wiki/meta/decisiones/[Decisión].md` — una nota por decisión importante:

```yaml
---
title: "Decisión: [Tema]"
fecha_decision: YYYY-MM-DD
estado: activa
tags:
  - decision
  - arquitectura
---

## Contexto
[Por qué se tomó esta decisión]

## La Decisión
[Qué se decidió exactamente]

## Alternativas Descartadas
[Qué otras opciones había y por qué no se eligieron]

## Consecuencias
[Qué implica esta decisión para el sistema]
```

---

## Paso 5: Actualizar Navegación

Después de crear/actualizar todas las notas:

**`wiki/index.md`** — agregar todas las notas nuevas en sus secciones PARA correspondientes.

**`wiki/log.md`** — una entrada al top:
```markdown
## [YYYY-MM-DD] cowork-dump | Exportación Total del Historial
- Sesiones procesadas: [N]
- Notas creadas: [N] — [lista de títulos]
- Notas actualizadas: [N] — [lista de títulos]
- Período cubierto: [fecha inicio] → [fecha fin]
- Skills documentados: [lista]
```

**`wiki/hot.md`** — actualizar el bloque "Last Updated":
```markdown
[YYYY-MM-DD]: DUMP TOTAL de Cowork completado.
Sesiones procesadas: [N]. Notas creadas: [N]. Notas actualizadas: [N].
Estado del ecosistema post-dump: [resumen de 2-3 líneas del estado actual de cada pilar].
Pendientes capturados: [N tareas].
```

---

## Paso 6: Reporte Final al Usuario

Al terminar, entregar un reporte estructurado:

```
═══════════════════════════════════════
DUMP COMPLETO DE COWORK — COMPLETADO
═══════════════════════════════════════

SESIONES PROCESADAS: [N]
  Período: [fecha más antigua] → [fecha más reciente]

NOTAS CREADAS ([N]):
  → [[Nota 1]] — wiki/[carpeta]/
  → [[Nota 2]] — wiki/[carpeta]/
  ...

NOTAS ACTUALIZADAS ([N]):
  → [[Nota existente 1]] — sección añadida
  ...

SKILLS DOCUMENTADOS:
  → /cowork-dump, /save, [otros]

DECISIONES ARQUITECTÓNICAS CAPTURADAS:
  → [[Decisión: X]]
  → [[Decisión: Y]]

TAREAS PENDIENTES CAPTURADAS: [N]
  (Ver sección "Pendientes Identificados" en cada nota)

PRÓXIMO PASO SUGERIDO:
  Ejecuta `/cowork-dump` de nuevo después de cada sesión importante
  para mantener el wiki actualizado.
═══════════════════════════════════════
```

---

## Manejo de Errores

| Situación | Acción |
|-----------|--------|
| No se encuentran sesiones previas | Volcar solo el estado actual del proyecto (archivos existentes) |
| Sesión con contenido sensible (claves, tokens) | Documentar que existe, no el valor |
| Contenido que contradice notas existentes | Agregar `> [!contradiction]` y documentar ambas versiones |
| Más de 20 notas potenciales | Agrupar las menores, priorizar los hubs |
| Nota existente muy desactualizada | Reescribir completa con sección "Historial de cambios" |

---

## How to Think (10-principle mapping)

| # | Principio | Aplicación en dump total |
|---|-----------|------------------------|
| 1 | OBSERVE (ext) | Leer TODAS las sesiones y TODOS los archivos antes de crear nada. |
| 2 | OBSERVE (int) | ¿Hay información sensible? ¿Hay contradicciones entre sesiones? Notarlas antes de escribir. |
| 3 | LISTEN | Presentar el inventario al usuario y confirmar alcance antes de crear las notas. |
| 4 | THINK | Clasificar en PARA. Decidir qué crear vs. qué actualizar. Ordenar por importancia. |
| 5 | CONNECT (lat) | Escanear wiki/ existente. Actualizar > duplicar siempre. |
| 6 | CONNECT (sys) | Index + log + hot.md + todas las notas = operación atómica. |
| 7 | FEEL | ¿Alguien leyendo estas notas en frío entiende el sistema? ¿Los wikilinks conectan el ecosistema real? |
| 8 | ACCEPT | Credenciales, datos de clientes y URLs privadas no van en texto plano en el wiki. |
| 9 | CREATE | Notas → navegación → reporte. En ese orden. |
| 10 | GROW | El dump total revela qué áreas del wiki estaban vacías. Esas son las prioridades de documentación futura. |
