CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE app_schema_version (
    id integer PRIMARY KEY,
    installed_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO app_schema_version (id) VALUES (1);
