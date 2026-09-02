--liquibase formatted sql
--changeset shadowfrog:creating_event

CREATE TABLE event(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
start_date TIMESTAMP NOT NULL,
duration TIMESTAMP,
repeat_type VARCHAR(32),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL
)