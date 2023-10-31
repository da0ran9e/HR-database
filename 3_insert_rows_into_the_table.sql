-- 1. Insert a record 
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('VI', 'Vietnam', 3);

-- 2. Insert one row into the table countries against the columns country_id and country_name
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME) VALUES ('VI', 'Vietnam');

-- 3. Create a duplicate of the countries table named country_new with all structure and data
CREATE TABLE country_new AS SELECT * FROM countries;

-- 4. Insert NULL values against the region_id column for a row in the countries table
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('VI', 'Vietnam', NULL);

-- 5. Insert 3 rows using a single INSERT statement
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES
    ('AA', 'Country A', 1),
    ('BB', 'Country B', 2),
    ('CC', 'Country C', 3);

-- 6. Insert rows from the country_new table into the countries table
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM country_new;

-- 7. Insert one row in the jobs table to ensure that no duplicate value will be entered in the job_id column
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
SELECT 'IT_PROG', 'Programmer', 50000, 90000
WHERE NOT EXISTS (SELECT 1 FROM jobs WHERE job_id = 'IT_PROG');

-- 10. Insert rows into the countries table where the country_id column will be unique and auto-incremented
INSERT INTO countries (COUNTRY_NAME, REGION_ID) 
VALUES  ('Country 1', 101), 
        ('Country 2', 102), 
        ('Country 3', 103);

-- 11. Insert records into the countries table to ensure that the country_id column will not contain any duplicate data, automatically incremented, and the column country_name will be filled with 'N/A' if no value is assigned
INSERT INTO countries (COUNTRY_NAME) VALUES ('Country A'), (NULL), ('Country B');

-- 12. Insert rows into the job_history table where the job_id column contains values that exist in the job_id column of the jobs table
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
VALUES (1, '2023-01-01', '2023-12-31', 'JOBX', 1001);

-- 13. Insert rows into the employees table where the combination of department_id and manager_id contains a unique value and the combined values must exist in the departments table
INSERT INTO employees (employee_id, first_name, last_name, department_id, manager_id, salary)
VALUES (1, 'John', 'Doe', 1001, 1001, 5000), (2, 'Jane', 'Smith', 1002, 1002, 6000);

-- 14. Insert rows into the employees table where the combination of department_id and job_id contains values that must exist in the departments and jobs tables
INSERT INTO employees (employee_id, first_name, last_name, department_id, job_id, salary)
VALUES (1, 'John', 'Doe', 1001, 'JOBX', 5000), (2, 'Jane', 'Smith', 1002, 'JOBY', 6000);
