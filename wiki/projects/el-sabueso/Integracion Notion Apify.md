---
title: "Integración Notion + Apify — El Sabueso"
tags:
  - integracion
  - notion
  - apify
  - el-sabueso
  - tecnico
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[El Sabueso - Hub]]"
  - "[[Sistema de Scoring Viral]]"
  - "[[Arquitectura SocialDrop]]"
---

# Integración Notion + Apify

## Flujo Técnico Completo

```
Apify Actor (scraper)
        ↓
    Dataset de Apify
    (JSON estructurado)
        ↓
    Make Scenario: "Sabueso — Ingestor"
    ├── Trigger: Apify webhook (run finished)
    ├── Iterator: recorre cada item del dataset
    ├── Transformer: normaliza a schema de Notion
    ├── Scorer: calcula Viral Score
    └── Writer: crea/actualiza registro en Notion DB
        ↓
    Notion "Viral Pool" DB
```

## Schema de Datos Apify → Notion

### Datos que llegan de Apify (ejemplo TikTok)

```json
{
  "id": "7380012345678901234",
  "text": "El secreto que nadie te dice sobre automatización...",
  "authorMeta": {
    "id": "123456",
    "name": "marketingpro",
    "fans": 250000
  },
  "stats": {
    "diggCount": 45200,
    "commentCount": 890,
    "shareCount": 3100,
    "playCount": 380000
  },
  "createTime": 1717862400,
  "webVideoUrl": "https://www.tiktok.com/@marketingpro/video/...",
  "hashtags": ["marketing", "automatizacion", "ia"]
}
```

### Transformación a campos Notion

```javascript
// scripts/sabueso-normalize.js (pseudocódigo)
const normalizeApifyToNotion = (item, platform) => ({
  titulo: item.text?.slice(0, 100),
  plataforma: platform,
  url_original: item.webVideoUrl || item.shortCode,
  viral_score: calcularScore(item, platform),
  nicho: detectarNicho(item.hashtags, item.text),
  estado: "Nuevo",
  cliente_asignado: null,
  fecha_deteccion: new Date().toISOString(),
  metricas_raw: JSON.stringify({
    views: item.stats.playCount,
    likes: item.stats.diggCount,
    comments: item.stats.commentCount,
    shares: item.stats.shareCount,
    engagement_rate: calcER(item.stats)
  })
})
```

## Configuración de Apify

### Actors configurados

**TikTok Scraper**
```
Actor: clockworks/tiktok-scraper
Input:
{
  "searchSection": "trending",
  "maxItems": 50,
  "proxyConfiguration": { "useApifyProxy": true },
  "hashtags": ["<keywords del nicho>"]
}
Webhook: POST https://hook.us1.make.com/sabueso-ingestor
Frecuencia: Cada 2 horas
```

**Instagram Reel Scraper**
```
Actor: apify/instagram-reel-scraper
Input:
{
  "search": "<keywords>",
  "resultsLimit": 30,
  "addParentData": true
}
Webhook: POST https://hook.us1.make.com/sabueso-ingestor
Frecuencia: Cada 3 horas
```

### Gestión de costos Apify

| Actor | Costo aprox. | Por ejecución |
|-------|-------------|---------------|
| TikTok Scraper | $0.80-1.20 | 50 items |
| Instagram Scraper | $0.60-0.90 | 30 items |
| YouTube Shorts | $0.40-0.70 | 25 items |

**Presupuesto mensual estimado:** $40-80 USD (dependiendo de frecuencia y clientes activos)

## Make Scenario: Sabueso Ingestor

**Estructura del escenario:**

```
1. Webhook receiver (trigger)
2. HTTP: Get Apify dataset items
3. Iterator: for each item
4. Router: switch platform
5. Transform + Score (Tools > JSON parse)
6. Notion: Search for existing URL (dedup)
7. Router: ¿ya existe?
   ├── Sí → Notion: Update record (refresh métricas)
   └── No → Notion: Create record
8. Log result
```

**URL del webhook:** Almacenada en Make (no hardcodear aquí)

## Configuración de Notion

### Base de datos "Viral Pool"

**ID de la DB:** Ver `.env` del proyecto (no incluir aquí)

**Vistas activas:**
- "Por Score" — todos los items ordenados por Viral Score desc
- "Nuevos hoy" — filtro: fecha detección = hoy, estado = Nuevo
- "Por Cliente: [Nombre]" — una vista por cliente activo
- "Aprobados sin asignar" — estado = Aprobado, cliente = vacío

## Troubleshooting Común

| Problema | Causa | Solución |
|----------|-------|---------|
| Items duplicados | Webhook disparó dos veces | Check dedup por URL en Make |
| Score = 0 | Stats vacíos de Apify | Actor no capturó métricas, re-run |
| Notion API 409 | Rate limit | Agregar delay de 500ms entre creates |
| Actor falla silenciosamente | Proxy bloqueado | Rotar proxy en Apify settings |

---

*Ver también: [[El Sabueso - Hub]] | [[Sistema de Scoring Viral]] | [[Patrones de Clasificacion Viral]]*
