-- ============================================
-- ROLLBACK TEST DATA - AIRPORT
-- ============================================

DELETE FROM runway WHERE runway_code IN ('RW13R', 'RW13L', 'RW01', 'RW04L', 'RW09L');
DELETE FROM boarding_gate WHERE gate_code IN ('G01', 'G02', 'G10', 'G40');
DELETE FROM terminal WHERE terminal_code IN ('T1', 'T2', 'T4', 'T5');
DELETE FROM airport WHERE iata_code IN ('BOG', 'MDE', 'JFK', 'LHR', 'CDG');