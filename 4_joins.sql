-- 1. Find the addresses (location_id, street_address, city, state_province, country_name) of all departments
SELECT d.department_id, l.street_address, l.city, l.state_province, c.country_name
FROM departments d
JOIN locations l 
ON d.location_id = l.location_id
JOIN countries c 
ON l.country_id = c.country_id;

-- 2. Find the name (first_name, last_name), department ID, and department name of all employees
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id;

-- 3. Find the name (first_name, last_name), job, department ID, and department name of employees who work in London
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.location_id = (
    SELECT location_id 
    FROM locations 
    WHERE city = 'London');

-- 4. Find the employee ID, name (last_name) along with their manager (manager_id, last_name)
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m 
ON e.manager_id = m.employee_id;

-- 5. Find the name (first_name, last_name) and hire date of employees hired after 'Jones'
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (
    SELECT hire_date 
    FROM employees 
    WHERE last_name = 'Jones');

-- 7. Find the employee ID, job title, and the number of days between ending date and starting date for all jobs in department with ID 90
SELECT e.employee_id, j.job_title, DATEDIFF(end_date, start_date) AS days_between
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
JOIN jobs j ON jh.job_id = j.job_id
WHERE e.department_id = 90;

-- 8. Display the department ID, department name, and the first name of their manager
SELECT d.department_id, d.department_name, e.first_name AS manager_first_name
FROM departments d
LEFT JOIN employees e ON d.manager_id = e.employee_id;

-- 9. Display the department name, manager name, and city
SELECT d.department_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_name, l.city
FROM departments d
LEFT JOIN employees m ON d.manager_id = m.employee_id
LEFT JOIN locations l ON d.location_id = l.location_id;

-- 11. Display job title, employee (ID, name), and the difference between the salary of the employee and the minimum salary for the job
SELECT j.job_title, e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name, (e.salary - j.min_salary) AS salary_difference
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- 12. Display the job history done by employees currently earning more than 10000 in salary
SELECT jh.*
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
WHERE e.salary > 10000;

-- 13. Display department (ID, name) and their manager with more than 15 years of experience, including name, hire date, and salary
SELECT d.department_id, d.department_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_name, m.hire_date, m.salary
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id
WHERE DATEDIFF(NOW(), m.hire_date) > 5475; -- 15 years (assuming 365 days per year)
