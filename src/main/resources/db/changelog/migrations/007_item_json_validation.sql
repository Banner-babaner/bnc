--liquibase formatted sql
--changeset shadowfrog:validating_product_input_items

ALTER TABLE item ADD CONSTRAINT chk_product_input_items
CHECK (JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
    "items": {
        "type":"object",
        "properties":{
            "item_id": {"type":"number"},
            "count": {"type":"number", "minimum":1}
        },
        "required": ["item_id", "count"]
    }
}'::JSON
,product_input_items));

--changeset shadowfrog:validating_product_input_categories
ALTER TABLE item ADD CONSTRAINT chk_product_input_categories
CHECK (JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
    "items": {
        "type":"object",
        "properties":{
            "category_id": {"type":"number"},
            "count": {"type":"number", "minimum":1}
        },
        "required": ["category_id", "count"]
    }
}'::JSON
,product_input_categories));

--changeset shadowfrog:validating_product_output_items
ALTER TABLE item ADD CONSTRAINT chk_product_output_items
CHECK (JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
    "items": {
        "type":"object",
        "properties":{
            "item_id": {"type":"number"},
            "count": {"type":"number", "minimum":1}
        },
        "required": ["item_id", "count"]
    }
}'::JSON
,product_output_items));

--changeset shadowfrog:validating_product_output_bonus_items
ALTER TABLE item ADD CONSTRAINT chk_product_output_bonus_items
CHECK (JSONB_MATCHES_SCHEMA(
'{
    "type":"array",
    "items": {
        "type":"object",
        "properties":{
            "item_id": {"type":"number"},
            "max_count": {"type":"number", "minimum":1},
            "chance": {"type":"number", "minimum":1, "maximum":100}
        },
        "required": ["item_id", "count", "chance"]
    }
}'::JSON
,product_output_bonus_items));