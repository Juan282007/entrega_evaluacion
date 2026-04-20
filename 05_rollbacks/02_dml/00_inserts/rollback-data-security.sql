-- ============================================
-- ROLLBACK TEST DATA - SECURITY
-- ============================================

DELETE FROM user_role WHERE user_account_id IN (SELECT user_account_id FROM user_account WHERE username IN ('carlos.ramirez', 'maria.lopez', 'john.smith', 'emma.wilson', 'pierre.dupont'));
DELETE FROM user_account WHERE username IN ('carlos.ramirez', 'maria.lopez', 'john.smith', 'emma.wilson', 'pierre.dupont');
DELETE FROM user_status WHERE status_code IN ('ACTIVE', 'INACTIVE', 'BLOCKED', 'PENDING');