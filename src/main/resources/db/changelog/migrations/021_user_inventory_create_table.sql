--liquibase formatted sql
--changeset shadowfrog:creating_user_inventory

CREATE TABLE user_inventory(
user_id BIGINT PRIMARY KEY REFERENCES app_user(id) ON DELETE CASCADE,
inventory_stage_id BIGINT NOT NULL REFERENCES inventory_stage(id) ON DELETE NO ACTION,
slots JSONB NOT NULL DEFAULT '[]'::JSONB,
CONSTRAINT chk_user_inventory_slots CHECK(JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
        "items":{
            "type":"object",
            "properties":{
                "item_id":{"type":"number"},
                "count": {"type":"number", "min":1}
            },
            "required":["item_id", "count"]
        }
    }'::JSON,
slots
))
);