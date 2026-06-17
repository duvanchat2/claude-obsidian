---
type: meta
title: "Wiki Index — Centro de Mandos"
updated: 2026-06-08
tags:
  - meta
  - index
  - para
  - segundo-cerebro
status: evergreen
related:
  - "[[overview]]"
  - "[[log]]"
  - "[[hot]]"
  - "[[SocialDrop - Hub]]"
  - "[[El Sabueso - Hub]]"
  - "[[Automatizacion Ventas - Hub]]"
  - "[[Club AI Marketing - Hub]]"
  - "[[Genix Academy - Hub]]"
---

# Centro de Mandos — Segundo Cerebro

> Vault organizado bajo metodología **PARA**. Ecosistema de automatización de marketing con IA. Actualizado: 2026-06-08.

Navigation: [[overview]] | [[log]] | [[hot]] | [[Wiki Map]] | [[getting-started]]

---

## Estado del Ecosistema

| Sistema | Estado | Hub |
|---------|--------|-----|
| SocialDrop | Activo | [[SocialDrop - Hub]] |
| El Sabueso | Activo | [[El Sabueso - Hub]] |
| Automatización Ventas | Activo | [[Automatizacion Ventas - Hub]] |
| Genix Academy | En documentación | [[Genix Academy - Hub]] |
| Club AI Marketing | Activo | [[Club AI Marketing - Hub]] |

---

## P — PROYECTOS

### Ecosistema SocialDrop

- [[SocialDrop - Hub]] — Centro de operaciones del sistema de contenido autónomo
  - [[Arquitectura SocialDrop]] — Diseño técnico de las 5 capas
  - [[Pipeline de Publicacion]] — Flujo de publicación automatizada

### El Sabueso (Cazador Viral)

- [[El Sabueso - Hub]] — Sistema de descubrimiento de contenido viral (`/viral:discover`)
  - [[Sistema de Scoring Viral]] — Fórmula y tablas de puntuación multidimensional
  - [[Integracion Notion Apify]] — Flujo técnico Apify → Notion via Make
  - [[Patrones de Clasificacion Viral]] — 7 arquetipos con señales y tasas de replicación

### Automatización de Ventas

- [[Automatizacion Ventas - Hub]] — Hub del sistema OBS → AssemblyAI → WhatsApp
  - [[Flujo OBS AssemblyAI WhatsApp]] — Diagrama técnico completo paso a paso
  - [[Motor de Transcripcion AssemblyAI]] — Configuración, diarización y análisis
  - [[Pipeline Propuestas WhatsApp]] — Estructura, personalización y secuencias

### Consultoría — Casos de Éxito

- [[Casos de Exito - Index]] — Índice completo de implementaciones
- [[Genix Academy - Hub]] — Automatización de leads para academia online
  - [[Estrategia Automatizacion Leads Genix]] — Estrategia completa + Make scenarios
  - [[Resultados Genix Academy]] — Métricas y aprendizajes

---

## A — ÁREAS

### Club AI Marketing Automation (Skool)

- [[Club AI Marketing - Hub]] — Hub de la comunidad
  - [[Hoja de Ruta Club AI Marketing]] — Roadmap de 5 fases a 12 meses
  - [[Estructura de Conocimiento del Club]] — Currículum completo de 5 pilares

---

## R — RECURSOS

- [[Stack Tecnologico SocialDrop]] — Inventario completo de herramientas y planes
- [[Arquitectura SocialDrop]] — Decisiones de diseño del ecosistema

### Pendientes de crear

- [[Plantillas de Caption]] — Templates por plataforma y nicho
- [[Prompts Motor Adaptacion]] — Prompts validados para adaptación de contenido
- [[Plantilla Sistema de Leads Academias]] — Template replicable del caso Genix
- [[Registro de Formatos Virales]] — Tracking de formatos y su ciclo de vida

---

## A — ARCHIVO

*(Proyectos completados o pausados — mover aquí cuando corresponda)*

---

## Mapa de Conexiones

```
SocialDrop ←── El Sabueso (Apify + Notion)
    └── Pipeline Publicación
    └── Motor Adaptación IA

Automatización Ventas ←── OBS ── AssemblyAI ── WhatsApp
    └── Genix Academy (caso implementado)

Club AI Marketing ← enseña todo el ecosistema
```

---

## Comandos Rápidos

| Necesito... | Ir a... |
|-------------|---------|
| Ver contenidos virales | [[El Sabueso - Hub]] |
| Revisar pipeline de ventas | [[Pipeline Propuestas WhatsApp]] |
| Ver roadmap del Club | [[Hoja de Ruta Club AI Marketing]] |
| Documentar nuevo caso | [[Casos de Exito - Index]] |
| Troubleshooting técnico | [[Stack Tecnologico SocialDrop]] |

