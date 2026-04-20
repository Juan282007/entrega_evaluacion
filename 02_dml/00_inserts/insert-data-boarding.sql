-- ============================================
-- TEST DATA - BOARDING
-- ============================================

-- boarding_group
INSERT INTO boarding_group (group_code, group_name, sequence_no) VALUES
('GRP1', 'Group 1 - Priority', 1),
('GRP2', 'Group 2 - Business', 2),
('GRP3', 'Group 3 - Economy', 3);

-- check_in_status
INSERT INTO check_in_status (status_code, status_name) VALUES
('PENDING', 'Pending'),
('CHECKED_IN', 'Checked In'),
('BOARDED', 'Boarded'),
('NO_SHOW', 'No Show');

-- check_in
INSERT INTO check_in (ticket_segment_id, check_in_status_id, boarding_group_id, checked_in_at) VALUES
((SELECT ticket_segment_id FROM ticket_segment WHERE ticket_id = (SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-001') AND segment_sequence_no = 1), (SELECT check_in_status_id FROM check_in_status WHERE status_code = 'CHECKED_IN'), (SELECT boarding_group_id FROM boarding_group WHERE group_code = 'GRP3'), '2026-05-01 06:00:00-05'),
((SELECT ticket_segment_id FROM ticket_segment WHERE ticket_id = (SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-002') AND segment_sequence_no = 1), (SELECT check_in_status_id FROM check_in_status WHERE status_code = 'CHECKED_IN'), (SELECT boarding_group_id FROM boarding_group WHERE group_code = 'GRP3'), '2026-05-01 08:00:00-05');

-- boarding_pass
INSERT INTO boarding_pass (check_in_id, boarding_pass_code, barcode_value, issued_at) VALUES
((SELECT check_in_id FROM check_in WHERE ticket_segment_id = (SELECT ticket_segment_id FROM ticket_segment WHERE ticket_id = (SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-001') AND segment_sequence_no = 1)), 'BP-001', 'BC-TKT001-AV101-BOG-MDE', '2026-05-01 06:05:00-05'),
((SELECT check_in_id FROM check_in WHERE ticket_segment_id = (SELECT ticket_segment_id FROM ticket_segment WHERE ticket_id = (SELECT ticket_id FROM ticket WHERE ticket_number = 'TKT-002') AND segment_sequence_no = 1)), 'BP-002', 'BC-TKT002-AV202-BOG-JFK', '2026-05-01 08:05:00-05');