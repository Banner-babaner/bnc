--liquibase formatted sql
--changeset shadowfrog:creating_app_user

CREATE TABLE app_user(
id BIGSERIAL PRIMARY KEY,
uid UUID UNIQUE NOT NULL,
nickname VARCHAR(32) UNIQUE NOT NULL,
avatar_id BIGINT REFERENCES image_info(id) ON DELETE SET NULL,
login VARCHAR(32) UNIQUE NOT NULL,
password VARCHAR(128) NOT NULL,
email VARCHAR(64) UNIQUE,
role VARCHAR(64) NOT NULL DEFAULT 'USER',
enable BOOLEAN NOT NULL DEFAULT true,
seed BIGINT NOT NULL,
max_chain_count INTEGER NOT NULL DEFAULT 1
);