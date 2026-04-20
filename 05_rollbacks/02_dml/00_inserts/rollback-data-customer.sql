-- ============================================
-- ROLLBACK TEST DATA - CUSTOMER
-- ============================================

DELETE FROM loyalty_account WHERE account_number IN ('LM-0001', 'LM-0002', 'AA-0001');
DELETE FROM customer WHERE person_id IN (SELECT person_id FROM person WHERE first_name IN ('Carlos', 'Maria', 'John'));
DELETE FROM loyalty_tier WHERE tier_code IN ('SILVER', 'GOLD', 'PLATINUM') AND loyalty_program_id IN (SELECT loyalty_program_id FROM loyalty_program WHERE program_code IN ('AV_LIFEMILES', 'AA_ADVANTAGE'));
DELETE FROM loyalty_program WHERE program_code IN ('AV_LIFEMILES', 'AA_ADVANTAGE');
DELETE FROM benefit_type WHERE benefit_code IN ('EXTRA_BAGGAGE', 'LOUNGE_ACCESS', 'PRIORITY_BOARDING', 'SEAT_UPGRADE');
DELETE FROM customer_category WHERE category_code IN ('STANDARD', 'PREMIUM', 'VIP');