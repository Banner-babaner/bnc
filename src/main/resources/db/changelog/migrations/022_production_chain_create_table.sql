--liquibase formatted sql
--changeset shadowfrog:creating_production_chain

CREATE TABLE production_chain(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(32) NOT NULL DEFAULT '',
total BIGINT NOT NULL DEFAULT 0,
enabled BOOLEAN NOT NULL DEFAULT false,
user_id BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE);