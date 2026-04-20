-- ============================================
-- TEST DATA - AIRLINE
-- ============================================

INSERT INTO airline (home_country_id, airline_code, airline_name, iata_code, icao_code, is_active) VALUES
((SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'AV', 'Avianca', 'AV', 'AVA', true),
((SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'LA', 'LATAM Colombia', 'LA', 'LAN', true),
((SELECT country_id FROM country WHERE iso_alpha2 = 'US'), 'AA', 'American Airlines', 'AA', 'AAL', true),
((SELECT country_id FROM country WHERE iso_alpha2 = 'GB'), 'BA', 'British Airways', 'BA', 'BAW', true),
((SELECT country_id FROM country WHERE iso_alpha2 = 'FR'), 'AF', 'Air France', 'AF', 'AFR', true);