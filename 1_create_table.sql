--Write a SQL statement to create a simple table countries including columns 
--country_id--
--country_name
--region_id--
CREATE TABLE countries (
    country_id CHAR(2),
    country_name VARCHAR(50),
    region_id INT
);
--Write a SQL statement to create a table named jobs including columns 
--job_id--
--job_title--
--min_salary--
--max_salary-- check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE jobs (
    job_id CHAR(10),
    job_title VARCHAR(35),
    min_salary NUMERIC(10, 2) CHECK (min_salary >= 0),
    max_salary NUMERIC(10, 2) CHECK (max_salary >= 0 AND max_salary <= 25000)
);
--Write a SQL statement to create a table named countries including columns
--country_id
--country_name
--region_id
--make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE countries (
    country_id CHAR(2),
    country_name VARCHAR(50),
    region_id INT,
    CHECK (country_name IN ('Italy', 'India', 'China'))
);
--Write a SQL statement to create a table named job_history including columns 
--employee_id
--start_date
--end_date
--job_id
--department_id
CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id CHAR(10) NOT NULL,
    department_id INT NOT NULL,
);
--Write a SQL statement to create a table named countries including columns 
--country_id
--country_name
--region_id 
--make sure that no duplicate data against column country_id will be allowed at the time of insertion.
CREATE TABLE countries (
    country_id CHAR(2),
    country_name VARCHAR(50),
    region_id INT,
    UNIQUE (country_id)
);
--Write a SQL statement to create a table named jobs including columns 
--job_id--
--job_title--
--min_salary--
--max_salary--
--make sure that, the default value for 
--job_title is blank--
--min_salary is 8000--
--max_salary is NULL--
--will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE jobs (
    job_id CHAR(10),
    job_title VARCHAR(35) DEFAULT '',
    min_salary DECIMAL(6, 0) DEFAULT 8000,
    max_salary DECIMAL(6, 0) DEFAULT NULL CHECK (max_salary <= 25000)
);
--Write a SQL statement to create a table named countries including columns 
--country_id--
--country_name--
--region_id--
--make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    UNIQUE (country_id)
);
--Write a SQL statement to create a table countries including columns 
--country_id-- 
--country_name--
--region_id--
--make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT
);
--Write a SQL statement to create a table job_history including columns 
--employee_id-- 
--start_date--
--end_date--
--job_id--
--department_id--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion
--the foreign key column job_id contain only those values which are exists in the jobs table.
CREATE TABLE job_history (
    employee_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    job_id CHAR(10) NOT NULL,
    department_id INT,
    UNIQUE(employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
--Write a SQL statement to create a table employees including columns 
--employee_id--
--first_name--
--last_name--
--email--
--phone_number--
--hire_date--
--job_id--
--salary--
--commission--
--manager_id--
--department_id--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion
--the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id CHAR(10),
    salary NUMERIC(10, 2),
    commission NUMERIC(10, 2),
    manager_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id, manager_id) REFERENCES departments(department_id, manager_id)
);
--Write a SQL statement to create a table employees including columns --employee_id--
--first_name--
--last_name--
--email--
--phone_number--
--hire_date--
--job_id--
--salary--
--commission--
--manager_id--
--department_id--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion
--the foreign key column department_id, reference by the column department_id of departments table,
--can contain only those values which are exists in the departments table 
--another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id CHAR(10),
    salary NUMERIC(10, 2),
    commission NUMERIC(10, 2),
    manager_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
--Write a SQL statement to create a table employees including columns 
--employee_id--
--first_name--
--last_name--
--job_id--
--salary--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion
--the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 
--The specialty of the statement is that, The ON UPDATE CASCADE action allows you to perform cross-table update and ON DELETE RESTRICT action reject the deletion. 
--The default action is ON DELETE RESTRICT.
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);
--Write a SQL statement to create a table employees including columns
--employee_id--
--first_name--
--last_name--
--job_id--
--salary--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion,
--the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
--The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE RESTRICT ON DELETE CASCADE
);
--Write a SQL statement to create a table employees including columns
--employee_id--
--first_name--
--last_name--
--job_id--
--salary--
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion
--the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
--The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE SET NULL ON DELETE SET NULL
);
