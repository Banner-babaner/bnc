--liquibase formatted sql
--changeset shadowfrog:creating_inventory_stage

CREATE TABLE inventory_stage(
id BIGINT PRIMARY KEY,
slots_allowed INTEGER NOT NULL,
cost BIGINT NOT NULL DEFAULT 0,
CONSTRAINT chk_slots_allowed CHECK(slots_allowed > 0)
);