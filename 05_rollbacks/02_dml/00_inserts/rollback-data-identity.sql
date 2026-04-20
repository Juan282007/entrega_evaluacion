-- ============================================
-- ROLLBACK TEST DATA - IDENTITY
-- ============================================

DELETE FROM person_contact WHERE contact_value IN ('carlos.ramirez@email.com', 'maria.lopez@email.com', 'john.smith@email.com', 'emma.wilson@email.com', 'pierre.dupont@email.com');
DELETE FROM person_document WHERE document_number IN ('1234567890', '0987654321', 'US123456', 'GB789012', 'FR345678');
DELETE FROM person WHERE first_name IN ('Carlos', 'Maria', 'John', 'Emma', 'Pierre');
DELETE FROM contact_type WHERE type_code IN ('EMAIL', 'PHONE', 'MOBILE', 'ADDRESS');
DELETE FROM document_type WHERE type_code IN ('CC', 'PASSPORT', 'CE', 'NIT', 'DNI');
DELETE FROM person_type WHERE type_code IN ('NATURAL', 'LEGAL', 'FOREIGN');