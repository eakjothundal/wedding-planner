-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS guest_groups (
    id BIGSERIAL PRIMARY KEY,
    wedding_id BIGINT NOT NULL REFERENCES weddings(id) ON DELETE CASCADE,
    group_name TEXT NOT NULL,
    invite_type VARCHAR(20) NOT NULL DEFAULT 'individual',
    invite_email TEXT,
    invite_address TEXT,
    invite_phone TEXT,
    rsvp_status varchar(20) NOT NULL DEFAULT 'pending',
    rsvp_updated_at TIMESTAMPTZ,
    invited_by BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS guest_groups;

-- +goose StatementEnd