-- ============================================
-- NOTIFICATIONS AND COMMUNICATIONS
-- ============================================

CREATE TABLE notification_type (
    notification_type_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    type_code varchar(30) NOT NULL,
    type_name varchar(100) NOT NULL,
    type_description text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_type_code UNIQUE (type_code),
    CONSTRAINT uq_notification_type_name UNIQUE (type_name)
);

CREATE TABLE notification_channel (
    notification_channel_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    channel_code varchar(20) NOT NULL,
    channel_name varchar(80) NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_channel_code UNIQUE (channel_code),
    CONSTRAINT uq_notification_channel_name UNIQUE (channel_name)
);

CREATE TABLE notification_template (
    notification_template_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_type_id uuid NOT NULL REFERENCES notification_type(notification_type_id),
    notification_channel_id uuid NOT NULL REFERENCES notification_channel(notification_channel_id),
    template_code varchar(30) NOT NULL,
    template_subject varchar(200),
    template_body text NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_template_code UNIQUE (template_code),
    CONSTRAINT uq_notification_template UNIQUE (notification_type_id, notification_channel_id)
);

CREATE TABLE notification_log (
    notification_log_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_type_id uuid NOT NULL REFERENCES notification_type(notification_type_id),
    notification_channel_id uuid NOT NULL REFERENCES notification_channel(notification_channel_id),
    reservation_passenger_id uuid REFERENCES reservation_passenger(reservation_passenger_id),
    flight_segment_id uuid REFERENCES flight_segment(flight_segment_id),
    sent_at timestamptz NOT NULL DEFAULT now(),
    status_code varchar(20) NOT NULL,
    recipient_address varchar(200) NOT NULL,
    notes text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_notification_log_status CHECK (status_code IN ('SENT', 'DELIVERED', 'FAILED', 'PENDING'))
);