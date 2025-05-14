-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS events (
    id BIGSERIAL PRIMARY KEY,
    wedding_id BIGINT NOT NULL REFERENCES weddings(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    event_date TIMESTAMPTZ,
    venue_name TEXT,
    venue_address TEXT,
    dress_code TEXT,
    created_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS events;

-- +goose StatementEnd