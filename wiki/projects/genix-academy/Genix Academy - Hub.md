---
title: "Genix Academy — Hub del Caso de Éxito"
tags:
  - caso-de-exito
  - consultoria
  - genix-academy
  - leads
  - automatizacion
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Estrategia Automatizacion Leads Genix]]"
  - "[[Resultados Genix Academy]]"
  - "[[Pipeline Propuestas WhatsApp]]"
  - "[[Casos de Exito - Index]]"
---

# Genix Academy — Hub del Proyecto

> Caso de implementación de automatización de captación y conversión de leads para academia de educación online. Implementación de sistema completo: atracción → captura → calificación → cierre.

## Contexto del Cliente

**Empresa:** Genix Academy
**Tipo:** Academia de educación online (cursos / mentoría)
**Desafío principal:** Alto volumen de leads entrantes sin capacidad de atender todos manualmente, resultando en pérdida de oportunidades.

## El Problema Antes de la Implementación

```
Sin automatización:
├── Leads entran por anuncios → formulario → hoja de cálculo
├── Equipo revisa manualmente (retraso 4-24 horas)
├── WhatsApp manual de bienvenida y calificación
├── 60%+ de leads nunca recibía seguimiento oportuno
└── Tasa de conversión: baja (sin dato baseline documentado)
```

## Solución Implementada

Ver [[Estrategia Automatizacion Leads Genix]] para el detalle técnico completo.

**Resumen de la implementación:**

### Fase 1: Captura y Calificación Automática

```
Anuncio Meta Ads → Landing page → Formulario
        ↓
    Webhook → Make
        ↓
    Calificación automática por respuestas del formulario
    (presupuesto, urgencia, perfil)
        ↓
    Segmentación: Hot / Warm / Cold lead
```

### Fase 2: Respuesta Inmediata

```
Hot Lead (presupuesto + urgencia alta):
→ WhatsApp inmediato (< 2 min) con video personalizado
→ Calendario de agendamiento automático
→ Notificación al asesor de ventas

Warm Lead:
→ Secuencia de nurturing 5 días
→ Contenido de valor específico al problema declarado

Cold Lead:
→ Newsletter + remarketing
→ Re-calificación en 30 días
```

### Fase 3: Cierre Asistido

- CRM (Notion) actualizado automáticamente
- Propuesta generada con IA basada en perfil del lead
- Seguimiento automático si no hay respuesta en 48h
- Integración con el [[Pipeline Propuestas WhatsApp]]

## Stack Tecnológico Implementado

| Herramienta | Rol | Configuración |
|-------------|-----|--------------|
| Meta Ads | Atracción | Formularios nativos con campos de calificación |
| Make (Integromat) | Orquestador | 3 scenarios principales |
| Notion | CRM | DB de leads + vistas por etapa |
| WhatsApp Business API | Comunicación | Via Kapso |
| Claude API | Personalización mensajes | Prompts de calificación |
| Calendly / Cal.com | Agendamiento | Link integrado en mensajes |

## Resultados Documentados

Ver [[Resultados Genix Academy]] para métricas detalladas.

**Resumen de impacto:**
- Tiempo de primera respuesta: de 4-24h → < 2 minutos
- Cobertura de leads: de ~40% → 100% reciben primera comunicación
- Capacidad del equipo: mismo equipo maneja 3x el volumen de leads

## Aprendizajes Clave

1. **La velocidad de respuesta importa más que la perfección del mensaje.** Un WhatsApp enviado en 2 minutos con mensaje bueno supera a uno perfecto enviado en 2 horas.

2. **La calificación en el formulario es el cuello de botella.** Preguntas vagas = segmentación pobre = automatización ineficiente. Invertir tiempo en el diseño del formulario.

3. **No todo debe ser automático.** Hot leads con presupuesto alto ameritan toque humano rápido, no solo automatización.

4. **El CRM en tiempo real cambia la dinámica del equipo.** Ver el pipeline actualizado en vivo motiva y orienta al equipo de ventas.

## Reproducibilidad del Caso

Este sistema está documentado para replicar en otras academias y negocios de educación online. Ver [[Plantilla Sistema de Leads Academias]] para la versión replicable.

---

*Navegación: [[index]] | [[Estrategia Automatizacion Leads Genix]] | [[Casos de Exito - Index]] | [[Pipeline Propuestas WhatsApp]]*
