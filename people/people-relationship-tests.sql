psql -d people

-- Insert values to test against
INSERT INTO job (name)
    VALUES  ('Engineer');

INSERT INTO person (first_name, last_name, job)
    VALUES  ('John', 'Smith', 'Engineer');

-- Begin tests
BEGIN;
    SELECT plan(2);

    SELECT fk_ok('person', 'job', 'job', 'name');

    PREPARE person_fk_have AS SELECT first_name, job
                                     FROM person;
    PREPARE person_fk_want AS VALUES ('John', 'Engineer');

    SELECT results_eq('person_fk_have', 'person_fk_want', 'Foreign key is correct');

-- Finish tests and clear table
SELECT * FROM finish();
ROLLBACK;

DELETE FROM person *;
DELETE FROM job *;
