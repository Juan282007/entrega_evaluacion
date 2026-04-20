-- ============================================
-- ROLLBACK DML - ROLE PERMISSIONS
-- ============================================

DELETE FROM role_permission
WHERE security_role_id IN (
    SELECT security_role_id FROM security_role
    WHERE role_code IN (
        'ROLE_ADMIN',
        'ROLE_AGENT',
        'ROLE_FINANCE',
        'ROLE_OPS',
        'ROLE_READONLY'
    )
);