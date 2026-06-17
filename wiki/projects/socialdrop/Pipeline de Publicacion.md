---
title: "Pipeline de Publicación SocialDrop"
tags:
  - pipeline
  - publicacion
  - automatizacion
  - socialdrop
fecha: 2026-06-08
estado: activo
metodologia: PARA/Proyectos
relacionado:
  - "[[SocialDrop - Hub]]"
  - "[[Arquitectura SocialDrop]]"
  - "[[El Sabueso - Hub]]"
---

# Pipeline de Publicación

## Fases del Pipeline

### Fase 1: Entrada a la Cola

**Trigger:** Notion database item cambia estado a `"Listo para publicar"`

```
Campos requeridos en Notion:
├── Plataforma destino (TikTok / IG / YT / LinkedIn)
├── Fecha y hora programada
├── Archivo de video o URL de guión
├── Caption + hashtags generados
├── Cliente asignado
└── Score de aprobación (manual o automático)
```

### Fase 2: Validación Automática

Checklist automático antes de publicar:

- [ ] Caption no supera límite de caracteres de la plataforma
- [ ] Hashtags no incluyen términos bloqueados
- [ ] Archivo de video en formato correcto (MP4, H.264)
- [ ] Hora de publicación no coincide con otro post del cliente
- [ ] Cliente no tiene restricciones activas de cuenta

Si algún check falla → Estado cambia a `"Requiere revisión"` + notificación Slack/WhatsApp al operador.

### Fase 3: Publicación

```
Make Scenario: "SocialDrop — Publisher"

1. Watch Notion database (polling cada 5 min)
2. Filter: status = "Listo para publicar" AND fecha <= now
3. Router por plataforma:
   ├── TikTok → TikTok Business API
   ├── Instagram → Graph API (via Meta)
   ├── YouTube → YouTube Data API v3
   └── LinkedIn → LinkedIn API v2
4. Subida del archivo + metadata
5. Respuesta: post_id + permalink
6. Update Notion: status = "Publicado" + post_id + permalink
7. Log en [[Log de Publicaciones]]
```

### Fase 4: Post-Publicación

- Registro de hora real de publicación
- Guardado de URL permanente del post
- Activación del tracker de métricas (24h, 48h, 7d)

## Gestión de Errores

| Error | Acción automática | Escalado a humano |
|-------|------------------|-------------------|
| API rate limit | Retry en 30 min | Después de 3 intentos |
| Formato rechazado | Notificación inmediata | Sí |
| Token expirado | Refresh automático | Si refresh falla |
| Cuenta suspendida | Pausa todos los posts del cliente | Sí, inmediato |

## Plantillas de Caption por Plataforma

Ver [[Plantillas de Caption]] para las estructuras validadas por plataforma y nicho.

## Integraciones Activas

- **Notion** → base de datos maestra
- **Make** → orquestador del pipeline
- **Buffer** → fallback para plataformas sin API directa
- **Slack/WhatsApp** → notificaciones de estado

---

*Ver también: [[Arquitectura SocialDrop]] | [[El Sabueso - Hub]] | [[Stack Tecnologico SocialDrop]]*
