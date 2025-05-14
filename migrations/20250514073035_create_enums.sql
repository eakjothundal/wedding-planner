-- +goose Up
-- +goose StatementBegin
CREATE TYPE rsvp_status AS ENUM ('pending', 'accepted', 'declined');
CREATE TYPE invite_type  AS ENUM ('individual', 'group');
CREATE TYPE role_type    AS ENUM ('partner', 'admin');         -- feel free to expand
CREATE TYPE paid_status  AS ENUM ('pending', 'deposit_paid', 'paid_in_full');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TYPE IF EXISTS paid_status;
DROP TYPE IF EXISTS role_type;
DROP TYPE IF EXISTS invite_type;
DROP TYPE IF EXISTS rsvp_status;
-- +goose StatementEnd