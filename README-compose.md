# Docker - Base de Datos PostgreSQL

## Contenedor activo

| Campo         | Valor             |
|---------------|-------------------|
| Imagen        | postgres:15       |
| Contenedor    | aerolinea_postgres|
| Host          | 127.0.0.1         |
| Puerto        | 5435              |
| Base de datos | midb              |
| Usuario       | admin             |
| Contraseña    | 123456            |

## Comandos útiles

```bash
# Levantar contenedores
docker-compose up -d

# Detener contenedores
docker-compose down

# Ver logs
docker logs aerolinea_postgres