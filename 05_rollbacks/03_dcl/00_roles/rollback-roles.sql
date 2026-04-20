-- ============================================
-- ROLLBACK DCL - ROLES AND PERMISSIONS
-- ============================================

-- Revoke permissions
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM role_admin;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM role_admin;

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM role_agent;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM role_finance;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM role_ops;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM role_readonly;

-- Drop roles
DROP ROLE IF EXISTS role_admin;
DROP ROLE IF EXISTS role_agent;
DROP ROLE IF EXISTS role_finance;
DROP ROLE IF EXISTS role_ops;
DROP ROLE IF EXISTS role_readonly;