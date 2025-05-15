-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS event_guests (
    id BIGSERIAL PRIMARY KEY,
    event_id  BIGINT NOT NULL REFERENCES events(id)  ON DELETE CASCADE,
    guest_id  BIGINT NOT NULL REFERENCES guests(id)  ON DELETE CASCADE,
    rsvp_status rsvp_status NOT NULL DEFAULT 'pending',
    seat_number INT,
    note TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (event_id, guest_id)
);

-- FK indexes
CREATE INDEX IF NOT EXISTS idx_event_guests_event_id  ON event_guests(event_id);
CREATE INDEX IF NOT EXISTS idx_event_guests_guest_id  ON event_guests(guest_id);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS event_guests;
-- +goose StatementEnd