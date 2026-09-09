--liquibase formatted sql
--changeset shadowfrog:creating_recipe_research

CREATE TABLE recipe_research(
recipe_id BIGINT NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
research_id BIGINT NOT NULL REFERENCES research(id) ON DELETE CASCADE,
PRIMARY KEY(recipe_id, research_id)
);