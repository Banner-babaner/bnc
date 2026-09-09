--liquibase formatted sql
--changeset shadowfrog:creating_production_chain_knot_source

CREATE TABLE production_chain_knot_source(
source_knot_id BIGINT NOT NULL REFERENCES production_chain_knot(id) ON DELETE CASCADE,
target_knot_id BIGINT NOT NULL REFERENCES production_chain_knot(id) ON DELETE CASCADE,
reducing_item_id BIGINT NOT NULL REFERENCES item(id) ON DELETE CASCADE,
reducing_count BIGINT NOT NULL,
PRIMARY KEY(source_knot_id, target_knot_id, reducing_item_id)
);