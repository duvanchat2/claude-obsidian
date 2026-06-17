---
title: "Estrategia de Automatización de Leads — Genix Academy"
tags:
  - estrategia
  - leads
  - genix-academy
  - make
  - whatsapp
  - meta-ads
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Genix Academy - Hub]]"
  - "[[Resultados Genix Academy]]"
  - "[[Pipeline Propuestas WhatsApp]]"
---

# Estrategia de Automatización de Leads — Genix Academy

## Mapa Completo del Sistema

```
META ADS
├── Campaign: Awareness (video content)
├── Campaign: Consideration (VSL / webinar)
└── Campaign: Conversion (oferta directa)
         ↓
    Lead Form (Meta native) o Landing Page
    Preguntas de calificación:
    1. "¿Cuál es tu mayor desafío con [tema]?"
    2. "¿Cuánto tiempo llevas intentando resolver esto?"
    3. "¿Tienes presupuesto para invertir en formación este mes?"
    4. "¿Cuándo te gustaría empezar?"
         ↓
    Make Scenario 1: "Genix - Lead Ingester"
    ├── Webhook receiver
    ├── Score de calificación (Hot/Warm/Cold)
    ├── Create en Notion CRM
    └── Router por temperatura
         ↓
    ┌─────────────────────────────────────────┐
    │                                         │
  HOT LEAD                              WARM LEAD              COLD LEAD
(Score 70+)                           (Score 40-69)           (Score < 40)
    │                                         │                     │
    ↓                                         ↓                     ↓
Make Scenario 2:                      Make Scenario 3:        Make Scenario 4:
"Hot Lead Response"                   "Nurturing Sequence"    "Cold Archive"
├── WhatsApp < 2min                   ├── Day 0: Bienvenida   ├── Email lista fría
├── Video personalizado               ├── Day 1: Valor        ├── Remarketing pixel
├── Calendly link                     ├── Day 3: Caso éxito   └── Revisión 30d
├── Notif. asesor                     ├── Day 5: Oferta suave
└── Notion: status=Hot                └── Day 7: Urgencia
```

## Fórmula de Calificación de Leads

### Puntos por respuesta en formulario

**Pregunta 1: Mayor desafío**
- Respuesta específica con números/contexto → 25 pts
- Respuesta genérica → 10 pts
- Sin respuesta → 0 pts

**Pregunta 2: Tiempo intentando resolver**
- "Más de 6 meses" → 25 pts
- "3-6 meses" → 20 pts
- "1-3 meses" → 15 pts
- "Acabo de darme cuenta" → 10 pts

**Pregunta 3: Presupuesto disponible**
- "Sí, tengo presupuesto" → 30 pts
- "Depende de la propuesta" → 20 pts
- "No por ahora" → 5 pts

**Pregunta 4: Cuándo empezar**
- "Lo antes posible / Este mes" → 20 pts
- "En 1-3 meses" → 15 pts
- "Más adelante" → 5 pts

**Total máximo:** 100 pts
- **Hot Lead:** 70-100 pts
- **Warm Lead:** 40-69 pts
- **Cold Lead:** 0-39 pts

## Make Scenario 2: Hot Lead Response

```
Trigger: Notion record creado con score >= 70

1. Delay: 60 segundos (simular respuesta humana, no instantánea robot)
2. WhatsApp API: enviar template "bienvenida_hot_v2"
   Variables: {nombre}, {desafio_principal}, {link_calendario}
3. Conditional: ¿Es hora de negocio? (9am-7pm)
   ├── Sí → Notificación a asesor via Slack con link Notion
   └── No → Programar notificación para 9am del próximo día hábil
4. Notion update: status = "Contactado - Hot"
5. Log en Make execution history
```

### Template `bienvenida_hot_v2`

```
¡Hola {{1}}! 👋

Vi que tienes un desafío con {{2}} — eso es exactamente 
lo que ayudamos a resolver en Genix.

Te he preparado un espacio de 20 minutos para entender 
mejor tu situación y ver si somos la opción correcta 
para ti:

📅 Agenda aquí: {{3}}

Si tienes alguna pregunta antes, responde este mensaje.

Nos vemos pronto 🎯
```

## Make Scenario 3: Nurturing Sequence (5 días)

| Día | Mensaje | Objetivo |
|-----|---------|---------|
| 0 | Bienvenida + recurso gratuito relevante | Establecer autoridad |
| 1 | "3 errores comunes en [problema]" | Educación + identificación |
| 3 | Caso de éxito específico al perfil | Prueba social |
| 5 | Presentación suave de la oferta | Consideración |
| 7 | Urgencia o escasez (si aplica) | Conversión |

**Condición de salida de secuencia:** Lead responde positivamente en cualquier punto → Movido a Hot y asignado a asesor.

## CRM en Notion

### Estructura de la DB "Genix — Leads"

| Campo | Tipo | Opciones |
|-------|------|---------|
| Nombre | Título | — |
| Teléfono | Texto | — |
| Email | Email | — |
| Fuente | Select | Meta Ads / Orgánico / Referido |
| Temperatura | Select | Hot / Warm / Cold |
| Score | Número | 0-100 |
| Desafío declarado | Texto | — |
| Estado | Select | Nuevo / Contactado / En seguimiento / Propuesta / Cerrado / Perdido |
| Asesor asignado | Persona | — |
| Fecha creación | Fecha | Auto |
| Última interacción | Fecha | — |
| Notas | Texto largo | — |

### Vistas activas

- "Pipeline Hoy" — todos los leads del día por temperatura
- "Hot sin contactar" — Hot leads sin estado "Contactado" (alarma)
- "Seguimiento pendiente" — En seguimiento con última interacción > 48h
- "Estadísticas mensuales" — Conteos por fuente y conversión

## Resultados Esperados vs Benchmark

Ver [[Resultados Genix Academy]] para datos reales post-implementación.

---

*Ver también: [[Genix Academy - Hub]] | [[Resultados Genix Academy]] | [[Plantilla Sistema de Leads Academias]]*
