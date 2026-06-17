---
title: "Stack Tecnológico — SocialDrop"
tags:
  - stack
  - herramientas
  - tecnico
  - referencia
fecha: 2026-06-08
estado: activo
metodologia: PARA/Recursos
relacionado:
  - "[[SocialDrop - Hub]]"
  - "[[Arquitectura SocialDrop]]"
  - "[[El Sabueso - Hub]]"
  - "[[Automatizacion Ventas - Hub]]"
---

# Stack Tecnológico — SocialDrop

> Referencia rápida de todas las herramientas, sus roles y configuraciones en el ecosistema SocialDrop.

## Herramientas de Descubrimiento

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Apify** | Scraping TikTok/IG/YT | Pay-per-use | ~$40-80/mes |
| **Twitter API v2** | Trending topics | Free/Basic | Rate limits estrictos |

## Herramientas de Orquestación

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Make (Integromat)** | Automatizaciones principales | Pro | Scenarios: Sabueso, Publisher, CRM |
| **n8n** | Workflows avanzados / fallback | [TBD] | Alternativa para enterprise |

## Bases de Datos

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Notion** | CRM + Viral Pool + Contenido | Team | DB principal del sistema |
| **Airtable** | Fallback de Notion | Free | No en uso activo |

## IA y Procesamiento

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Claude API** | Adaptación de contenido + análisis | Pay-per-use | Modelo: claude-sonnet-4-6 |
| **AssemblyAI** | Transcripción con diarización | Pay-per-use | ~$0.65/hora de audio |
| **GPT-4** | Alternativa/fallback IA | Pay-per-use | OpenAI API |

## Publicación

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Buffer** | Programación y publicación | Pro | Fallback si API nativa falla |
| **Meta Graph API** | Publicación Instagram | Free | Requiere Business account |
| **TikTok Business API** | Publicación TikTok | Free | Requiere app aprobada |
| **YouTube Data API v3** | Publicación YouTube | Free | OAuth2 |

## Comunicación

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **WhatsApp Business API** | Mensajes a prospectos/clientes | Via Kapso | Templates pre-aprobados |
| **Kapso** | Proveedor WhatsApp API | [Plan] | MCP integrado |
| **Slack** | Notificaciones internas | Free | Alertas del sistema |

## Grabación y Ventas

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **OBS Studio** | Grabación de llamadas | Gratuito | + obs-websocket plugin |
| **Calendly / Cal.com** | Agendamiento | [Plan] | Integrado en mensajes WhatsApp |

## Comunidad

| Herramienta | Rol | Plan | Notas |
|-------------|-----|------|-------|
| **Skool** | Plataforma del Club | [Plan] | Club AI Marketing Automation |

## Dependencias Críticas (Puntos de Fallo)

```
Si Apify falla → Sin nuevos contenidos virales → El Sabueso se detiene
Si Make falla → Sin automatizaciones → Todo el sistema para
Si Notion API falla → Sin base de datos → CRM y contenido inaccesibles
Si WhatsApp API falla → Sin comunicación automatizada → Ventas manuales
```

**Monitoreo de salud:** [PENDIENTE — configurar alertas en Make]

## Historial de Versiones del Stack

| Fecha | Cambio |
|-------|--------|
| 2026-06-08 | Documentación inicial del stack |

---

*Ver también: [[Arquitectura SocialDrop]] | [[El Sabueso - Hub]] | [[Flujo OBS AssemblyAI WhatsApp]]*
