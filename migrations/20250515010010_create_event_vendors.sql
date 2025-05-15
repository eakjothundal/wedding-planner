-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS event_vendors (
    id BIGSERIAL PRIMARY KEY,
    event_id  BIGINT NOT NULL REFERENCES events(id)  ON DELETE CASCADE,
    vendor_id BIGINT NOT NULL REFERENCES vendors(id) ON DELETE CASCADE,
    fee_amount NUMERIC(10,2),
    paid_status paid_status NOT NULL DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (event_id, vendor_id)
);

CREATE INDEX IF NOT EXISTS idx_event_vendors_event_id  ON event_vendors(event_id);
CREATE INDEX IF NOT EXISTS idx_event_vendors_vendor_id ON event_vendors(vendor_id);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS event_vendors;
-- +goose StatementEnd