-- ============================================
-- ROLLBACK TEST DATA - FLIGHT
-- ============================================

DELETE FROM flight_segment WHERE flight_id IN (SELECT flight_id FROM flight WHERE flight_number IN ('AV101', 'AV202', 'AA301'));
DELETE FROM flight WHERE flight_number IN ('AV101', 'AV202', 'AA301');
DELETE FROM delay_reason_type WHERE reason_code IN ('WEATHER', 'TECHNICAL', 'ATC', 'CREW', 'SECURITY');
DELETE FROM flight_status WHERE status_code IN ('SCHEDULED', 'BOARDING', 'DEPARTED', 'ARRIVED', 'CANCELLED', 'DELAYED');