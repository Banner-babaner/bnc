--liquibase formatted sql
--changeset shadowfrog:creating_item_advertisement_offer

CREATE TABLE item_advertisement_offer(
id BIGSERIAL PRIMARY KEY,
name VARCHAR(64) UNIQUE NOT NULL,
description VARCHAR(512),
image_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
event_id BIGINT REFERENCES event(id) ON DELETE SET NULL,
item_id BIGINT REFERENCES item(id) ON DELETE CASCADE,
reward_count BIGINT NOT NULL DEFAULT 1,
CONSTRAINT chk_item_reward_count CHECK(reward_count>0)
);