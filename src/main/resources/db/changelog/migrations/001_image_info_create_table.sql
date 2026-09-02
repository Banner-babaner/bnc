--liquibase formatted sql
--changeset shadowfrog:creating_image_info

CREATE TABLE image_info(
id BIGSERIAL PRIMARY KEY,
internal_src VARCHAR(64) UNIQUE
)