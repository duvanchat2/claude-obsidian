---
title: "Estructura de Conocimiento — Club AI Marketing Automation"
tags:
  - curriculum
  - club-ai-marketing
  - conocimiento
  - educacion
fecha: 2026-06-08
estado: activo
metodologia: PARA/Areas
relacionado:
  - "[[Club AI Marketing - Hub]]"
  - "[[Hoja de Ruta Club AI Marketing]]"
  - "[[SocialDrop - Hub]]"
  - "[[El Sabueso - Hub]]"
  - "[[Automatizacion Ventas - Hub]]"
---

# Estructura de Conocimiento del Club

## Pilar 1: Fundamentos de Automatización

### Módulo 1.1: El ecosistema de herramientas

**Objetivo:** El miembro entiende qué herramienta usar en cada situación.

| Herramienta | Cuándo usarla | Costo |
|-------------|--------------|-------|
| Make (Integromat) | Automatizaciones visuales, sin código | Desde gratis |
| n8n | Self-hosted, workflows complejos | Gratis (self-hosted) |
| Zapier | Integraciones simples, fácil onboarding | Desde $20/mes |
| Notion | Base de datos, CRM, documentación | Desde gratis |
| Airtable | Base de datos más potente que Notion | Desde gratis |
| Apify | Scraping web a escala | Pay-per-use |
| Claude API / GPT-4 | Generación y análisis de texto | Pay-per-use |

### Módulo 1.2: APIs sin código

- Qué es una API y por qué no da miedo
- Webhooks: la magia detrás de las automatizaciones
- Autenticación: API keys, OAuth, tokens
- Cómo leer documentación de APIs
- Práctica: Conectar Notion + Make en 15 minutos

### Módulo 1.3: Seguridad y buenas prácticas

- Gestión de API keys (nunca en código, siempre en variables de entorno)
- Rate limits: qué son y cómo no excederlos
- Errores comunes y cómo manejarlos
- Backup de automatizaciones

---

## Pilar 2: Automatización de Contenido (SocialDrop)

### Módulo 2.1: El Sistema SocialDrop

Basado en [[SocialDrop - Hub]].

- Visión general del ecosistema
- Por qué automatizar el contenido es una ventaja competitiva
- Los 4 módulos: descubrimiento, adaptación, programación, publicación

### Módulo 2.2: El Sabueso — Descubrimiento Viral

Basado en [[El Sabueso - Hub]].

- Configurar Apify para monitoreo de TikTok / Instagram
- El sistema de scoring: cómo evaluar si algo es realmente viral
- Conectar Apify con Notion via Make
- Los [[Patrones de Clasificacion Viral|7 arquetipos de contenido viral]]

### Módulo 2.3: Adaptación con IA

- Prompts efectivos para reescribir contenido manteniendo la esencia viral
- Adaptación de hooks para diferentes nichos
- Generación de captions y hashtags optimizados
- Herramienta: Claude API en Make (sin código)

### Módulo 2.4: Programación y Publicación

Basado en [[Pipeline de Publicacion]].

- Conectar Make con Buffer / APIs nativas
- Programación inteligente (mejores horarios por plataforma)
- Manejo de errores de publicación
- Reporte semanal automatizado de resultados

---

## Pilar 3: Automatización de Ventas

### Módulo 3.1: El Pipeline OBS → WhatsApp

Basado en [[Automatizacion Ventas - Hub]].

- Configurar OBS con obs-websocket
- Integrar AssemblyAI via Make
- Análisis de llamadas con Claude API
- Generación y envío automático de propuestas

### Módulo 3.2: CRM Automatizado en Notion

- Estructura del CRM para seguimiento de leads
- Automatización de cambios de estado
- Dashboard de pipeline de ventas
- Alertas de seguimiento pendiente

### Módulo 3.3: Secuencias de Follow-up

- Diseño de secuencias por temperatura del lead
- Templates de WhatsApp que convierten
- Automatización de la secuencia en Make
- Reglas de parada y transición

### Módulo 3.4: Calificación Automática de Leads

Basado en [[Estrategia Automatizacion Leads Genix]].

- Diseño de formularios de calificación
- Fórmula de scoring de leads
- Segmentación automática: Hot / Warm / Cold
- Caso de estudio: [[Genix Academy - Hub]]

---

## Pilar 4: Casos de Éxito y Plantillas

### Módulo 4.1: Casos documentados

- [[Genix Academy - Hub]] — Automatización de leads
- [Próximo caso por añadir]
- [Próximo caso por añadir]

### Módulo 4.2: Biblioteca de recursos

- Scenarios de Make exportables (`.json`)
- Bases de Notion duplicables
- Biblioteca de prompts para automatización
- Plantillas de mensajes WhatsApp aprobados por Meta

---

## Pilar 5: Avanzado — Agentes de IA (Pro)

### Módulo 5.1: Introducción a Agentes

- Qué es un agente de IA vs. un chatbot
- Claude API con tool use (herramientas)
- Diseño de agentes para tareas de marketing

### Módulo 5.2: Agentes para automatización de contenido

- Agente que decide qué contenido publicar cada día
- Agente que monitorea y responde comentarios
- Agente de análisis de rendimiento

### Módulo 5.3: Orquestación multi-agente

- Coordinación de múltiples agentes
- Patrones: supervisor, colaboración, pipeline
- Implementación práctica en Make + Claude API

---

*Ver también: [[Club AI Marketing - Hub]] | [[Hoja de Ruta Club AI Marketing]]*
