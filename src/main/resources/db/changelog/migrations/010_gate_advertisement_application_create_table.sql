--liquibase formatted sql
--changeset shadowfrog:creating_gate_advertisement_application

CREATE TABLE gate_advertisement_application(
id BIGSERIAL PRIMARY KEY,
offer_id BIGINT REFERENCES gate_advertisement_offer ON DELETE CASCADE,
secret_key VARCHAR(64) UNIQUE NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ttl TIMESTAMP NOT NULL,
status VARCHAR(24)
);