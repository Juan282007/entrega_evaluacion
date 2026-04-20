# Plan de Trabajo Inicial

## Objetivo
Estabilizar, versionar y desplegar el modelo de base de datos de la aerolínea mediante 
contenedores Docker y Liquibase, siguiendo una estrategia de ramas con develop, qa y main.

## Equipo
| Rol | Responsable |
|-----|-------------|
| Desarrollador BD | Juan |

## Estrategia de Ramas
| Rama | Propósito |
|------|-----------|
| main | Código estable y aprobado para producción |
| qa | Validación y pruebas antes de pasar a main |
| develop | Desarrollo activo e integración de HU |
| HU-XX-dev | Rama por historia de usuario |

## Historias de Usuario

| HU | Descripción | Estado |
|----|-------------|--------|
| HU-01 | Estructura base, repositorio, ramas y docker | Completada |
| HU-02 | Changelogs DDL por dominio funcional | Completada |
| HU-03 | Integrar Liquibase con Docker | Completada |
| HU-04 | Roles y permisos diferenciados | Completada |
| HU-05 | Datos de prueba por dominio | Completada |
| HU-06 | Documentación de dominios y ADR | En curso |
| HU-07 | Seguimiento técnico y backlog | Pendiente |
| HU-08 | Revisión final y entrega | Pendiente |

## Stack Tecnológico
| Herramienta | Versión | Propósito |
|-------------|---------|-----------|
| PostgreSQL | 15 | Motor de base de datos |
| Liquibase | 5.0.2 | Versionamiento del DDL |
| Docker | 29.1.3 | Contenedores |
| Docker Compose | - | Orquestación de servicios |
| Git | - | Control de versiones |
| GitHub | - | Repositorio remoto |

## Estructura del Repositorio

entrega-evaluacion/
├── 01_ddl/          — DDL por dominio funcional
├── 02_dml/          — DML datos de prueba y seguridad
├── 03_dcl/          — DCL roles y permisos
├── 04_tcl/          — TCL transacciones
├── 05_rollbacks/    — Rollbacks por dominio
├── adr/             — Architecture Decision Records
├── docker/          — Dockerfile de Liquibase
├── docs/            — Documentación del proyecto
├── scripts/         — Scripts de utilidad
├── changelog-master.yaml
├── docker-compose.yml
├── liquibase.properties
└── modelo_postgresql.sql