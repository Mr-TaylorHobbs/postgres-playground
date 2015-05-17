psql -d people

-- Insert values to test against
INSERT INTO job (name)
    VALUES  ('Engineer');

INSERT INTO person (first_name, last_name, job)
    VALUES  ('John', 'Smith', 'Engineer'),
            ('Dave', 'Smith', 'Engineer');

-- Begin tests
BEGIN;
    SELECT plan(2);

    SELECT fk_ok('person', 'job', 'job', 'name');

    PREPARE mutliple_fk_have AS SELECT first_name, job
                                       FROM person;

    PREPARE mutliple_fk_want AS VALUES ('John', 'Engineer'),
                                       ('Dave', 'Engineer');

    SELECT results_eq('mutliple_fk_have', 'mutliple_fk_want', 'Can have multiple Engineers');


-- Finish tests and clear table
SELECT * FROM finish();
ROLLBACK;

DELETE FROM person *;
DELETE FROM job *;
