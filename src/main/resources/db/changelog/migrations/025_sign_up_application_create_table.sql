--liquibase formatted sql
--changeset shadowfrog:creating_sign_up_application

CREATE TABLE sign_up_application(
id BIGSERIAL PRIMARY KEY,
email VARCHAR(64) UNIQUE,
secret_key VARCHAR(32) UNIQUE NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ttl TIMESTAMP NOT NULL,
status VARCHAR(32)
);