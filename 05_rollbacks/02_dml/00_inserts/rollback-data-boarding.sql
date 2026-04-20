-- ============================================
-- ROLLBACK TEST DATA - BOARDING
-- ============================================

DELETE FROM boarding_pass WHERE boarding_pass_code IN ('BP-001', 'BP-002');
DELETE FROM check_in WHERE ticket_segment_id IN (SELECT ticket_segment_id FROM ticket_segment WHERE ticket_id IN (SELECT ticket_id FROM ticket WHERE ticket_number IN ('TKT-001', 'TKT-002')));
DELETE FROM check_in_status WHERE status_code IN ('PENDING', 'CHECKED_IN', 'BOARDED', 'NO_SHOW');
DELETE FROM boarding_group WHERE group_code IN ('GRP1', 'GRP2', 'GRP3');