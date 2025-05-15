-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS vendors (
    id BIGSERIAL PRIMARY KEY,
    wedding_id BIGINT NOT NULL REFERENCES weddings(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    category TEXT,                          -- e.g. 'caterer', 'photographer'
    email TEXT,
    phone TEXT,
    website TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (wedding_id, name)
);

CREATE INDEX IF NOT EXISTS idx_vendors_wedding_id ON vendors(wedding_id);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS vendors;
-- +goose StatementEnd