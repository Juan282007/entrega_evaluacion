-- ============================================
-- TEST DATA - AIRCRAFT
-- ============================================

-- aircraft_manufacturer
INSERT INTO aircraft_manufacturer (manufacturer_name) VALUES
('Boeing'),
('Airbus'),
('Embraer');

-- aircraft_model
INSERT INTO aircraft_model (aircraft_manufacturer_id, model_code, model_name, max_range_km) VALUES
((SELECT aircraft_manufacturer_id FROM aircraft_manufacturer WHERE manufacturer_name = 'Boeing'), 'B737-800', 'Boeing 737-800', 5765),
((SELECT aircraft_manufacturer_id FROM aircraft_manufacturer WHERE manufacturer_name = 'Boeing'), 'B787-9', 'Boeing 787-9', 14140),
((SELECT aircraft_manufacturer_id FROM aircraft_manufacturer WHERE manufacturer_name = 'Airbus'), 'A320-200', 'Airbus A320-200', 6150),
((SELECT aircraft_manufacturer_id FROM aircraft_manufacturer WHERE manufacturer_name = 'Airbus'), 'A330-200', 'Airbus A330-200', 13450),
((SELECT aircraft_manufacturer_id FROM aircraft_manufacturer WHERE manufacturer_name = 'Embraer'), 'E190', 'Embraer E190', 4537);

-- cabin_class
INSERT INTO cabin_class (class_code, class_name) VALUES
('F', 'First Class'),
('C', 'Business Class'),
('Y', 'Economy Class');

-- aircraft
INSERT INTO aircraft (airline_id, aircraft_model_id, registration_number, serial_number, in_service_on) VALUES
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT aircraft_model_id FROM aircraft_model WHERE model_code = 'B737-800'), 'HK-4801', 'SN-001-AV', '2015-03-01'),
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT aircraft_model_id FROM aircraft_model WHERE model_code = 'A320-200'), 'HK-4802', 'SN-002-AV', '2016-06-15'),
((SELECT airline_id FROM airline WHERE airline_code = 'AA'), (SELECT aircraft_model_id FROM aircraft_model WHERE model_code = 'B787-9'), 'N-001-AA', 'SN-001-AA', '2018-01-10'),
((SELECT airline_id FROM airline WHERE airline_code = 'BA'), (SELECT aircraft_model_id FROM aircraft_model WHERE model_code = 'A330-200'), 'G-001-BA', 'SN-001-BA', '2017-09-20'),
((SELECT airline_id FROM airline WHERE airline_code = 'AF'), (SELECT aircraft_model_id FROM aircraft_model WHERE model_code = 'A320-200'), 'F-001-AF', 'SN-001-AF', '2019-04-05');

-- aircraft_cabin
INSERT INTO aircraft_cabin (aircraft_id, cabin_class_id, cabin_code, deck_number) VALUES
((SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801'), (SELECT cabin_class_id FROM cabin_class WHERE class_code = 'Y'), 'Y1', 1),
((SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801'), (SELECT cabin_class_id FROM cabin_class WHERE class_code = 'C'), 'C1', 1),
((SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4802'), (SELECT cabin_class_id FROM cabin_class WHERE class_code = 'Y'), 'Y1', 1),
((SELECT aircraft_id FROM aircraft WHERE registration_number = 'N-001-AA'), (SELECT cabin_class_id FROM cabin_class WHERE class_code = 'F'), 'F1', 1),
((SELECT aircraft_id FROM aircraft WHERE registration_number = 'N-001-AA'), (SELECT cabin_class_id FROM cabin_class WHERE class_code = 'Y'), 'Y1', 1);

-- aircraft_seat
INSERT INTO aircraft_seat (aircraft_cabin_id, seat_row_number, seat_column_code, is_window, is_aisle, is_exit_row) VALUES
((SELECT aircraft_cabin_id FROM aircraft_cabin WHERE cabin_code = 'Y1' AND aircraft_id = (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801')), 1, 'A', true, false, false),
((SELECT aircraft_cabin_id FROM aircraft_cabin WHERE cabin_code = 'Y1' AND aircraft_id = (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801')), 1, 'B', false, false, false),
((SELECT aircraft_cabin_id FROM aircraft_cabin WHERE cabin_code = 'Y1' AND aircraft_id = (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801')), 1, 'C', false, true, false),
((SELECT aircraft_cabin_id FROM aircraft_cabin WHERE cabin_code = 'C1' AND aircraft_id = (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4801')), 1, 'A', true, false, false),
((SELECT aircraft_cabin_id FROM aircraft_cabin WHERE cabin_code = 'Y1' AND aircraft_id = (SELECT aircraft_id FROM aircraft WHERE registration_number = 'HK-4802')), 1, 'A', true, false, false);