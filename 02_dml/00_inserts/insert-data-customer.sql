-- ============================================
-- TEST DATA - CUSTOMER AND LOYALTY
-- ============================================

-- customer_category
INSERT INTO customer_category (category_code, category_name) VALUES
('STANDARD', 'Standard'),
('PREMIUM', 'Premium'),
('VIP', 'VIP');

-- benefit_type
INSERT INTO benefit_type (benefit_code, benefit_name, benefit_description) VALUES
('EXTRA_BAGGAGE', 'Extra Baggage', 'Additional baggage allowance'),
('LOUNGE_ACCESS', 'Lounge Access', 'Access to airport lounges'),
('PRIORITY_BOARDING', 'Priority Boarding', 'Priority boarding access'),
('SEAT_UPGRADE', 'Seat Upgrade', 'Free seat upgrade when available');

-- loyalty_program
INSERT INTO loyalty_program (airline_id, default_currency_id, program_code, program_name, expiration_months) VALUES
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'COP'), 'AV_LIFEMILES', 'LifeMiles', 24),
((SELECT airline_id FROM airline WHERE airline_code = 'AA'), (SELECT currency_id FROM currency WHERE iso_currency_code = 'USD'), 'AA_ADVANTAGE', 'AAdvantage', 18);

-- loyalty_tier
INSERT INTO loyalty_tier (loyalty_program_id, tier_code, tier_name, priority_level, required_miles) VALUES
((SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AV_LIFEMILES'), 'SILVER', 'Silver', 1, 0),
((SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AV_LIFEMILES'), 'GOLD', 'Gold', 2, 25000),
((SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AV_LIFEMILES'), 'PLATINUM', 'Platinum', 3, 50000),
((SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AA_ADVANTAGE'), 'GOLD', 'Gold', 1, 0),
((SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AA_ADVANTAGE'), 'PLATINUM', 'Platinum', 2, 30000);

-- customer
INSERT INTO customer (airline_id, person_id, customer_category_id) VALUES
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez'), (SELECT customer_category_id FROM customer_category WHERE category_code = 'VIP')),
((SELECT airline_id FROM airline WHERE airline_code = 'AV'), (SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez'), (SELECT customer_category_id FROM customer_category WHERE category_code = 'PREMIUM')),
((SELECT airline_id FROM airline WHERE airline_code = 'AA'), (SELECT person_id FROM person WHERE first_name = 'John' AND last_name = 'Smith'), (SELECT customer_category_id FROM customer_category WHERE category_code = 'STANDARD'));

-- loyalty_account
INSERT INTO loyalty_account (customer_id, loyalty_program_id, account_number) VALUES
((SELECT customer_id FROM customer WHERE person_id = (SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez')), (SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AV_LIFEMILES'), 'LM-0001'),
((SELECT customer_id FROM customer WHERE person_id = (SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez')), (SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AV_LIFEMILES'), 'LM-0002'),
((SELECT customer_id FROM customer WHERE person_id = (SELECT person_id FROM person WHERE first_name = 'John' AND last_name = 'Smith')), (SELECT loyalty_program_id FROM loyalty_program WHERE program_code = 'AA_ADVANTAGE'), 'AA-0001');