-- ============================================
-- TEST DATA - FLIGHT OPERATIONS
-- ============================================

-- flight_status
INSERT INTO flight_status (status_code, status_name) VALUES
('SCHEDULED', 'Scheduled'),
('BOARDING', 'Boarding'),
('DEPARTED', 'Departed'),
('ARRIVED', 'Arrived'),
('CANCELLED', 'Cancelled'),
('DELAYED', 'Delayed');

-- delay_reason_type
INSERT INTO delay_reason_type (reason_code, reason_name) VALUES
('WEATHER', 'Weather Conditions'),
('TECHNICAL', 'Technical Issues'),
('ATC', 'Air Traffic Control'),
('CREW', 'Crew Availability'),
('SECURITY', 'Security Check');

-- flight
INSERT INTO flight (airline_id, aircraft_id, flight_status_id, flight_number, service_date) VALUES
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801'), (SELECT flight_status_id FROM flight_status WHERE status_code = 'SCHEDULED'), 'AV101', '2026-05-01'),
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4802'), (SELECT flight_status_id FROM flight_status WHERE status_code = 'SCHEDULED'), 'AV202', '2026-05-01'),
((SELECT airline_id FROM airline WHERE airline_code = 'AA'), (SELECT aircraft_id FROM aircraft WHERE registration_number = 'N-001-AA'), (SELECT flight_status_id FROM flight_status WHERE status_code = 'SCHEDULED'), 'AA301', '2026-05-02');

-- flight_segment
INSERT INTO flight_segment (flight_id, origin_airport_id, destination_airport_id, segment_number, scheduled_departure_at, scheduled_arrival_at) VALUES
((SELECT flight_id FROM flight WHERE flight_number = 'AV101' AND service_date = '2026-05-01'), (SELECT airport_id FROM airport WHERE iata_code = 'BOG'), (SELECT airport_id FROM airport WHERE iata_code = 'MDE'), 1, '2026-05-01 08:00:00-05', '2026-05-01 09:00:00-05'),
((SELECT flight_id FROM flight WHERE flight_number = 'AV202' AND service_date = '2026-05-01'), (SELECT airport_id FROM airport WHERE iata_code = 'BOG'), (SELECT airport_id FROM airport WHERE iata_code = 'JFK'), 1, '2026-05-01 10:00:00-05', '2026-05-01 18:00:00-05'),
((SELECT flight_id FROM flight WHERE flight_number = 'AA301' AND service_date = '2026-05-02'), (SELECT airport_id FROM airport WHERE iata_code = 'JFK'), (SELECT airport_id FROM airport WHERE iata_code = 'LHR'), 1, '2026-05-02 09:00:00-05', '2026-05-02 21:00:00+01');