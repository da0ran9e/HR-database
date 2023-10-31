CREATE TABLE departments (
    department_id DECIMAL(4, 0) PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6, 0),
    location_id DECIMAL(4, 0)
);
