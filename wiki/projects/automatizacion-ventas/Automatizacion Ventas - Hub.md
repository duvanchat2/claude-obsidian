---
title: "Automatización de Ventas — Hub"
tags:
  - proyecto
  - ventas
  - automatizacion
  - obs
  - assemblyai
  - whatsapp
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Flujo OBS AssemblyAI WhatsApp]]"
  - "[[Motor de Transcripcion AssemblyAI]]"
  - "[[Pipeline Propuestas WhatsApp]]"
  - "[[SocialDrop - Hub]]"
---

# Automatización de Ventas — Hub

> Sistema que convierte grabaciones de llamadas o demos en propuestas comerciales y las envía automáticamente por WhatsApp. Elimina el paso manual de transcribir, redactar y enviar follow-ups post-llamada.

## El Problema que Resuelve

Sin automatización:
1. Termina llamada de ventas con prospecto
2. Transcripción manual (20-40 min)
3. Redacción de propuesta personalizada (30-60 min)
4. Envío por WhatsApp o email
5. **Tiempo total: 1-2 horas por prospecto**

Con este sistema:
1. Termina llamada de ventas
2. Stop en OBS → trigger automático
3. **Propuesta enviada en < 10 minutos**

## Flujo Maestro

```
OBS graba la llamada
        ↓
    Stop recording → trigger webhook
        ↓
    Make: descarga el archivo de OBS
        ↓
    AssemblyAI: transcripción con diarización
    (identifica quién habla: vendedor vs prospecto)
        ↓
    Claude/GPT-4: extrae intenciones, objeciones, intereses
        ↓
    Plantilla de propuesta + personalización dinámica
        ↓
    WhatsApp Business API: envío automático
        ↓
    CRM: registro del contacto y estado
```

Ver [[Flujo OBS AssemblyAI WhatsApp]] para el detalle técnico completo.

## Módulos del Sistema

| Módulo | Tecnología | Estado |
|--------|-----------|--------|
| Grabación | OBS Studio | Activo |
| Trigger automatico | OBS Websocket + Make | Activo |
| Transcripcion | AssemblyAI | Activo |
| Análisis de intención | Claude API | Activo |
| Generación de propuesta | Plantillas + IA | Activo |
| Envío WhatsApp | WhatsApp Business API | Activo |
| CRM registro | Notion | Activo |
| Follow-up automático | Make (secuencias) | En desarrollo |

## Casos de Uso Implementados

1. **Propuesta post-demo**: Después de una llamada de demostración de SocialDrop
2. **Follow-up de objeciones**: Cuando el prospecto mencionó objeciones específicas, la propuesta las aborda directamente
3. **Resumen para el prospecto**: No solo propuesta, también el resumen de lo que se discutió (genera confianza)
4. **Propuesta para Genix Academy**: Ver [[Genix Academy - Hub]] para el caso de éxito documentado

## KPIs del Sistema

- Tiempo promedio de envío post-llamada: < 10 min
- Tasa de apertura de mensajes WhatsApp: objetivo > 85%
- Tasa de respuesta positiva: benchmark actual vs. propuesta manual
- Personalización score: presencia de datos específicos de la llamada

## Próximos Pasos

- [ ] Secuencia de seguimiento automático (Day 1, Day 3, Day 7)
- [ ] Detección de señales de cierre en transcripción (urgencia alta → propuesta express)
- [ ] Panel de conversiones por script de llamada

---

*Navegación: [[index]] | [[Flujo OBS AssemblyAI WhatsApp]] | [[Motor de Transcripcion AssemblyAI]] | [[Pipeline Propuestas WhatsApp]]*
