--liquibase formatted sql
--changeset shadowfrog:creating_pg_jsonschema_extension

CREATE EXTENSION IF NOT EXISTS pg_jsonschema;