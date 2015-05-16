psql -d people

INSERT INTO person (first_name, last_name)
    VALUES ('John', 'Smith')
           , ('Jane', 'Doe');

BEGIN;
    SELECT plan(2);

    PREPARE multiple_have AS SELECT first_name, last_name
                             FROM person;
    PREPARE multiple_want AS VALUES ('John', 'Smith'), ('Jane', 'Doe');

    SELECT results_eq('multiple_have', 'multiple_want', 'Have ALL results');

    PREPARE single_have AS SELECT first_name, last_name
                           FROM person
                           WHERE first_name = 'John';
    PREPARE single_want AS VALUES ('John', 'Smith');

    SELECT results_eq('single_have', 'single_want', 'Have single RESULT');

SELECT * FROM finish();
ROLLBACK;

DELETE FROM person *;