---

## Conceptos del Sistema Base (claude-obsidian)

## Concepts

- [[LLM Wiki Pattern]] — the pattern for building persistent, compounding knowledge bases using LLMs (status: mature)
- [[Hot Cache]] — ~500-word session context file, updated after every ingest and session (status: mature)
- [[Compounding Knowledge]] — why wiki knowledge grows more valuable over time, unlike RAG (status: mature)
- [[cherry-picks]] — prioritized feature backlog from ecosystem research; 13 features to add to claude-obsidian (status: current)
- [[SVG Diagram Style Guide]] — canonical visual style for all diagrams: Space Grotesk, #0A0A0A dark theme, #E07850 accent, full design tokens (status: evergreen)
- [[Pro Hub Challenge]] — community challenge pattern for building claude-seo/claude-blog extensions; first challenge produced 6 submissions, 5 integrated in v1.9.0 (status: evergreen)
- [[Semantic Topic Clustering]] — SERP-based keyword grouping replacing paid tools; hub-spoke architecture with interactive visualization (status: evergreen)
- [[Search Experience Optimization]] — "read SERPs backwards" methodology for page-type mismatch detection and persona scoring (status: evergreen)
- [[SEO Drift Monitoring]] — "git for SEO" baseline/diff/track with 17 comparison rules and SQLite persistence (status: evergreen)
- [[DragonScale Memory]] — memory-layer spec inspired by the Heighway dragon curve; fold operator, deterministic page addresses, semantic tiling, boundary-first autoresearch (status: shipped v0.4, all four mechanisms opt-in)
- [[Persistent Wiki Artifact]]: durable Markdown page as the LLM's memory object, distinct from ephemeral chat turns (status: developing)
- [[Source-First Synthesis]]: provenance discipline; raw sources stay immutable while the wiki layer is synthesized and cited (status: developing)
- [[Query-Time Retrieval]]: wiki query path synthesizes with citations; complementary to Obsidian's in-vault search (status: developing)

---

## Entities

- [[Andrej Karpathy]] — AI researcher, creator of the LLM Wiki pattern, former Tesla AI director (status: developing)
- [[Ar9av-obsidian-wiki]] — multi-agent compatible LLM Wiki plugin; delta tracking manifest (status: current)
- [[Nexus-claudesidian-mcp]] — native Obsidian plugin + MCP bridge; workspace memory, task management (status: current)
- [[ballred-obsidian-claude-pkm]] — goal cascade PKM; auto-commit hooks, /adopt command (status: current)
- [[rvk7895-llm-knowledge-bases]] — 3-depth query system, Marp slides, parallel deep research (status: current)
- [[kepano-obsidian-skills]] — official skills from Obsidian creator; defuddle, obsidian-bases (status: current)
- [[Claudian-YishenTu]] — native Obsidian plugin embedding Claude Code; plan mode, @mention (status: current)
- [[Claude SEO]] — Tier 4 Claude Code skill for SEO analysis; 23 skills, 17 agents, 30 scripts at v1.9.0 (status: evergreen)

---

## Sources

- [[claude-obsidian-ecosystem-research]] — 2026-04-08 | web research across 16+ repos | 8 wiki pages created

---

## Questions

- [[How does the LLM Wiki pattern work]] — how the pattern works and why it outperforms RAG at human scale (status: developing)

---

## Comparisons

- [[Wiki vs RAG]] — when to use a wiki knowledge base versus RAG; verdict: wiki wins at <1000 pages
- [[claude-obsidian-ecosystem]] — feature matrix of 16+ Claude+Obsidian projects; where claude-obsidian wins and gaps

---

## Decisions

- [[2026-04-14-community-cta-rollout]] - Skool community CTA footer added to 6 skill repos with per-tool frequency rules (status: active)
- [[2026-04-15-slides-and-release-session]] - Claude SEO v1.9.0 slides (15-slide HTML deck) + GitHub release v1.9.0 with PDF asset (status: complete)
- [[2026-04-15-release-report-session]] - Claude SEO v1.9.0 Release Report PDF: dark theme, 13 pages, WeasyPrint layout fixes, Challenge v2 added (status: complete)
- [[2026-04-14-claude-seo-v190-session]] - Claude SEO v1.9.0 Pro Hub Challenge integration: 5 submissions, 4 new skills, 4 review rounds, cybersecurity audit (status: complete)

---

## Domains

<!-- Add domain entries here after scaffold -->
