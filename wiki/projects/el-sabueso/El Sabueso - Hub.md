---
title: "El Sabueso — Hub del Proyecto"
tags:
  - proyecto
  - el-sabueso
  - viral
  - apify
  - notion
  - descubrimiento-contenido
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
skill: "/viral:discover"
relacionado:
  - "[[SocialDrop - Hub]]"
  - "[[Sistema de Scoring Viral]]"
  - "[[Integracion Notion Apify]]"
  - "[[Patrones de Clasificacion Viral]]"
---

# El Sabueso — Cazador de Contenido Viral

> Motor de descubrimiento y clasificación de contenido viral. Monitorea TikTok, Instagram, YouTube y Twitter en tiempo real para identificar piezas con potencial de replicación para los clientes de SocialDrop.

## Qué Es El Sabueso

El Sabueso es el módulo de inteligencia de SocialDrop. Su trabajo:

1. **Olfatear:** Monitorear continuamente las principales plataformas de contenido
2. **Clasificar:** Aplicar scoring multidimensional para separar lo viral de lo ordinario
3. **Presentar:** Entregar candidatos relevantes por nicho de cliente en Notion

**Skill de activación:** `/viral:discover`

## Arquitectura de El Sabueso

```
Fuentes de datos
├── TikTok Scraper (Apify)
├── Instagram Reels Scraper (Apify)
├── YouTube Shorts Scraper (Apify)
└── Twitter Trending Topics (API v2)
        ↓
   Normalización de datos
   (scripts/sabueso-normalize.js)
        ↓
   Motor de Scoring
   (ver [[Sistema de Scoring Viral]])
        ↓
   Notion DB "Viral Pool"
        ↓
   Filtros por cliente/nicho
        ↓
   Vista personalizada por cliente
```

## Integraciones Clave

### Apify

El Sabueso usa Apify como infraestructura de scraping. No mantenemos scrapers propios.

Actors activos:
- `clockworks/tiktok-scraper` — TikTok por hashtag/tendencia
- `apify/instagram-reel-scraper` — Reels por perfil/hashtag
- `bernardo/youtube-shorts-scraper` — Shorts por keyword
- `lukaskrivka/twitter-trend-scraper` — Trending topics por región

Ver [[Integracion Notion Apify]] para el flujo técnico de conexión.

### Notion

Base de datos central: **"Viral Pool"**

Campos principales:
| Campo | Tipo | Descripción |
|-------|------|-------------|
| Título | Texto | Descripción del contenido |
| Plataforma | Select | TikTok / IG / YT / Twitter |
| URL original | URL | Enlace al contenido fuente |
| Viral Score | Número | 0-100, calculado automáticamente |
| Nicho | Multi-select | Marketing / Fitness / Finance / etc. |
| Estado | Select | Nuevo / En revisión / Aprobado / Descartado |
| Cliente asignado | Relación | Link a DB de clientes |
| Fecha de detección | Fecha | Timestamp de ingesta |
| Métricas | Texto JSON | Views, likes, shares al momento de captura |

## Sistema de Scoring Viral

Ver [[Sistema de Scoring Viral]] para la fórmula completa.

**Resumen del score:**

```
Viral Score = (Engagement Rate × 0.35) + 
              (Velocidad 24h × 0.25) + 
              (Relevancia nicho × 0.20) + 
              (Novedad formato × 0.10) + 
              (Score creador × 0.10)
```

**Umbrales:**
- Score ≥ 80: Auto-aprobado para adaptación
- Score 65-79: Revisión humana recomendada
- Score < 65: Auto-descartado

## Patrones de Clasificación

Ver [[Patrones de Clasificacion Viral]] para los 7 arquetipos de contenido viral identificados y sus señales características.

## Skill `/viral:discover`

Al ejecutar `/viral:discover`:

1. Consulta Notion por items con estado "Nuevo" en las últimas 24h
2. Aplica filtros de nicho según el perfil activo
3. Presenta los top-10 por Viral Score
4. Permite aprobar/descartar/asignar a cliente directamente desde Claude

## Frecuencia de Monitoreo

| Plataforma | Frecuencia | Horario |
|------------|-----------|---------|
| TikTok | Cada 2 horas | 6am - 11pm |
| Instagram | Cada 3 horas | 7am - 10pm |
| YouTube | 2 veces al día | 8am y 6pm |
| Twitter | Cada hora | Todo el día |

## Estado Actual

- Scrapers de TikTok e Instagram: operativos
- Scraper YouTube Shorts: en pruebas
- Twitter: integrado (limitado por rate limits del plan gratuito)
- Dashboard de monitoreo de salud: pendiente

---

*Navegación: [[index]] | [[SocialDrop - Hub]] | [[Sistema de Scoring Viral]] | [[Integracion Notion Apify]]*
