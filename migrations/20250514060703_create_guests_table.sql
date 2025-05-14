-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS guests (
    id BIGSERIAL PRIMARY KEY,
    guest_group_id BIGINT NOT NULL REFERENCES guest_groups(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    relation TEXT,
    rsvp_status varchar(20) NOT NULL DEFAULT 'pending',
    rsvp_updated_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS guests;

-- +goose StatementEnd