-- ============================================
-- TEST DATA - SALES, RESERVATION, TICKETING
-- ============================================

-- reservation_status
INSERT INTO reservation_status (status_code, status_name) VALUES
('PENDING', 'Pending'),
('CONFIRMED', 'Confirmed'),
('CANCELLED', 'Cancelled'),
('EXPIRED', 'Expired');

-- sale_channel
INSERT INTO sale_channel (channel_code, channel_name) VALUES
('WEB', 'Web'),
('MOBILE', 'Mobile App'),
('AGENCY', 'Travel Agency'),
('COUNTER', 'Airport Counter');

-- fare_class
INSERT INTO fare_class (cabin_class_id, fare_class_code, fare_class_name, is_refundable_by_default) VALUES
((SELECT cabin_class_id FROM cabin_class WHERE class_code = 'Y'), 'ECO_BASIC', 'Economy Basic', false),
((SELECT cabin_class_id FROM cabin_class WHERE class_code = 'Y'), 'ECO_FLEX', 'Economy Flex', true),
((SELECT cabin_class_id FROM cabin_class WHERE class_code = 'C'), 'BUS_FLEX', 'Business Flex', true),
((SELECT cabin_class_id FROM cabin_class WHERE class_code = 'F'), 'FIRST', 'First Class', true);

-- fare
INSERT INTO fare (airline_id, origin_airport_id, destination_airport_id, fare_class_id, currency_id, fare_code, base_amount, valid_from, baggage_allowance_qty) VALUES
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT airport_id FROM airport WHERE iata_code = 'BOG'), (SELECT airport_id FROM airport WHERE iata_code = 'MDE'), (SELECT fare_class_id FROM fare_class WHERE fare_class_code = 'ECO_BASIC'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'COP'), 'AV-BOG-MDE-ECO', 250000.00, '2026-01-01', 1),
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT airport_id FROM airport WHERE iata_code = 'BOG'), (SELECT airport_id FROM airport WHERE iata_code = 'JFK'), (SELECT fare_class_id FROM fare_class WHERE fare_class_code = 'ECO_FLEX'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'AV-BOG-JFK-ECO', 450.00, '2026-01-01', 2),
((SELECT airline_id FROM airline WHERE airline_code = 'AA'), (SELECT airport_id FROM airport WHERE iata_code = 'JFK'), (SELECT airport_id FROM airport WHERE iata_code = 'LHR'), (SELECT fare_class_id FROM fare_class WHERE fare_class_code = 'BUS_FLEX'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'AA-JFK-LHR-BUS', 2500.00, '2026-01-01', 2);

-- ticket_status
INSERT INTO ticket_status (status_code, status_name) VALUES
('ISSUED', 'Issued'),
('USED', 'Used'),
('REFUNDED', 'Refunded'),
('CANCELLED', 'Cancelled');

-- reservation
INSERT INTO reservation (booked_by_customer_id, reservation_status_id, sale_channel_id, reservation_code, booked_at) VALUES
((SELECT customer_id FROM customer WHERE person_id = (SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez')), (SELECT reservation_status_id FROM reservation_status WHERE status_code = 'CONFIRMED'), (SELECT sale_channel_id FROM sale_channel WHERE channel_code = 'WEB'), 'RES-001', '2026-04-01 10:00:00-05'),
((SELECT customer_id FROM customer WHERE person_id = (SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez')), (SELECT reservation_status_id FROM reservation_status WHERE status_code = 'CONFIRMED'), (SELECT sale_channel_id FROM sale_channel WHERE channel_code = 'MOBILE'), 'RES-002', '2026-04-02 11:00:00-05');

-- reservation_passenger
INSERT INTO reservation_passenger (reservation_id, person_id, passenger_sequence_no, passenger_type) VALUES
((SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-001'), (SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez'), 1, 'ADULT'),
((SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-002'), (SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez'), 1, 'ADULT');

-- sale
INSERT INTO sale (reservation_id, currency_id, sale_code, sold_at) VALUES
((SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-001'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'COP'), 'SALE-001', '2026-04-01 10:05:00-05'),
((SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-002'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'SALE-002', '2026-04-02 11:05:00-05');

-- ticket
INSERT INTO ticket (sale_id, reservation_passenger_id, fare_id, ticket_status_id, ticket_number, issued_at) VALUES
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-001'), (SELECT reservation_passenger_id FROM reservation_passenger WHERE reservation_id = (SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-001')), (SELECT fare_id FROM fare WHERE fare_code = 'AV-BOG-MDE-ECO'), (SELECT ticket_status_id FROM ticket_status WHERE status_code = 'ISSUED'), 'TKT-001', '2026-04-01 10:10:00-05'),
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-002'), (SELECT reservation_passenger_id FROM reservation_passenger WHERE reservation_id = (SELECT reservation_id FROM reservation WHERE reservation_code = 'RES-002')), (SELECT fare_id FROM fare WHERE fare_code = 'AV-BOG-JFK-ECO'), (SELECT ticket_status_id FROM ticket_status WHERE status_code = 'ISSUED'), 'TKT-002', '2026-04-02 11:10:00-05');

-- ticket_segment
INSERT INTO ticket_segment (ticket_id, flight_segment_id, segment_sequence_no, fare_basis_code) VALUES
((SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-001'), (SELECT flight_segment_id FROM flight_segment WHERE flight_id = (SELECT flight_id FROM flight WHERE flight_number = 'AV101' AND service_date = '2026-05-01') AND segment_number = 1), 1, 'ECO_BASIC'),
((SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-002'), (SELECT flight_segment_id FROM flight_segment WHERE flight_id = (SELECT flight_id FROM flight WHERE flight_number = 'AV202' AND service_date = '2026-05-01') AND segment_number = 1), 1, 'ECO_FLEX');