--liquibase formatted sql
--changeset shadowfrog:creating_item_category

CREATE TABLE item_category(
item_id BIGINT REFERENCES item(id),
category_id BIGINT REFERENCES category(id),
PRIMARY KEY (item_id, category_id)
)