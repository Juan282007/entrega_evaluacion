-- ============================================
-- ROLLBACK DML - SECURITY ROLES
-- ============================================

DELETE FROM security_role WHERE role_code IN (
    'ROLE_ADMIN',
    'ROLE_AGENT',
    'ROLE_FINANCE',
    'ROLE_OPS',
    'ROLE_READONLY'
);