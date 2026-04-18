-- ============================================
-- DML - ROLE PERMISSIONS
-- ============================================

-- ROLE_ADMIN - all permissions
INSERT INTO role_permission (security_role_id, security_permission_id)
SELECT sr.security_role_id, sp.security_permission_id
FROM security_role sr, security_permission sp
WHERE sr.role_code = 'ROLE_ADMIN';

-- ROLE_AGENT - reservation and boarding permissions
INSERT INTO role_permission (security_role_id, security_permission_id)
SELECT sr.security_role_id, sp.security_permission_id
FROM security_role sr, security_permission sp
WHERE sr.role_code = 'ROLE_AGENT'
AND sp.permission_code IN (
    'RES_CREATE', 'RES_UPDATE', 'RES_VIEW', 'RES_CANCEL',
    'BRD_CHECKIN', 'BRD_VALIDATE', 'BRD_VIEW',
    'FLT_VIEW', 'ACF_VIEW'
);

-- ROLE_FINANCE - payment and billing permissions
INSERT INTO role_permission (security_role_id, security_permission_id)
SELECT sr.security_role_id, sp.security_permission_id
FROM security_role sr, security_permission sp
WHERE sr.role_code = 'ROLE_FINANCE'
AND sp.permission_code IN (
    'PAY_CREATE', 'PAY_UPDATE', 'PAY_VIEW', 'PAY_REFUND',
    'INV_CREATE', 'INV_UPDATE', 'INV_VIEW',
    'RES_VIEW'
);

-- ROLE_OPS - flight operations permissions
INSERT INTO role_permission (security_role_id, security_permission_id)
SELECT sr.security_role_id, sp.security_permission_id
FROM security_role sr, security_permission sp
WHERE sr.role_code = 'ROLE_OPS'
AND sp.permission_code IN (
    'FLT_CREATE', 'FLT_UPDATE', 'FLT_VIEW',
    'ACF_CREATE', 'ACF_UPDATE', 'ACF_VIEW',
    'BRD_VIEW'
);

-- ROLE_READONLY - view only permissions
INSERT INTO role_permission (security_role_id, security_permission_id)
SELECT sr.security_role_id, sp.security_permission_id
FROM security_role sr, security_permission sp
WHERE sr.role_code = 'ROLE_READONLY'
AND sp.permission_code IN (
    'RES_VIEW', 'FLT_VIEW', 'PAY_VIEW',
    'BRD_VIEW', 'ACF_VIEW', 'INV_VIEW'
);