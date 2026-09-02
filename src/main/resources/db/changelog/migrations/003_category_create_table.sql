--liquibase formatted sql
--changeset shadowfrog:creating_category

CREATE TABLE category(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL
)