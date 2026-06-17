---
type: session
title: "Instalación Windows + configuración /save"
created: 2026-06-17
updated: 2026-06-17
tags:
  - windows
  - instalacion
  - powershell
  - setup
  - save-skill
status: complete
related:
  - "[[wiki/references/transport-fallback.md]]"
---

# Instalación Windows + configuración /save

## Qué se hizo

### Script de instalación para Windows

Se creó `bin/install-windows.ps1` — un script PowerShell que automatiza la instalación completa del vault en Windows sin intervención manual más allá de un único comando.

**Comando de instalación:**
```powershell
irm https://raw.githubusercontent.com/duvanchat2/claude-obsidian/claude/keen-gauss-MzIJb/bin/install-windows.ps1 | iex
```

**Lo que hace el script:**
1. Instala Git via `winget` si no está presente
2. Clona el vault en `$env:USERPROFILE\Documents\claude-obsidian`
3. Descarga los plugins de Obsidian desde GitHub Releases: Dataview, Templater, Obsidian Git
4. Escribe `community-plugins.json` habilitando los plugins

**Pasos post-instalación:**
1. Abrir Obsidian
2. "Open folder as vault" → seleccionar `Documentos\claude-obsidian`
3. Activar plugins cuando Obsidian lo pida

### Configuración del vault

Se creó `.claude/settings.json` con permisos base para que las skills del vault puedan operar sin prompts innecesarios:
- `Read/Write/Edit` en `wiki/**`
- `Read` en `.raw/**` y `skills/**`
- `Bash` para `scripts/*` y `python3 scripts/*`

### Sobre el skill /save

El skill `/save` está definido en `skills/save/SKILL.md` y Claude Code lo carga automáticamente desde la carpeta `skills/` del proyecto. No requiere registro manual.

En Claude Code on the web, `/save` es un workflow que Claude ejecuta directamente al leer el SKILL.md — no un comando binario. Para usarlo: escribir `/save` en cualquier sesión con este proyecto como directorio de trabajo activo.

## Prompt para exportar contexto a Obsidian

Para volcar todo el contexto de cualquier sesión de Claude (chat, code, cowork) a Obsidian:

```
Quiero que exportes ABSOLUTAMENTE TODO el contexto de esta conversación a Obsidian.

Incluye sin omitir nada:
- Todo el historial de mensajes (usuario + asistente, en orden cronológico)
- Todos los archivos que leíste, editaste o creaste (con su contenido completo)
- Todos los comandos que ejecutaste y sus outputs
- Todas las decisiones que tomamos y por qué
- Todo el contexto del proyecto: estructura de archivos, tecnologías, configuraciones
- Cualquier código generado (completo, no resumido)
- Errores encontrados y cómo se resolvieron
- El estado actual del proyecto al terminar

Formato de salida: una nota Obsidian en Markdown.
- Título: [fecha ISO] + tema principal
- Secciones con headers ##
- Código en bloques ```
- Sin resumir, sin comprimir

Guárdalo en: wiki/sessions/[YYYY-MM-DD]-[tema-corto].md
```

Para sesiones muy largas: agregar instrucción de dividir en partes con `[[wikilinks]]` entre ellas.
