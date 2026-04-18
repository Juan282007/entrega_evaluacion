-- ============================================
-- DML - SECURITY PERMISSIONS
-- ============================================

INSERT INTO security_permission (permission_code, permission_name, permission_description) VALUES
-- Reservation permissions
('RES_CREATE', 'Create Reservation', 'Allows creating new reservations'),
('RES_UPDATE', 'Update Reservation', 'Allows updating existing reservations'),
('RES_VIEW', 'View Reservation', 'Allows viewing reservations'),
('RES_CANCEL', 'Cancel Reservation', 'Allows cancelling reservations'),

-- Flight permissions
('FLT_CREATE', 'Create Flight', 'Allows creating new flights'),
('FLT_UPDATE', 'Update Flight', 'Allows updating flight information'),
('FLT_VIEW', 'View Flight', 'Allows viewing flight information'),

-- Payment permissions
('PAY_CREATE', 'Create Payment', 'Allows processing payments'),
('PAY_UPDATE', 'Update Payment', 'Allows updating payment information'),
('PAY_VIEW', 'View Payment', 'Allows viewing payment information'),
('PAY_REFUND', 'Process Refund', 'Allows processing refunds'),

-- Boarding permissions
('BRD_CHECKIN', 'Process Check-in', 'Allows processing passenger check-in'),
('BRD_VALIDATE', 'Validate Boarding', 'Allows validating boarding passes'),
('BRD_VIEW', 'View Boarding', 'Allows viewing boarding information'),

-- Aircraft permissions
('ACF_CREATE', 'Create Aircraft', 'Allows creating aircraft records'),
('ACF_UPDATE', 'Update Aircraft', 'Allows updating aircraft information'),
('ACF_VIEW', 'View Aircraft', 'Allows viewing aircraft information'),

-- Invoice permissions
('INV_CREATE', 'Create Invoice', 'Allows creating invoices'),
('INV_UPDATE', 'Update Invoice', 'Allows updating invoices'),
('INV_VIEW', 'View Invoice', 'Allows viewing invoices'),

-- Admin permissions
('ADM_USERS', 'Manage Users', 'Allows managing user accounts'),
('ADM_ROLES', 'Manage Roles', 'Allows managing roles and permissions'),
('ADM_CONFIG', 'System Configuration', 'Allows system configuration');