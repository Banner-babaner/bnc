--liquibase formatted sql
--changeset shadowfrog:creating_gate_sale_offer

CREATE TABLE gate_sale_offer(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL,
gate_id BIGINT REFERENCES gate(id) ON DELETE CASCADE,
sale_count BIGINT NOT NULL DEFAULT 1,
required_items JSONB NOT NULL DEFAULT '[]',
CONSTRAINT chk_gate_sale_count CHECK(sale_count>0),
CONSTRAINT chk_gate_sale_required_items CHECK(JSONB_MATCHES_SCHEMA(
'{
"type":"array",
    "items":{
        "type":"object",
        "properties":{
            "item_id":{"type":"number"},
            "count":{"type":"number", "min":1}
        },
        "required":["item_id", "count"]
    }
}'::JSON,
required_items))
);