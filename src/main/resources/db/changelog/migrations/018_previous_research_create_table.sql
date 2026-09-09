--liquibase formatted sql
--changeset shadowfrog:creating_previous_research

CREATE TABLE previous_research(
target_research_id BIGINT NOT NULL REFERENCES research(id) ON DELETE CASCADE,
previous_research_id BIGINT NOT NULL REFERENCES research(id) ON DELETE CASCADE,
PRIMARY KEY (target_research_id, previous_research_id)
);