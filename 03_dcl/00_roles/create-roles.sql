-- ============================================
-- DCL - ROLES AND PERMISSIONS
-- ============================================

-- Create roles
CREATE ROLE role_admin;
CREATE ROLE role_agent;
CREATE ROLE role_finance;
CREATE ROLE role_ops;
CREATE ROLE role_readonly;

-- ROLE_ADMIN - full access
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO role_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO role_admin;

-- ROLE_AGENT - reservations and check-in
GRANT SELECT, INSERT, UPDATE ON
    reservation,
    reservation_passenger,
    sale,
    ticket,
    ticket_segment,
    seat_assignment,
    check_in,
    boarding_pass,
    boarding_validation,
    baggage
TO role_agent;
GRANT SELECT ON
    flight,
    flight_segment,
    aircraft,
    aircraft_seat,
    airport,
    customer,
    person
TO role_agent;

-- ROLE_FINANCE - payments and billing
GRANT SELECT, INSERT, UPDATE ON
    payment,
    payment_transaction,
    refund,
    invoice,
    invoice_line
TO role_finance;
GRANT SELECT ON
    sale,
    currency,
    exchange_rate,
    tax
TO role_finance;

-- ROLE_OPS - flight operations
GRANT SELECT, INSERT, UPDATE ON
    flight,
    flight_segment,
    flight_delay,
    aircraft,
    aircraft_cabin,
    aircraft_seat,
    maintenance_event
TO role_ops;
GRANT SELECT ON
    airport,
    runway,
    terminal,
    boarding_gate
TO role_ops;

-- ROLE_READONLY - read only
GRANT SELECT ON ALL TABLES IN SCHEMA public TO role_readonly;