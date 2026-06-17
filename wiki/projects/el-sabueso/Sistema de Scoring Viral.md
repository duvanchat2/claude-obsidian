---
title: "Sistema de Scoring Viral — El Sabueso"
tags:
  - scoring
  - viral
  - algoritmo
  - el-sabueso
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[El Sabueso - Hub]]"
  - "[[Patrones de Clasificacion Viral]]"
  - "[[Integracion Notion Apify]]"
---

# Sistema de Scoring Viral

## Fórmula Maestra

```
Viral Score (0-100) = 
  (Engagement Rate Score  × 0.35) +
  (Velocidad 24h Score    × 0.25) +
  (Relevancia Nicho Score × 0.20) +
  (Novedad Formato Score  × 0.10) +
  (Score Creador          × 0.10)
```

## Componente 1: Engagement Rate (35%)

**Definición:** (Likes + Comentarios + Compartidos) / Vistas × 100

**Tabla de conversión a score:**

| ER% | Score |
|-----|-------|
| > 15% | 100 |
| 10-15% | 85 |
| 7-10% | 70 |
| 4-7% | 55 |
| 2-4% | 40 |
| < 2% | 20 |

**Por plataforma** (benchmarks distintos):
- TikTok: ER típico 3-9% (ajustar multiplicador ×1.0)
- Instagram: ER típico 1-5% (ajustar multiplicador ×1.3)
- YouTube Shorts: ER típico 2-6% (ajustar multiplicador ×1.1)

## Componente 2: Velocidad de Crecimiento 24h (25%)

**Definición:** Vistas en primeras 24h desde publicación

| Vistas 24h | Score |
|------------|-------|
| > 1M | 100 |
| 500k-1M | 85 |
| 100k-500k | 70 |
| 50k-100k | 55 |
| 10k-50k | 40 |
| < 10k | 15 |

> [!note] Limitación actual
> Para contenido con más de 24h de vida, se usa una aproximación basada en la curva de decaimiento. Ver `scripts/sabueso-velocity.js` para la implementación.

## Componente 3: Relevancia de Nicho (20%)

Score calculado por coincidencia semántica entre el contenido y las keywords del nicho del cliente.

**Método actual:** Comparación por keywords en transcripción/caption.
**Método futuro:** Embedding semántico con cosine similarity.

| Coincidencia | Score |
|--------------|-------|
| Keywords exactas en título + caption | 100 |
| Keywords en caption solamente | 75 |
| Keywords temáticas relacionadas | 50 |
| Nicho adyacente | 25 |
| Sin relación | 0 |

**Nichos activos configurados:**
- Marketing digital / Automatización
- Fitness y nutrición
- Finanzas personales
- Emprendimiento
- Tecnología y IA

## Componente 4: Novedad del Formato (10%)

Penaliza formatos sobreexplotados, bonifica formatos emergentes.

| Estado del formato | Score |
|-------------------|-------|
| Formato nuevo (< 30 días circulando) | 100 |
| Formato en crecimiento (30-90 días) | 75 |
| Formato establecido (90-180 días) | 50 |
| Formato saturado (> 180 días) | 25 |

**Registro de formatos:** [[Registro de Formatos Virales]]

## Componente 5: Score del Creador (10%)

Evalúa el historial del creador original para detectar si el viral es un "accidente" o parte de un patrón.

| Situación | Score |
|-----------|-------|
| Creador con historial consistente de virales | 100 |
| Creador con algunos virales previos | 65 |
| Creador nuevo sin historial | 40 |
| Creador con historial de bajo rendimiento | 20 |

## Calibración por Plataforma

Cada plataforma tiene un multiplicador de corrección para normalizar diferencias estructurales:

| Plataforma | Multiplicador |
|------------|--------------|
| TikTok | × 1.00 (referencia) |
| Instagram | × 1.15 |
| YouTube | × 1.10 |
| Twitter | × 0.90 |

## Historial de Ajustes

| Fecha | Cambio | Razón |
|-------|--------|-------|
| 2026-06-08 | Versión inicial documentada | Inicialización wiki |

---

*Ver también: [[El Sabueso - Hub]] | [[Patrones de Clasificacion Viral]] | [[Integracion Notion Apify]]*
