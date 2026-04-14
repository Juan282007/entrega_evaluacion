# Análisis de Dominios Funcionales

## Objetivo del análisis

El objetivo de este documento es identificar y describir los dominios funcionales del modelo de base de datos `modelo_postgresql.sql`, con el fin de comprender su arquitectura, organización lógica y relaciones principales.

El sistema corresponde a una plataforma de gestión de aerolínea que integra procesos geográficos, operacionales, comerciales, financieros y de seguridad.

---

# 1. Dominio: Geografía y datos de referencia

## Propósito
Gestionar la estructura geográfica global y estandarizar ubicaciones dentro del sistema.

## Entidades
- continent  
- country  
- state_province  
- city  
- district  
- address  
- time_zone  
- currency  

## Relaciones clave
- country pertenece a continent  
- state_province pertenece a country  
- city pertenece a state_province  
- district pertenece a city  
- address pertenece a district  
- city se relaciona con time_zone  

## Importancia
Este dominio es transversal, ya que soporta la ubicación de aeropuertos, personas, proveedores y operaciones.

---

# 2. Dominio: Aerolínea

## Propósito
Representar la entidad principal del negocio aéreo.

## Entidades
- airline  

## Relaciones
- airline se asocia a country (home_country_id)

## Importancia
Es el núcleo organizacional del sistema.

---

# 3. Dominio: Identidad

## Propósito
Gestionar personas, documentos y contactos.

## Entidades
- person  
- person_type  
- person_document  
- person_contact  
- document_type  
- contact_type  

## Relaciones
- person pertenece a person_type  
- person puede tener múltiples documentos y contactos  
- person_document depende de document_type  
- person_contact depende de contact_type  

## Importancia
Es base para clientes, usuarios y pasajeros del sistema.

---

# 4. Dominio: Seguridad

## Propósito
Gestionar usuarios, roles y permisos.

## Entidades
- user_account  
- user_status  
- security_role  
- security_permission  
- user_role  
- role_permission  

## Relaciones
- user_account se relaciona con person  
- user_role asigna roles a usuarios  
- role_permission asigna permisos a roles  

## Importancia
Garantiza control de acceso y trazabilidad del sistema.

---

# 5. Dominio: Clientes y fidelización

## Propósito
Gestionar clientes y programas de lealtad.

## Entidades
- customer  
- customer_category  
- loyalty_program  
- loyalty_account  
- loyalty_tier  
- loyalty_account_tier  
- miles_transaction  
- benefit_type  
- customer_benefit  

## Relaciones
- customer se relaciona con person  
- loyalty_account conecta customer con loyalty_program  
- loyalty_tier define niveles del programa  
- miles_transaction registra acumulación o redención de millas  

## Importancia
Permite fidelización y retención de clientes.

---

# 6. Dominio: Aeropuertos

## Propósito
Gestionar infraestructura aeroportuaria.

## Entidades
- airport  
- terminal  
- boarding_gate  
- runway  
- airport_regulation  

## Relaciones
- airport depende de address  
- terminal pertenece a airport  
- boarding_gate pertenece a terminal  

## Importancia
Soporta todas las operaciones de vuelo.

---

# 7. Dominio: Aeronaves y mantenimiento

## Propósito
Gestionar la flota aérea y su mantenimiento.

## Entidades
- aircraft  
- aircraft_model  
- aircraft_manufacturer  
- aircraft_cabin  
- aircraft_seat  
- cabin_class  
- maintenance_provider  
- maintenance_type  
- maintenance_event  

## Relaciones
- aircraft pertenece a airline  
- aircraft_model pertenece a aircraft_manufacturer  
- maintenance_event se relaciona con aircraft  

## Importancia
Permite control operativo y técnico de la flota.

---

# 8. Dominio: Operaciones de vuelo

## Propósito
Gestionar vuelos y su ejecución.

## Entidades
- flight  
- flight_segment  
- flight_status  
- flight_delay  
- delay_reason_type  

## Relaciones
- flight contiene flight_segment  
- flight_segment conecta aeropuertos origen/destino  
- flight_delay se asocia a flight_segment  

## Importancia
Es el núcleo operativo del sistema aéreo.

---

# 9. Dominio: Reservas, ventas y ticketing

## Propósito
Gestionar el flujo comercial completo.

## Entidades
- reservation  
- reservation_status  
- reservation_passenger  
- sale  
- sale_channel  
- fare  
- fare_class  
- ticket  
- ticket_status  
- ticket_segment  
- seat_assignment  
- baggage  

## Relaciones
- reservation genera sale  
- sale genera ticket  
- ticket se asocia a pasajeros y segmentos de vuelo  
- seat_assignment asigna asiento a ticket_segment  

## Importancia
Representa el flujo principal de ingresos.

---

# 10. Dominio: Check-in y abordaje

## Propósito
Gestionar el proceso aeroportuario del pasajero.

## Entidades
- check_in  
- check_in_status  
- boarding_pass  
- boarding_group  
- boarding_validation  

## Relaciones
- check_in genera boarding_pass  
- boarding_pass es validado en boarding_gate  
- boarding_group organiza embarque  

## Importancia
Controla el acceso al vuelo.

---

# 11. Dominio: Pagos

## Propósito
Gestionar transacciones financieras.

## Entidades
- payment  
- payment_status  
- payment_method  
- payment_transaction  
- refund  

## Relaciones
- payment se asocia a sale  
- payment_transaction registra movimientos  
- refund gestiona devoluciones  

## Importancia
Control financiero del sistema.

---

# 12. Dominio: Facturación

## Propósito
Gestionar facturación e impuestos.

## Entidades
- invoice  
- invoice_line  
- invoice_status  
- tax  
- exchange_rate  

## Relaciones
- invoice se genera desde sale  
- invoice_line detalla la factura  
- tax se aplica a líneas de factura  

## Importancia
Cumplimiento fiscal y contable.

---

# Conclusión general

El modelo presenta una arquitectura:

- Altamente normalizada (3FN)
- Organizada por dominios funcionales
- Escalable y mantenible
- Preparada para implementación con Liquibase y Docker
- Compatible con enfoque de arquitectura DDD

---

# Valor del análisis

Este análisis demuestra:

- Comprensión del modelo de datos
- Capacidad de diseño arquitectónico
- Identificación de dominios empresariales
- Preparación para despliegue y versionamiento