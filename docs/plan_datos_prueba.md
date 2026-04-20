# Plan de Datos de Prueba

## Objetivo
Definir el orden de inserción de datos de prueba respetando las dependencias entre tablas del modelo.

## Orden de Inserción por Dependencias

### Nivel 1 — Sin dependencias
| Tabla | Dominio |
|-------|---------|
| time_zone | Geography |
| continent | Geography |
| currency | Geography |
| person_type | Identity |
| document_type | Identity |
| contact_type | Identity |
| user_status | Security |
| security_role | Security |
| security_permission | Security |
| customer_category | Customer |
| benefit_type | Customer |
| aircraft_manufacturer | Aircraft |
| cabin_class | Aircraft |
| flight_status | Flight |
| delay_reason_type | Flight |
| reservation_status | Sales |
| sale_channel | Sales |
| ticket_status | Sales |
| boarding_group | Boarding |
| check_in_status | Boarding |
| payment_status | Payment |
| payment_method | Payment |
| invoice_status | Billing |
| tax | Billing |
| maintenance_type | Aircraft |

### Nivel 2 — Dependen de Nivel 1
| Tabla | Depende de |
|-------|-----------|
| country | continent |
| person | person_type |
| fare_class | cabin_class |

### Nivel 3 — Dependen de Nivel 2
| Tabla | Depende de |
|-------|-----------|
| state_province | country |
| airline | country |
| person_document | person, document_type, country |
| person_contact | person, contact_type |
| user_account | person, user_status |
| aircraft_model | aircraft_manufacturer |

### Nivel 4 — Dependen de Nivel 3
| Tabla | Depende de |
|-------|-----------|
| city | state_province, time_zone |
| loyalty_program | airline, currency |
| customer | airline, person, customer_category |
| aircraft | airline, aircraft_model |
| user_role | user_account, security_role |
| role_permission | security_role, security_permission |

### Nivel 5 — Dependen de Nivel 4
| Tabla | Depende de |
|-------|-----------|
| district | city |
| loyalty_tier | loyalty_program |
| loyalty_account | customer, loyalty_program |
| aircraft_cabin | aircraft, cabin_class |
| flight | airline, aircraft, flight_status |

### Nivel 6 — Dependen de Nivel 5
| Tabla | Depende de |
|-------|-----------|
| address | district |
| loyalty_account_tier | loyalty_account, loyalty_tier |
| aircraft_seat | aircraft_cabin |
| flight_segment | flight, airport |

### Nivel 7 — Dependen de Nivel 6
| Tabla | Depende de |
|-------|-----------|
| airport | address |
| fare | airline, airport, fare_class, currency |
| reservation | customer, reservation_status, sale_channel |
| ticket_segment | ticket, flight_segment |

### Nivel 8 — Dependen de Nivel 7
| Tabla | Depende de |
|-------|-----------|
| terminal | airport |
| runway | airport |
| reservation_passenger | reservation, person |
| sale | reservation, currency |

### Nivel 9 — Dependen de Nivel 8
| Tabla | Depende de |
|-------|-----------|
| boarding_gate | terminal |
| ticket | sale, reservation_passenger, fare, ticket_status |

### Nivel 10 — Dependen de Nivel 9
| Tabla | Depende de |
|-------|-----------|
| seat_assignment | ticket_segment, aircraft_seat |
| check_in | ticket_segment, check_in_status, boarding_group |
| payment | sale, payment_status, payment_method, currency |

### Nivel 11 — Dependen de Nivel 10
| Tabla | Depende de |
|-------|-----------|
| boarding_pass | check_in |
| payment_transaction | payment |
| refund | payment |
| invoice | sale, invoice_status, currency |

### Nivel 12 — Dependen de Nivel 11
| Tabla | Depende de |
|-------|-----------|
| boarding_validation | boarding_pass, boarding_gate |
| invoice_line | invoice, tax |

## Validaciones
- Verificar que no existan registros huérfanos después de cada inserción
- Validar que las restricciones CHECK se cumplan
- Confirmar que las claves foráneas apunten a registros existentes
- Verificar unicidad en campos con restricción UNIQUE