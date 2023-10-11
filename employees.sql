--with UNIQUE Constraint and Foreign Key
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
--with Foreign Key Constraints
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
--with ON UPDATE and ON DELETE Actions
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);
--with ON UPDATE and ON DELETE Actions
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE RESTRICT ON DELETE CASCADE
);
--with ON UPDATE and ON DELETE Actions
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary NUMERIC(10, 2),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(JOB_ID) ON UPDATE SET NULL ON DELETE SET NULL
);
