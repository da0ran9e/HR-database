--Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.--
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT
);
CREATE TABLE jobs (
    job_id CHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL,
    min_salary NUMERIC(10, 2) CHECK (min_salary >= 0),
    max_salary NUMERIC(10, 2) CHECK (max_salary >= 0 AND max_salary <= 25000)
);
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT,
    CHECK (country_name IN ('Italy', 'India', 'China'))
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
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT,
    UNIQUE (country_id)
);
CREATE TABLE jobs (
    job_id CHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) DEFAULT '',
    min_salary DECIMAL(6, 0) DEFAULT 8000,
    max_salary DECIMAL(6, 0) DEFAULT NULL CHECK (max_salary <= 25000)
);
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT,
    UNIQUE (country_id)
);
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
