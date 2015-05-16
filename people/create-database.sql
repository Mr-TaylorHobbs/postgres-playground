psql


CREATE DATABASE people;
\c people
CREATE EXTENSION pgtap;

CREATE TABLE job (
    name text PRIMARY KEY
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    job TEXT REFERENCES job(name)
);
