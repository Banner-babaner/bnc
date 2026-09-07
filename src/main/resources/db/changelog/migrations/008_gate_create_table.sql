--liquibase formatted sql

--changeset shadowfrog:creating_gate
CREATE TABLE gate(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL,
max_position_count SMALLINT NOT NULL CHECK(max_position_count>0),
output_items JSONB NOT NULL DEFAULT '[]'::JSONB,
CONSTRAINT chk_gate_output_items CHECK(JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
        "items":{
            "type":"object",
            "properties":{
                "item_id":{"type":"number"},
                "weight": {"type":"number", "min":1},
                "count": {"type":"number", "min":1}
            },
            "required":["item_id", "weight", "count"]
        }
    }'::JSON,
output_items
))
);
