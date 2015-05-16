psql


CREATE DATABASE people;
\c people
CREATE EXTENSION pgtap;

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
)
