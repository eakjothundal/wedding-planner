-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS users (
    id            BIGSERIAL    PRIMARY KEY,
    firebase_uid  TEXT         UNIQUE NOT NULL,
    email         TEXT         NOT NULL,
    first_name    TEXT         NOT NULL,
    last_name     TEXT         NOT NULL,
    role          VARCHAR(20)  NOT NULL DEFAULT 'partner',
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS users;

-- +goose StatementEnd