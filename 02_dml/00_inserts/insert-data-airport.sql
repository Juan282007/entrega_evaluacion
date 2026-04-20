-- ============================================
-- TEST DATA - AIRPORT
-- ============================================

-- airport
INSERT INTO airport (address_id, airport_name, iata_code, icao_code, is_active) VALUES
((SELECT address_id FROM address WHERE address_line_1 = 'Calle 72 # 10-34'), 'El Dorado International Airport', 'BOG', 'SKBO', true),
((SELECT address_id FROM address WHERE address_line_1 = 'Carrera 43A # 1-50'), 'Jose Maria Cordova International Airport', 'MDE', 'SKRG', true),
((SELECT address_id FROM address WHERE address_line_1 = '350 5th Ave'), 'John F Kennedy International Airport', 'JFK', 'KJFK', true),
((SELECT address_id FROM address WHERE address_line_1 = '1 Parliament Square'), 'Heathrow Airport', 'LHR', 'EGLL', true),
((SELECT address_id FROM address WHERE address_line_1 = '4 Rue de Bretagne'), 'Charles de Gaulle Airport', 'CDG', 'LFPG', true);

-- terminal
INSERT INTO terminal (airport_id, terminal_code, terminal_name) VALUES
((SELECT airport_id FROM airport WHERE iata_code = 'BOG'), 'T1', 'Terminal 1'),
((SELECT airport_id FROM airport WHERE iata_code = 'BOG'), 'T2', 'Terminal 2'),
((SELECT airport_id FROM airport WHERE iata_code = 'MDE'), 'T1', 'Terminal Principal'),
((SELECT airport_id FROM airport WHERE iata_code = 'JFK'), 'T4', 'Terminal 4'),
((SELECT airport_id FROM airport WHERE iata_code = 'LHR'), 'T5', 'Terminal 5');

-- boarding_gate
INSERT INTO boarding_gate (terminal_id, gate_code, is_active) VALUES
((SELECT terminal_id FROM terminal WHERE terminal_code = 'T1' AND airport_id = (SELECT airport_id FROM airport WHERE iata_code = 'BOG')), 'G01', true),
((SELECT terminal_id FROM terminal WHERE terminal_code = 'T1' AND airport_id = (SELECT airport_id FROM airport WHERE iata_code = 'BOG')), 'G02', true),
((SELECT terminal_id FROM terminal WHERE terminal_code = 'T2' AND airport_id = (SELECT airport_id FROM airport WHERE iata_code = 'BOG')), 'G10', true),
((SELECT terminal_id FROM terminal WHERE terminal_code = 'T1' AND airport_id = (SELECT airport_id FROM airport WHERE iata_code = 'MDE')), 'G01', true),
((SELECT terminal_id FROM terminal WHERE terminal_code = 'T4' AND airport_id = (SELECT airport_id FROM airport WHERE iata_code = 'JFK')), 'G40', true);

-- runway
INSERT INTO runway (airport_id, runway_code, length_meters, surface_type) VALUES
((SELECT airport_id FROM airport WHERE iata_code = 'BOG'), 'RW13R', 3800, 'Asphalt'),
((SELECT airport_id FROM airport WHERE iata_code = 'BOG'), 'RW13L', 3800, 'Asphalt'),
((SELECT airport_id FROM airport WHERE iata_code = 'MDE'), 'RW01', 3559, 'Asphalt'),
((SELECT airport_id FROM airport WHERE iata_code = 'JFK'), 'RW04L', 2560, 'Asphalt'),
((SELECT airport_id FROM airport WHERE iata_code = 'LHR'), 'RW09L', 3902, 'Asphalt');