---
title: "Pipeline de Propuestas por WhatsApp"
tags:
  - whatsapp
  - propuestas
  - pipeline
  - ventas
  - automatizacion-ventas
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Automatizacion Ventas - Hub]]"
  - "[[Flujo OBS AssemblyAI WhatsApp]]"
  - "[[Genix Academy - Hub]]"
---

# Pipeline de Propuestas por WhatsApp

## Estructura de una Propuesta Efectiva por WhatsApp

WhatsApp no es email. Las propuestas deben ser cortas, escaneables y con CTA claro.

### Estructura Validada (4 bloques)

```
BLOQUE 1: PERSONALIZACIÓN (2-3 líneas)
Hola [Nombre], gracias por tu tiempo hoy.
Como conversamos, [referencia específica de la llamada].

BLOQUE 2: EL PROBLEMA (1-2 líneas)
Entiendo que tu principal desafío es [problema extraído].

BLOQUE 3: LA SOLUCIÓN (3-5 líneas)
Lo que proponemos:
✅ [Beneficio 1 relevante a su situación]
✅ [Beneficio 2]
✅ [Beneficio 3]

BLOQUE 4: PRÓXIMO PASO (1-2 líneas)
Inversión: [precio si se mencionó] / [rango si no]
[Siguiente paso acordado en la llamada]
¿Alguna pregunta? Responde aquí.
```

## Personalización Dinámica

El sistema rellena las variables basándose en el JSON de análisis de la llamada:

```javascript
// Lógica de personalización
const generarPropuesta = (analisis) => {
  const nivel = analisis.nivel_interes;
  
  if (nivel === 'alto') {
    // Propuesta con precio directo + CTA de cierre rápido
    return template_cierre_rapido(analisis);
  } else if (nivel === 'medio') {
    // Propuesta con más contenido educativo + demo
    return template_nutrir_interes(analisis);
  } else {
    // Propuesta mínima + solicitud de reunión adicional
    return template_reactivar(analisis);
  }
}
```

## Secuencia de Seguimiento Automático

Una vez enviada la propuesta inicial, el sistema activa una secuencia:

```
Día 0: Propuesta inicial (inmediata post-llamada)
Día 1: Mensaje de valor adicional
        "Además de lo que conversamos, también incluye X..."
Día 3: Caso de éxito relevante
        "Un cliente con un desafío similar al tuyo logró Y..."
Día 7: Seguimiento directo
        "Hola [Nombre], ¿tuviste oportunidad de revisar la propuesta?"
Día 14: Cierre suave
         "Entiendo que estás evaluando opciones. ¿Hay algo que pueda
          aclarar para ayudarte a decidir?"
```

**Condición de parada:** Respuesta positiva o negativa explícita en cualquier punto.

## Integración con WhatsApp Business API

**Opciones de proveedor:**

| Proveedor | Costo | Ventaja |
|-----------|-------|---------|
| Meta Cloud API (directo) | $0.0XX por mensaje | Sin intermediario |
| [[Kapso]] | Mensual + por mensaje | Más fácil setup, soporte |
| Twilio | $0.XX por mensaje | Muy robusto, documentación excelente |
| WATI | $49/mes + mensajes | Dashboard visual |

**Proveedor actual:** Kapso (integración ya conectada via MCP)

### Reglas de Meta para mensajes de marketing

> [!warning] Importante para cumplimiento
> Los mensajes de marketing por WhatsApp Business API requieren:
> 1. Template aprobado por Meta
> 2. Número opt-in del destinatario (debe haber dado consentimiento)
> 3. Ventana de 24h para mensajes de sesión (respuestas free-form)
> 4. Fuera de ventana: solo templates aprobados

## Templates Activos

### `propuesta_post_llamada_v2` (Marketing)

Aprobado. Usado para propuestas inmediatas.

### `seguimiento_dia3_v1` (Utility)

Aprobado. Mensaje de caso de éxito.

### `reactivacion_v1` (Marketing)

En proceso de aprobación.

## Métricas del Pipeline

| Métrica | Benchmark objetivo |
|---------|-------------------|
| Tasa de apertura | > 85% |
| Tasa de respuesta al mensaje inicial | > 40% |
| Tiempo de respuesta del prospecto | < 4 horas |
| Tasa de conversión propuesta → cierre | Documentar baseline |
| Ciclo de ventas promedio | Documentar baseline |

---

*Ver también: [[Automatizacion Ventas - Hub]] | [[Flujo OBS AssemblyAI WhatsApp]] | [[Genix Academy - Hub]]*
