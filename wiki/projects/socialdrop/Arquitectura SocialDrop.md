---
title: "Arquitectura SocialDrop"
tags:
  - arquitectura
  - socialdrop
  - tecnico
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[SocialDrop - Hub]]"
  - "[[Stack Tecnologico SocialDrop]]"
  - "[[Pipeline de Publicacion]]"
---

# Arquitectura Técnica — SocialDrop

## Capas del Sistema

### Capa 1: Ingesta de Datos (El Sabueso)

```
Fuentes externas:
├── TikTok (Apify scraper)
├── Instagram Reels (Apify scraper)
├── YouTube Shorts (Apify scraper)
└── Twitter/X tendencias (API)
        ↓
    Normalización JSON
        ↓
    Base Notion "Viral Pool"
```

### Capa 2: Motor de Clasificación

Cada pieza de contenido recibe un **Viral Score** compuesto:

| Componente | Peso | Descripción |
|------------|------|-------------|
| Engagement Rate | 35% | Likes + comments + shares / views |
| Velocidad de crecimiento | 25% | Views en primeras 24h |
| Relevancia de nicho | 20% | Match con keywords del cliente |
| Novedad del formato | 10% | ¿Es un formato nuevo o saturado? |
| Puntuación del creador | 10% | Historial del creador original |

**Umbral de corte:** Score ≥ 65 pasa a adaptación.

### Capa 3: Adaptación con IA

```
Input: Transcripción + metadata del video viral
        ↓
    Prompt especializado (ver [[Prompts Motor Adaptacion]])
        ↓
    Output: Guión adaptado + Hook alternativo + CTA
        ↓
    Almacenado en Notion "Cola de Producción"
```

### Capa 4: Pipeline de Publicación

```
Cola de Producción (Notion)
        ↓
    Make / n8n automation trigger
        ↓
    ¿Video creado? → Publicación directa vía API
    ¿Solo guión? → Notificación al equipo de producción
        ↓
    Buffer / API nativa de plataforma
        ↓
    Post publicado + ID registrado en Notion
```

### Capa 5: Analytics Loop

```
Plataforma nativa (métricas)
        ↓
    Webhook → Make → Notion update
        ↓
    Actualización de score del formato
        ↓
    Retroalimentación al motor de clasificación
```

## Decisiones de Diseño

### ¿Por qué Notion como base de datos central?

- Visualización no técnica para clientes
- API flexible para integraciones Make/n8n
- Vistas personalizadas por cliente sin código extra

### ¿Por qué Apify para scraping?

- Mantenimiento de scrapers delegado (no código propio)
- Escalable por cliente sin infraestructura propia
- Costo predecible por volumen

### ¿Por qué Make sobre n8n?

- Menor fricción para onboarding de clientes no técnicos
- Conectores nativos a Buffer, Notion, WhatsApp
- Alternativa: n8n self-hosted para clientes enterprise

## Dependencias Críticas

| Servicio | Rol | Fallback |
|----------|-----|---------|
| Apify | Scraping de redes | Manual review |
| Notion API | Base de datos | Airtable |
| Make | Orquestación | n8n |
| Claude/GPT-4 | Adaptación IA | Prompt manual |
| Buffer | Publicación | APIs nativas directas |

---

*Ver también: [[Stack Tecnologico SocialDrop]] | [[El Sabueso - Hub]] | [[Pipeline de Publicacion]]*
