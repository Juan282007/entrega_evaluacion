# Análisis de Dominios Funcionales

## Descripción General
El modelo de base de datos representa un sistema de aerolínea compuesto por 12 dominios 
funcionales organizados de forma independiente pero relacionados entre sí. El modelo usa 
UUID como clave primaria en todas las entidades, campos de auditoría `created_at` y 
`updated_at` en todas las tablas, restricciones CHECK para validaciones de negocio e 
índices de apoyo para optimización de consultas.

---

## Dominios Funcionales

### 1. Geografía y Datos de Referencia
**Tablas:** time_zone, continent, country, state_province, city, district, address, currency

**Descripción:** Base geográfica del sistema. Provee la estructura jerárquica de ubicaciones 
desde continente hasta dirección física. La tabla `currency` también hace parte de este 
dominio como dato de referencia global.

**Relaciones clave:**
- continent → country → state_province → city → district → address
- time_zone se asocia a city
- currency es referenciada por loyalty_program, fare, sale, payment e invoice

---

### 2. Aerolínea
**Tablas:** airline

**Descripción:** Entidad central del sistema. Representa la aerolínea operadora y es 
referenciada por la mayoría de los dominios como punto de partida del modelo.

**Relaciones clave:**
- airline → aircraft, flight, customer, loyalty_program, fare

---

### 3. Identidad
**Tablas:** person_type, document_type, contact_type, person, person_document, person_contact

**Descripción:** Gestiona la identidad de todas las personas del sistema, tanto pasajeros 
como empleados. Centraliza documentos y datos de contacto evitando duplicidad.

**Relaciones clave:**
- person → person_document, person_contact
- person → user_account, customer, reservation_passenger

---

### 4. Seguridad
**Tablas:** user_status, security_role, security_permission, user_account, user_role, role_permission

**Descripción:** Controla el acceso al sistema mediante un modelo RBAC. Cada usuario tiene 
roles asignados y cada rol tiene permisos específicos por operación.

**Relaciones clave:**
- person → user_account → user_role → security_role → role_permission → security_permission

---

### 5. Clientes y Fidelización
**Tablas:** customer_category, benefit_type, loyalty_program, loyalty_tier, customer, 
loyalty_account, loyalty_account_tier, miles_transaction, customer_benefit

**Descripción:** Gestiona el ciclo de vida del cliente y su participación en programas 
de fidelización. Permite acumular y redimir millas, asignar niveles y otorgar beneficios.

**Relaciones clave:**
- airline + person → customer → loyalty_account → loyalty_program → loyalty_tier
- loyalty_account → miles_transaction, loyalty_account_tier

---

### 6. Aeropuerto
**Tablas:** airport, terminal, boarding_gate, runway, airport_regulation

**Descripción:** Representa la infraestructura física de los aeropuertos. Incluye terminales, 
puertas de abordaje, pistas y regulaciones vigentes.

**Relaciones clave:**
- address → airport → terminal → boarding_gate
- airport → runway, airport_regulation

---

### 7. Aeronaves
**Tablas:** aircraft_manufacturer, aircraft_model, cabin_class, aircraft, aircraft_cabin, 
aircraft_seat, maintenance_provider, maintenance_type, maintenance_event

**Descripción:** Gestiona el inventario de aeronaves, su configuración de cabinas y asientos, 
y el historial de mantenimiento.

**Relaciones clave:**
- aircraft_manufacturer → aircraft_model → aircraft → aircraft_cabin → aircraft_seat
- aircraft → maintenance_event → maintenance_type, maintenance_provider

---

### 8. Operaciones de Vuelo
**Tablas:** flight_status, delay_reason_type, flight, flight_segment, flight_delay

**Descripción:** Registra los vuelos operados, sus segmentos con origen y destino, 
tiempos programados y reales, y los retrasos con su causa.

**Relaciones clave:**
- airline + aircraft → flight → flight_segment → airport
- flight_segment → flight_delay → delay_reason_type

---

### 9. Ventas y Reservas
**Tablas:** reservation_status, sale_channel, fare_class, fare, ticket_status, reservation, 
reservation_passenger, sale, ticket, ticket_segment, seat_assignment, baggage

**Descripción:** Dominio central del flujo comercial. Gestiona desde la reserva hasta la 
emisión del tiquete, asignación de asiento y registro de equipaje.

**Relaciones clave:**
- customer → reservation → reservation_passenger → ticket → ticket_segment → flight_segment
- ticket_segment → seat_assignment → aircraft_seat
- ticket_segment → baggage

---

### 10. Abordaje
**Tablas:** boarding_group, check_in_status, check_in, boarding_pass, boarding_validation

**Descripción:** Gestiona el proceso de check-in y abordaje del pasajero. Genera el 
pase de abordar y registra su validación en la puerta.

**Relaciones clave:**
- ticket_segment → check_in → boarding_pass → boarding_validation → boarding_gate

---

### 11. Pagos
**Tablas:** payment_status, payment_method, payment, payment_transaction, refund

**Descripción:** Registra los pagos asociados a ventas, sus transacciones con el proveedor 
de pagos y los reembolsos procesados.

**Relaciones clave:**
- sale → payment → payment_transaction
- payment → refund

---

### 12. Facturación
**Tablas:** tax, exchange_rate, invoice_status, invoice, invoice_line

**Descripción:** Gestiona la facturación de las ventas. Incluye tasas de impuestos, 
tipos de cambio de moneda y el detalle de cada línea facturable.

**Relaciones clave:**
- sale → invoice → invoice_line → tax
- currency → exchange_rate

---

## Dependencias entre Dominios

| Dominio | Depende de |
|---------|-----------|
| Aerolínea | Geografía |
| Identidad | Geografía |
| Seguridad | Identidad |
| Clientes | Aerolínea, Identidad |
| Aeropuerto | Geografía |
| Aeronaves | Aerolínea |
| Vuelos | Aerolínea, Aeronaves, Aeropuerto |
| Ventas | Clientes, Vuelos, Aeronaves |
| Abordaje | Ventas, Aeropuerto, Seguridad |
| Pagos | Ventas, Geografía |
| Facturación | Ventas, Geografía |