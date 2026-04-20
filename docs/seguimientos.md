# Seguimiento Técnico del Proyecto

## Registro de Actividades

| Fecha | HU | Actividad | Estado | Observaciones |
|-------|----|-----------|--------|---------------|
| 2026-04-14 | HU-01 | Creación del repositorio con ramas main, qa y develop | ✅ | Ramas pusheadas a GitHub |
| 2026-04-14 | HU-01 | Estructura base de carpetas del proyecto | ✅ | Incluye 01_ddl, 02_dml, 03_dcl, 04_tcl, 05_rollbacks, adr, docker, docs |
| 2026-04-14 | HU-01 | Configuración de Docker y docker-compose.yml | ✅ | Contenedor prueba corriendo en puerto 5435 |
| 2026-04-14 | HU-01 | Configuración de liquibase.properties y .env | ✅ | Variables de conexión definidas |
| 2026-04-15 | HU-02 | Separación del DDL por dominio funcional | ✅ | 12 archivos SQL por dominio en 01_ddl/03_tables |
| 2026-04-15 | HU-02 | Creación de changelogs por dominio | ✅ | changelog.yaml por subcarpeta |
| 2026-04-15 | HU-02 | Creación de rollbacks por dominio | ✅ | Archivos en 05_rollbacks/01_ddl |
| 2026-04-15 | HU-02 | Documentación de ADR 001 a 005 | ✅ | Archivos en adr/ |
| 2026-04-16 | HU-03 | Integración de Liquibase con Docker | ✅ | Dockerfile en docker/ con driver PostgreSQL |
| 2026-04-16 | HU-03 | Ejecución exitosa de Liquibase | ✅ | 76 tablas creadas, 12 changesets aplicados |
| 2026-04-16 | HU-03 | Verificación de tablas en pgAdmin | ✅ | 78 tablas incluyendo databasechangelog |
| 2026-04-17 | HU-04 | Creación de roles PostgreSQL en DCL | ✅ | 5 roles creados con permisos diferenciados |
| 2026-04-17 | HU-04 | Inserción de roles y permisos en tablas del modelo | ✅ | security_role, security_permission, role_permission pobladas |
| 2026-04-17 | HU-04 | Verificación de roles en PostgreSQL | ✅ | Roles visibles con \du |
| 2026-04-19 | HU-05 | Creación de inserts de datos de prueba por dominio | ✅ | 9 changesets aplicados, 161 filas insertadas |
| 2026-04-19 | HU-05 | Verificación de datos en pgAdmin | ✅ | 5 registros por tabla de referencia |
| 2026-04-20 | HU-06 | Documentación de dominios funcionales | ✅ | analisis_dominios.md completado |
| 2026-04-20 | HU-06 | Plan de trabajo inicial | ✅ | plan_trabajo_inicial.md completado |
| 2026-04-20 | HU-06 | Seguimiento técnico | 🔄 | En curso |

## Decisiones Técnicas Tomadas

| Decisión | Justificación |
|----------|---------------|
| Usar postgres:15 | Versión estable disponible en el equipo |
| Usar liquibase:5.0.2 | Versión compatible con el driver PostgreSQL disponible |
| Organizar changelogs por dominio | Facilita mantenimiento y rollback granular |
| Usar YAML para changelogs | Más legible que XML para el equipo |
| Usar UUID como PK | Modelo original usa UUID, se mantiene sin cambios |
| Usar host.docker.internal | Liquibase en contenedor apunta al PostgreSQL existente |

## Problemas Encontrados y Soluciones

| Problema | Solución |
|----------|----------|
| Liquibase no encontraba el driver PostgreSQL | Se actualizó el Dockerfile con `lpm add --global postgresql` |
| changelog-master apuntaba a .xml | Se renombró a .yaml y se actualizó liquibase.properties |
| pgcrypto no estaba instalada | Se agregó changeset en 01_ddl/00_extensions/changelog.yaml |
| Liquibase no detectaba nuevos changesets | Se agregó `--contexts` al comando en docker-compose.yml |
| Contenedor prueba estaba detenido | Se levantó con `docker start prueba` |