---
title: "Flujo Técnico: OBS → AssemblyAI → WhatsApp"
tags:
  - tecnico
  - flujo
  - obs
  - assemblyai
  - whatsapp
  - automatizacion-ventas
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Automatizacion Ventas - Hub]]"
  - "[[Motor de Transcripcion AssemblyAI]]"
  - "[[Pipeline Propuestas WhatsApp]]"
---

# Flujo Técnico: OBS → AssemblyAI → WhatsApp

## Diagrama de Flujo Detallado

```
[Vendedor termina llamada]
         ↓
[OBS Studio: Stop Recording]
         ↓
    OBS Websocket Plugin
    emite evento "RecordingStopped"
         ↓
    Make Webhook Listener
    recibe: {filename, filepath, duration}
         ↓
    Make: File download
    (OBS guarda en carpeta local compartida o cloud)
         ↓
    AssemblyAI API
    POST /v2/upload → file_url
    POST /v2/transcript → {
      audio_url: file_url,
      speaker_labels: true,      ← diarización
      language_code: "es",
      sentiment_analysis: true
    }
         ↓
    Polling AssemblyAI hasta status = "completed"
    (timeout: 5 min para archivos < 30 min)
         ↓
    Respuesta AssemblyAI: {
      text: "transcripción completa",
      utterances: [{speaker: "A", text: "..."}, ...],
      sentiment_analysis_results: [...]
    }
         ↓
    Claude API: análisis de llamada
    Prompt: ver [[Prompt Analisis Llamada]]
    Output: {
      nombre_prospecto,
      empresa,
      problema_principal,
      objeciones: [],
      nivel_interes: "alto|medio|bajo",
      precio_mencionado,
      siguiente_paso_acordado
    }
         ↓
    Plantilla de propuesta
    (personalización dinámica con los datos extraídos)
         ↓
    WhatsApp Business API
    POST /messages → {
      to: numero_prospecto,
      type: "template",
      template: {
        name: "propuesta_personalizada",
        components: [datos_extraidos]
      }
    }
         ↓
    Notion CRM: crear/actualizar contacto
    {nombre, empresa, estado: "Propuesta enviada", fecha}
         ↓
    [FIN] Notificación al vendedor: "Propuesta enviada ✓"
```

## Configuración OBS

### Plugin requerido: obs-websocket

**Versión:** obs-websocket 5.x (incluido en OBS 28+)

**Configuración:**
```
Tools → obs-websocket Settings
├── Enable WebSocket server: ✓
├── Port: 4455
├── Enable Authentication: ✓
└── Password: [almacenar en .env]
```

**Carpeta de grabación:**
- Windows: `C:\Recordings\ventas\`
- Formato de archivo: `{fecha}_{hora}_{titulo}.mp4`
- Calidad: 720p es suficiente (AssemblyAI no necesita video, solo audio)

> [!note] Optimización
> OBS puede grabar en modo "audio only" para archivos más pequeños y transcripción más rápida. Configurar en Output → Recording → Custom Output (FFmpeg) → `aac` codec, `.m4a`.

## Configuración AssemblyAI

### Parámetros recomendados para llamadas de ventas

```json
{
  "audio_url": "<url del archivo>",
  "language_code": "es",
  "speaker_labels": true,
  "speakers_expected": 2,
  "sentiment_analysis": true,
  "auto_chapters": false,
  "entity_detection": true,
  "iab_categories": false
}
```

**Tiempo de procesamiento:** ~1-3 minutos para llamadas de 30-60 minutos.

**Costo:** ~$0.65 USD por hora de audio (plan Pay-as-you-go).

### Interpretación de diarización

```
Speaker A → siempre el vendedor (el que inicia la grabación)
Speaker B → prospecto
Speaker C → si hay un tercero (ej. acompañante del prospecto)
```

## Configuración WhatsApp Business API

**Proveedor:** Meta Cloud API (directo) o via [[Kapso]] (integración activa)

### Template de propuesta

El mensaje usa una plantilla pre-aprobada por Meta. Las plantillas requieren aprobación (24-48h) antes de poder usarse.

**Template activo: `propuesta_post_llamada_v2`**

```
Hola {{1}}, 

Gracias por tu tiempo hoy. Como conversamos, aquí tienes la propuesta 
personalizada para {{2}}:

🎯 Tu desafío principal: {{3}}
✅ Nuestra solución: {{4}}
💰 Inversión: {{5}}
📅 Próximo paso: {{6}}

¿Tienes alguna pregunta? Responde aquí directamente.
```

Variables: nombre, empresa, problema, solución, precio, siguiente_paso

## Manejo de Errores

| Paso | Error posible | Acción |
|------|-------------|--------|
| OBS Websocket | Conexión rechazada | Verificar que OBS esté abierto |
| AssemblyAI upload | Archivo > 2GB | Comprimir antes de subir |
| AssemblyAI transcripción | Error de idioma | Fallback a detección automática |
| Claude análisis | Transcripción vacía | Enviar propuesta genérica + alerta |
| WhatsApp API | Número no registrado | Email fallback + notificación |
| Notion CRM | API rate limit | Retry con backoff exponencial |

## Tiempos de Ejecución Típicos

| Paso | Tiempo estimado |
|------|----------------|
| OBS stop → Make trigger | < 5 segundos |
| Upload a AssemblyAI | 30-60 segundos |
| Transcripción AssemblyAI | 1-3 minutos |
| Análisis Claude | 10-20 segundos |
| Generación propuesta | 5 segundos |
| Envío WhatsApp | < 5 segundos |
| **Total** | **2-5 minutos** |

---

*Ver también: [[Automatizacion Ventas - Hub]] | [[Motor de Transcripcion AssemblyAI]] | [[Pipeline Propuestas WhatsApp]]*
