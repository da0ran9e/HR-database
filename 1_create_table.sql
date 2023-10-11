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
    country_name VARCHAR(50) NOT NULL,
    region_id INT
);
CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id CHAR(10) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
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
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE RESTRICT ON DELETE CASCADE
);
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE SET NULL ON DELETE SET NULL
);
