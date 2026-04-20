-- ============================================
-- TEST DATA - PAYMENT
-- ============================================

-- payment_status
INSERT INTO payment_status (status_code, status_name) VALUES
('PENDING', 'Pending'),
('AUTHORIZED', 'Authorized'),
('CAPTURED', 'Captured'),
('FAILED', 'Failed'),
('REFUNDED', 'Refunded');

-- payment_method
INSERT INTO payment_method (method_code, method_name) VALUES
('CREDIT_CARD', 'Credit Card'),
('DEBIT_CARD', 'Debit Card'),
('BANK_TRANSFER', 'Bank Transfer'),
('CASH', 'Cash');

-- payment
INSERT INTO payment (sale_id, payment_status_id, payment_method_id, currency_id, payment_reference, amount, authorized_at) VALUES
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-001'), (SELECT payment_status_id FROM payment_status WHERE status_code = 'CAPTURED'), (SELECT payment_method_id FROM payment_method WHERE method_code = 'CREDIT_CARD'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'COP'), 'PAY-REF-001', 250000.00, '2026-04-01 10:06:00-05'),
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-002'), (SELECT payment_status_id FROM payment_status WHERE status_code = 'CAPTURED'), (SELECT payment_method_id FROM payment_method WHERE method_code = 'CREDIT_CARD'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'PAY-REF-002', 450.00, '2026-04-02 11:06:00-05');

-- payment_transaction
INSERT INTO payment_transaction (payment_id, transaction_reference, transaction_type, transaction_amount, processed_at) VALUES
((SELECT payment_id FROM payment WHERE payment_reference = 'PAY-REF-001'), 'TXN-001', 'CAPTURE', 250000.00, '2026-04-01 10:07:00-05'),
((SELECT payment_id FROM payment WHERE payment_reference = 'PAY-REF-002'), 'TXN-002', 'CAPTURE', 450.00, '2026-04-02 11:07:00-05');

-- invoice_status
INSERT INTO invoice_status (status_code, status_name) VALUES
('DRAFT', 'Draft'),
('ISSUED', 'Issued'),
('PAID', 'Paid'),
('CANCELLED', 'Cancelled');

-- tax
INSERT INTO tax (tax_code, tax_name, rate_percentage, effective_from) VALUES
('IVA_19', 'IVA 19%', 19.000, '2017-01-01'),
('IVA_5', 'IVA 5%', 5.000, '2017-01-01'),
('VAT_20', 'VAT 20%', 20.000, '2011-01-04');

-- invoice
INSERT INTO invoice (sale_id, invoice_status_id, currency_id, invoice_number, issued_at) VALUES
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-001'), (SELECT invoice_status_id FROM invoice_status WHERE status_code = 'ISSUED'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'COP'), 'INV-001', '2026-04-01 10:15:00-05'),
((SELECT sale_id FROM sale WHERE sale_code = 'SALE-002'), (SELECT invoice_status_id FROM invoice_status WHERE status_code = 'ISSUED'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'INV-002', '2026-04-02 11:15:00-05');

-- invoice_line
INSERT INTO invoice_line (invoice_id, tax_id, line_number, line_description, quantity, unit_price) VALUES
((SELECT invoice_id FROM invoice WHERE invoice_number = 'INV-001'), (SELECT tax_id FROM tax WHERE tax_code = 'IVA_19'), 1, 'Economy Basic BOG-MDE', 1.00, 250000.00),
((SELECT invoice_id FROM invoice WHERE invoice_number = 'INV-002'), NULL, 1, 'Economy Flex BOG-JFK', 1.00, 450.00);