-- ============================================
-- ROLLBACK TEST DATA - SALES
-- ============================================

DELETE FROM ticket_segment WHERE ticket_id IN (SELECT ticket_id FROM ticket WHERE ticket_number IN ('TKT-001', 'TKT-002'));
DELETE FROM ticket WHERE ticket_number IN ('TKT-001', 'TKT-002');
DELETE FROM sale WHERE sale_code IN ('SALE-001', 'SALE-002');
DELETE FROM reservation_passenger WHERE reservation_id IN (SELECT reservation_id FROM reservation WHERE reservation_code IN ('RES-001', 'RES-002'));
DELETE FROM reservation WHERE reservation_code IN ('RES-001', 'RES-002');
DELETE FROM ticket_status WHERE status_code IN ('ISSUED', 'USED', 'REFUNDED', 'CANCELLED');
DELETE FROM fare WHERE fare_code IN ('AV-BOG-MDE-ECO', 'AV-BOG-JFK-ECO', 'AA-JFK-LHR-BUS');
DELETE FROM fare_class WHERE fare_class_code IN ('ECO_BASIC', 'ECO_FLEX', 'BUS_FLEX', 'FIRST');
DELETE FROM sale_channel WHERE channel_code IN ('WEB', 'MOBILE', 'AGENCY', 'COUNTER');
DELETE FROM reservation_status WHERE status_code IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'EXPIRED');