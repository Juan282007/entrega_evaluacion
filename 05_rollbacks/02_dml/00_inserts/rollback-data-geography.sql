-- ============================================
-- ROLLBACK TEST DATA - GEOGRAPHY
-- ============================================

DELETE FROM address WHERE address_line_1 IN ('Calle 72 # 10-34', 'Carrera 43A # 1-50', '350 5th Ave', '1 Parliament Square', '4 Rue de Bretagne');
DELETE FROM district WHERE district_name IN ('Chapinero', 'El Poblado', 'Manhattan', 'Westminster', 'Le Marais');
DELETE FROM city WHERE city_name IN ('Bogota', 'Medellin', 'New York City', 'London', 'Paris');
DELETE FROM state_province WHERE state_code IN ('CUN', 'ANT', 'NY', 'ENG', 'IDF');
DELETE FROM country WHERE iso_alpha2 IN ('CO', 'US', 'GB', 'FR', 'JP');
DELETE FROM continent WHERE continent_code IN ('AM', 'EU', 'AS', 'AF', 'OC');
DELETE FROM time_zone WHERE time_zone_name IN ('America/Bogota', 'America/New_York', 'Europe/London', 'Europe/Paris', 'Asia/Tokyo');
DELETE FROM currency WHERE iso_currency_code IN ('COP', 'USD', 'GBP', 'EUR', 'JPY');