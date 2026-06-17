---
title: "Motor de Transcripción AssemblyAI"
tags:
  - assemblyai
  - transcripcion
  - ia
  - automatizacion-ventas
  - tecnico
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[Automatizacion Ventas - Hub]]"
  - "[[Flujo OBS AssemblyAI WhatsApp]]"
---

# Motor de Transcripción AssemblyAI

## Capacidades Utilizadas

### 1. Speaker Diarization

Identifica automáticamente quién habla en cada segmento. Crítico para extraer objeciones del prospecto vs. argumentos del vendedor.

**Output de ejemplo:**
```json
{
  "utterances": [
    {
      "speaker": "A",
      "text": "Buenos días, gracias por conectarte. ¿Cómo estás?",
      "start": 1200,
      "end": 4500,
      "confidence": 0.94
    },
    {
      "speaker": "B",
      "text": "Bien, gracias. Estoy interesado en lo que me comentaste sobre automatización.",
      "start": 4800,
      "end": 9200,
      "confidence": 0.91
    }
  ]
}
```

### 2. Sentiment Analysis

Analiza el tono emocional por utterance. Permite detectar:
- Momentos de alta receptividad del prospecto
- Señales de objeción real vs. objeción de proceso
- Nivel de entusiasmo al final de la llamada (predictor de cierre)

**Labels:** `POSITIVE`, `NEUTRAL`, `NEGATIVE`

### 3. Entity Detection

Extrae automáticamente:
- Nombres de personas mencionadas
- Nombres de empresas/organizaciones
- Fechas y horas (compromisos)
- Montos económicos (presupuesto mencionado)
- Ubicaciones

## Integración con el Pipeline de Análisis

Después de la transcripción, el texto estructurado se pasa a Claude con este prompt maestro:

### Prompt Maestro de Análisis de Llamada

```
Eres un analista experto en ventas. Analiza esta transcripción de llamada de ventas
y extrae la siguiente información en formato JSON:

TRANSCRIPCIÓN:
{transcripcion_completa}

SPEAKER MAPPING:
- Speaker A: Vendedor
- Speaker B: Prospecto

Extrae:
{
  "datos_prospecto": {
    "nombre": "si se menciona",
    "empresa": "si se menciona",
    "cargo": "si se menciona",
    "telefono": "si se confirma"
  },
  "problema_principal": "el dolor o necesidad más importante mencionada",
  "problemas_secundarios": ["lista de otros problemas mencionados"],
  "objeciones": [
    {
      "objecion": "texto de la objeción",
      "tipo": "precio|tiempo|confianza|decision|otro",
      "resolvio_en_llamada": true/false
    }
  ],
  "nivel_interes": "alto|medio|bajo",
  "senales_de_cierre": ["lista de señales positivas detectadas"],
  "precio_mencionado": "si se habló de precio/inversión",
  "siguiente_paso": "qué se acordó hacer después",
  "fecha_seguimiento": "si se acordó una fecha",
  "notas_especiales": "cualquier contexto importante para la propuesta"
}

Responde SOLO con el JSON, sin texto adicional.
```

## Optimizaciones de Calidad

### Reducir ruido en la transcripción

- Grabar en ambiente silencioso (obvio pero crítico)
- Usar auriculares con micrófono dedicado (no micrófono integrado del laptop)
- Calidad mínima de audio: 16kHz, mono, 16-bit

### Mejorar diarización

- Asegurarse de que haya un ligero silencio al cambiar de turno (> 200ms)
- Si la llamada es por teléfono, AssemblyAI necesita los dos canales separados idealmente

### Manejo de nombres propios

AssemblyAI a veces transcribe mal nombres en español. Considerar:
- Post-procesamiento con lista de términos específicos del nicho
- Prompt a Claude para corregir términos técnicos conocidos

## Costos y Límites

| Plan | Precio | Límites |
|------|--------|---------|
| Pay-as-you-go | $0.65/hora audio | Sin límite |
| Pro ($99/mes) | $0.37/hora audio | Hasta 500h/mes |
| Enterprise | Negociado | Custom |

**Para el volumen actual:** Pay-as-you-go recomendado hasta superar 20 llamadas/mes.

## Alternativas Evaluadas

| Herramienta | Ventaja | Por qué no elegida |
|------------|---------|-------------------|
| Whisper (OpenAI) | Más barata (casi gratis self-hosted) | Sin diarización nativa, requiere infraestructura |
| Google Speech-to-Text | Ecosistema Google | Peor diarización en español |
| Deepgram | Muy rápida | Más cara para llamadas largas |
| **AssemblyAI** | **Mejor diarización en español + sentimiento** | **Elegida** |

---

*Ver también: [[Flujo OBS AssemblyAI WhatsApp]] | [[Pipeline Propuestas WhatsApp]] | [[Automatizacion Ventas - Hub]]*
