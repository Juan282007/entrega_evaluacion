-- ============================================
-- TEST DATA - IDENTITY
-- ============================================

-- person_type
INSERT INTO person_type (type_code, type_name) VALUES
('NATURAL', 'Natural Person'),
('LEGAL', 'Legal Entity'),
('FOREIGN', 'Foreign Person');

-- document_type
INSERT INTO document_type (type_code, type_name) VALUES
('CC', 'Cedula de Ciudadania'),
('PASSPORT', 'Passport'),
('CE', 'Cedula de Extranjeria'),
('NIT', 'NIT'),
('DNI', 'DNI');

-- contact_type
INSERT INTO contact_type (type_code, type_name) VALUES
('EMAIL', 'Email'),
('PHONE', 'Phone'),
('MOBILE', 'Mobile'),
('ADDRESS', 'Address');

-- person
INSERT INTO person (person_type_id, nationality_country_id, first_name, last_name, birth_date, gender_code) VALUES
((SELECT person_type_id FROM person_type WHERE type_code = 'NATURAL'), (SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'Carlos', 'Ramirez', '1990-05-15', 'M'),
((SELECT person_type_id FROM person_type WHERE type_code = 'NATURAL'), (SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), 'Maria', 'Lopez', '1985-08-22', 'F'),
((SELECT person_type_id FROM person_type WHERE type_code = 'NATURAL'), (SELECT country_id FROM country WHERE iso_alpha2 = 'US'), 'John', 'Smith', '1992-03-10', 'M'),
((SELECT person_type_id FROM person_type WHERE type_code = 'NATURAL'), (SELECT country_id FROM country WHERE iso_alpha2 = 'GB'), 'Emma', 'Wilson', '1988-11-30', 'F'),
((SELECT person_type_id FROM person_type WHERE type_code = 'NATURAL'), (SELECT country_id FROM country WHERE iso_alpha2 = 'FR'), 'Pierre', 'Dupont', '1995-07-18', 'M');

-- person_document
INSERT INTO person_document (person_id, document_type_id, issuing_country_id, document_number, issued_on, expires_on) VALUES
((SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez'), (SELECT document_type_id FROM document_type WHERE type_code = 'CC'), (SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), '1234567890', '2010-01-01', '2030-01-01'),
((SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez'), (SELECT document_type_id FROM document_type WHERE type_code = 'CC'), (SELECT country_id FROM country WHERE iso_alpha2 = 'CO'), '0987654321', '2008-06-15', '2028-06-15'),
((SELECT person_id FROM person WHERE first_name = 'John' AND last_name = 'Smith'), (SELECT document_type_id FROM document_type WHERE type_code = 'PASSPORT'), (SELECT country_id FROM country WHERE iso_alpha2 = 'US'), 'US123456', '2019-03-10', '2029-03-10'),
((SELECT person_id FROM person WHERE first_name = 'Emma' AND last_name = 'Wilson'), (SELECT document_type_id FROM document_type WHERE type_code = 'PASSPORT'), (SELECT country_id FROM country WHERE iso_alpha2 = 'GB'), 'GB789012', '2020-11-30', '2030-11-30'),
((SELECT person_id FROM person WHERE first_name = 'Pierre' AND last_name = 'Dupont'), (SELECT document_type_id FROM document_type WHERE type_code = 'PASSPORT'), (SELECT country_id FROM country WHERE iso_alpha2 = 'FR'), 'FR345678', '2021-07-18', '2031-07-18');

-- person_contact
INSERT INTO person_contact (person_id, contact_type_id, contact_value, is_primary) VALUES
((SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez'), (SELECT contact_type_id FROM contact_type WHERE type_code = 'EMAIL'), 'carlos.ramirez@email.com', true),
((SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez'), (SELECT contact_type_id FROM contact_type WHERE type_code = 'EMAIL'), 'maria.lopez@email.com', true),
((SELECT person_id FROM person WHERE first_name = 'John' AND last_name = 'Smith'), (SELECT contact_type_id FROM contact_type WHERE type_code = 'EMAIL'), 'john.smith@email.com', true),
((SELECT person_id FROM person WHERE first_name = 'Emma' AND last_name = 'Wilson'), (SELECT contact_type_id FROM contact_type WHERE type_code = 'EMAIL'), 'emma.wilson@email.com', true),
((SELECT person_id FROM person WHERE first_name = 'Pierre' AND last_name = 'Dupont'), (SELECT contact_type_id FROM contact_type WHERE type_code = 'EMAIL'), 'pierre.dupont@email.com', true);