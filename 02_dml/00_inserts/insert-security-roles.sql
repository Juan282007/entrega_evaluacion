-- ============================================
-- DML - SECURITY ROLES
-- ============================================

INSERT INTO security_role (role_code, role_name, role_description) VALUES
('ROLE_ADMIN', 'Administrator', 'Full access to all system modules'),
('ROLE_AGENT', 'Sales Agent', 'Access to reservations, check-in and boarding'),
('ROLE_FINANCE', 'Finance', 'Access to payments, billing and invoicing'),
('ROLE_OPS', 'Operations', 'Access to flight operations and aircraft management'),
('ROLE_READONLY', 'Read Only', 'Read-only access to all system data');