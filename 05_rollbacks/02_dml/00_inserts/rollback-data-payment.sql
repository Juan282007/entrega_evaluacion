-- ============================================
-- ROLLBACK TEST DATA - PAYMENT
-- ============================================

DELETE FROM invoice_line WHERE invoice_id IN (SELECT invoice_id FROM invoice WHERE invoice_number IN ('INV-001', 'INV-002'));
DELETE FROM invoice WHERE invoice_number IN ('INV-001', 'INV-002');
DELETE FROM tax WHERE tax_code IN ('IVA_19', 'IVA_5', 'VAT_20');
DELETE FROM invoice_status WHERE status_code IN ('DRAFT', 'ISSUED', 'PAID', 'CANCELLED');
DELETE FROM payment_transaction WHERE transaction_reference IN ('TXN-001', 'TXN-002');
DELETE FROM payment WHERE payment_reference IN ('PAY-REF-001', 'PAY-REF-002');
DELETE FROM payment_method WHERE method_code IN ('CREDIT_CARD', 'DEBIT_CARD', 'BANK_TRANSFER', 'CASH');
DELETE FROM payment_status WHERE status_code IN ('PENDING', 'AUTHORIZED', 'CAPTURED', 'FAILED', 'REFUNDED');