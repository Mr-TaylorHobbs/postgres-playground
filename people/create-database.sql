psql


CREATE DATABASE people;
\c people
CREATE EXTENSION pgtap;

CREATE TABLE job (
    id SERIAL PRIMARY KEY,
    name text UNIQUE
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    job TEXT REFERENCES job(name)
);
