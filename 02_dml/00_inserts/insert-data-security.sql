-- ============================================
-- TEST DATA - SECURITY
-- ============================================

-- user_status
INSERT INTO user_status (status_code, status_name) VALUES
('ACTIVE', 'Active'),
('INACTIVE', 'Inactive'),
('BLOCKED', 'Blocked'),
('PENDING', 'Pending Activation');

-- user_account
INSERT INTO user_account (person_id, user_status_id, username, password_hash) VALUES
((SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Ramirez'), (SELECT user_status_id FROM user_status WHERE status_code = 'ACTIVE'), 'carlos.ramirez', crypt('password123', gen_salt('bf'))),
((SELECT person_id FROM person WHERE first_name = 'Maria' AND last_name = 'Lopez'), (SELECT user_status_id FROM user_status WHERE status_code = 'ACTIVE'), 'maria.lopez', crypt('password123', gen_salt('bf'))),
((SELECT person_id FROM person WHERE first_name = 'John' AND last_name = 'Smith'), (SELECT user_status_id FROM user_status WHERE status_code = 'ACTIVE'), 'john.smith', crypt('password123', gen_salt('bf'))),
((SELECT person_id FROM person WHERE first_name = 'Emma' AND last_name = 'Wilson'), (SELECT user_status_id FROM user_status WHERE status_code = 'ACTIVE'), 'emma.wilson', crypt('password123', gen_salt('bf'))),
((SELECT person_id FROM person WHERE first_name = 'Pierre' AND last_name = 'Dupont'), (SELECT user_status_id FROM user_status WHERE status_code = 'ACTIVE'), 'pierre.dupont', crypt('password123', gen_salt('bf')));

-- user_role
INSERT INTO user_role (user_account_id, security_role_id) VALUES
((SELECT user_account_id FROM user_account WHERE username = 'carlos.ramirez'), (SELECT security_role_id FROM security_role WHERE role_code = 'ROLE_ADMIN')),
((SELECT user_account_id FROM user_account WHERE username = 'maria.lopez'), (SELECT security_role_id FROM security_role WHERE role_code = 'ROLE_AGENT')),
((SELECT user_account_id FROM user_account WHERE username = 'john.smith'), (SELECT security_role_id FROM security_role WHERE role_code = 'ROLE_FINANCE')),
((SELECT user_account_id FROM user_account WHERE username = 'emma.wilson'), (SELECT security_role_id FROM security_role WHERE role_code = 'ROLE_OPS')),
((SELECT user_account_id FROM user_account WHERE username = 'pierre.dupont'), (SELECT security_role_id FROM security_role WHERE role_code = 'ROLE_READONLY'));