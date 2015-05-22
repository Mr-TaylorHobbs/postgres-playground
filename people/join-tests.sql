psql -d people

-- Insert values to test against
INSERT INTO job (name)
    VALUES  ('Engineer'),
            ('Manager');

INSERT INTO person (first_name, last_name, job)
    VALUES  ('John', 'Smith', 'Manager'),
            ('Dave', 'Smith', 'Engineer');

-- Begin tests
BEGIN;
    SELECT plan(2);

    SELECT fk_ok('person', 'job', 'job', 'name');

    PREPARE inner_join_have AS SELECT person.first_name, job.NAME
                                   FROM person, job
                                   WHERE person.job = job.NAME
                                   AND person.job = 'Manager';

    PREPARE inner_join_want AS VALUES ('John', 'Manager');

    SELECT results_eq('inner_join_have', 'inner_join_want', 'Correctly got John Manager');


-- Finish tests and clear table
SELECT * FROM finish();
ROLLBACK;

DELETE FROM person *;
DELETE FROM job *;
