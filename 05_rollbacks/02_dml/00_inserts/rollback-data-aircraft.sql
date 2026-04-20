-- ============================================
-- ROLLBACK TEST DATA - AIRCRAFT
-- ============================================

DELETE FROM aircraft_seat WHERE aircraft_cabin_id IN (SELECT aircraft_cabin_id FROM aircraft_cabin WHERE aircraft_id IN (SELECT aircraft_id FROM aircraft WHERE registration_number IN ('HK-4801', 'HK-4802', 'N-001-AA', 'G-001-BA', 'F-001-AF')));
DELETE FROM aircraft_cabin WHERE aircraft_id IN (SELECT aircraft_id FROM aircraft WHERE registration_number IN ('HK-4801', 'HK-4802', 'N-001-AA', 'G-001-BA', 'F-001-AF'));
DELETE FROM aircraft WHERE registration_number IN ('HK-4801', 'HK-4802', 'N-001-AA', 'G-001-BA', 'F-001-AF');
DELETE FROM cabin_class WHERE class_code IN ('F', 'C', 'Y');
DELETE FROM aircraft_model WHERE model_code IN ('B737-800', 'B787-9', 'A320-200', 'A330-200', 'E190');
DELETE FROM aircraft_manufacturer WHERE manufacturer_name IN ('Boeing', 'Airbus', 'Embraer');