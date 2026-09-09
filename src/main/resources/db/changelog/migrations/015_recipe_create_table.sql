--liquibase formatted sql

--changeset shadowfrog:creating_recipe
CREATE TABLE recipe(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL,
input_items JSONB NOT NULL DEFAULT '[]'::JSONB,
input_categories JSONB NOT NULL DEFAULT '[]'::JSONB,
output_items JSONB NOT NULL DEFAULT '[]'::JSONB,
output_bonus_items JSONB NOT NULL DEFAULT '[]'::JSONB,
CONSTRAINT chk_recipe_output_bonus_items CHECK(JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
        "items":{
            "type":"object",
            "properties":{
                "item_id":{"type":"number"},
                "chance": {"type":"number", "min":1, "max":100},
                "max_count": {"type":"number", "min":1}
            },
            "required":["item_id", "chance", "max_count"]
        }
    }'::JSON,
output_bonus_items
)),
CONSTRAINT chk_recipe_output_items CHECK(JSONB_MATCHES_SCHEMA(
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
output_items
)),
CONSTRAINT chk_recipe_input_items CHECK(JSONB_MATCHES_SCHEMA(
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
input_items
)),
CONSTRAINT chk_recipe_input_categories CHECK(JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
        "items":{
            "type":"object",
            "properties":{
                "category_id":{"type":"number"},
                "count": {"type":"number", "min":1}
            },
            "required":["category_id", "count"]
        }
    }'::JSON,
input_categories
))
);
