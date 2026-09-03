--liquibase formatted sql
--changeset shadowfrog:creating_item


--На данный момент предполагается, что валидация JSON будет проверяться на уровне приложения
CREATE TABLE item(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
max_count BIGINT NOT NULL DEFAULT 64 CHECK(max_count > 0),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL,
product_input_items JSONB NOT NULL DEFAULT '[]'::JSONB,
product_input_categories JSONB NOT NULL DEFAULT '[]'::JSONB,
product_output_items JSONB NOT NULL DEFAULT '[]'::JSONB,
product_output_bonus_items JSONB NOT NULL DEFAULT '[]'::JSONB)
