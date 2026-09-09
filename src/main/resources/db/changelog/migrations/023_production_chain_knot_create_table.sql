--liquibase formatted sql
--changeset shadowfrog:creating_production_chain_knot

CREATE TABLE production_chain_knot(
id BIGSERIAL PRIMARY KEY,
chain_id BIGINT NOT NULL REFERENCES production_chain(id) ON DELETE CASCADE,
producer_id BIGINT NOT NULL REFERENCES item(id) ON DELETE CASCADE
);