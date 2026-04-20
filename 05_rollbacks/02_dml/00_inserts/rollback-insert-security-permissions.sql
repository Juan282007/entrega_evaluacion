-- ============================================
-- ROLLBACK DML - SECURITY PERMISSIONS
-- ============================================

DELETE FROM security_permission WHERE permission_code IN (
    'RES_CREATE', 'RES_UPDATE', 'RES_VIEW', 'RES_CANCEL',
    'FLT_CREATE', 'FLT_UPDATE', 'FLT_VIEW',
    'PAY_CREATE', 'PAY_UPDATE', 'PAY_VIEW', 'PAY_REFUND',
    'BRD_CHECKIN', 'BRD_VALIDATE', 'BRD_VIEW',
    'ACF_CREATE', 'ACF_UPDATE', 'ACF_VIEW',
    'INV_CREATE', 'INV_UPDATE', 'INV_VIEW',
    'ADM_USERS', 'ADM_ROLES', 'ADM_CONFIG'
);