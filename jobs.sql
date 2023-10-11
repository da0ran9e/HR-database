CREATE TABLE jobs (
    job_id CHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) DEFAULT '',
    min_salary DECIMAL(6, 0) DEFAULT 8000,
    max_salary DECIMAL(6, 0) DEFAULT NULL CHECK (max_salary <= 25000)
);
