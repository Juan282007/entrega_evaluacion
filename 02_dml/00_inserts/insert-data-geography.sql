-- ============================================
-- TEST DATA - GEOGRAPHY AND REFERENCE DATA
-- ============================================

INSERT INTO time_zone (time_zone_name, utc_offset_minutes) VALUES
('America/Bogota', -300),
('America/New_York', -300),
('Europe/London', 0),
('Europe/Paris', 60),
('Asia/Tokyo', 540);

INSERT INTO continent (continent_code, continent_name) VALUES
('AM', 'America'),
('EU', 'Europe'),
('AS', 'Asia'),
('AF', 'Africa'),
('OC', 'Oceania');

INSERT INTO country (continent_id, iso_alpha2, iso_alpha3, country_name) VALUES
((SELECT continent_id FROM continent WHERE continent_code = 'AM'), 'CO', 'COL', 'Colombia'),
((SELECT continent_id FROM continent WHERE continent_code = 'AM'), 'US', 'USA', 'United States'),
((SELECT continent_id FROM continent WHERE continent_code = 'EU'), 'GB', 'GBR', 'United Kingdom'),
((SELECT continent_id FROM continent WHERE continent_code = 'EU'), 'FR', 'FRA', 'France'),
((SELECT continent_id FROM continent WHERE continent_code = 'AS'), 'JP', 'JPN', 'Japan');

INSERT INTO state_province (country_id, state_code, state_name) VALUES
((SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'CUN', 'Cundinamarca'),
((SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'ANT', 'Antioquia'),
((SELECT country_id FROM country WHERE iso_alpha2 = 'US'), 'NY', 'New York'),
((SELECT country_id FROM country WHERE iso_alpha2 = 'GB'), 'ENG', 'England'),
((SELECT country_id FROM country WHERE iso_alpha2 = 'FR'), 'IDF', 'Ile-de-France');

INSERT INTO city (state_province_id, time_zone_id, city_name) VALUES
((SELECT state_province_id FROM state_province WHERE state_code = 'CUN'), (SELECT time_zone_id FROM time_zone WHERE time_zone_name = 'America/Bogota'), 'Bogota'),
((SELECT state_province_id FROM state_province WHERE state_code = 'ANT'), (SELECT time_zone_id FROM time_zone WHERE time_zone_name = 'America/Bogota'), 'Medellin'),
((SELECT state_province_id FROM state_province WHERE state_code = 'NY'), (SELECT time_zone_id FROM time_zone WHERE time_zone_name = 'America/New_York'), 'New York City'),
((SELECT state_province_id FROM state_province WHERE state_code = 'ENG'), (SELECT time_zone_id FROM time_zone WHERE time_zone_name = 'Europe/London'), 'London'),
((SELECT state_province_id FROM state_province WHERE state_code = 'IDF'), (SELECT time_zone_id FROM time_zone WHERE time_zone_name = 'Europe/Paris'), 'Paris');

INSERT INTO district (city_id, district_name) VALUES
((SELECT city_id FROM city WHERE city_name = 'Bogota'), 'Chapinero'),
((SELECT city_id FROM city WHERE city_name = 'Medellin'), 'El Poblado'),
((SELECT city_id FROM city WHERE city_name = 'New York City'), 'Manhattan'),
((SELECT city_id FROM city WHERE city_name = 'London'), 'Westminster'),
((SELECT city_id FROM city WHERE city_name = 'Paris'), 'Le Marais');

INSERT INTO address (district_id, address_line_1, postal_code, latitude, longitude) VALUES
((SELECT district_id FROM district WHERE district_name = 'Chapinero'), 'Calle 72 # 10-34', '110221', 4.6534, -74.0634),
((SELECT district_id FROM district WHERE district_name = 'El Poblado'), 'Carrera 43A # 1-50', '050021', 6.2086, -75.5659),
((SELECT district_id FROM district WHERE district_name = 'Manhattan'), '350 5th Ave', '10118', 40.7484, -73.9967),
((SELECT district_id FROM district WHERE district_name = 'Westminster'), '1 Parliament Square', 'SW1P 3BD', 51.5007, -0.1246),
((SELECT district_id FROM district WHERE district_name = 'Le Marais'), '4 Rue de Bretagne', '75003', 48.8637, 2.3599);

INSERT INTO currency (iso_currency_code, currency_name, currency_symbol, minor_units) VALUES
('COP', 'Colombian Peso', '$', 2),
('USD', 'US Dollar', '$', 2),
('GBP', 'British Pound', '£', 2),
('EUR', 'Euro', '€', 2),
('JPY', 'Japanese Yen', '¥', 0);