-- 1. Find the name (first_name, last_name) and salary of employees with a higher salary than the employee whose last_name is 'Bull'
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');

-- 2. Find the name (first_name, last_name) of employees who work in the IT department
SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');

-- 3. Find the name (first_name, last_name) of employees who have a manager and work in a USA-based department
SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL AND d.country_id = 'US';

-- 4. Find the name (first_name, last_name) of the employees who are managers
SELECT first_name, last_name
FROM employees
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);

-- 5. Find the name (first_name, last_name) and salary of employees whose salary is greater than the average salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 6. Find the name (first_name, last_name) and salary of employees whose salary is equal to the minimum salary for their job grade
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (SELECT MIN(salary) FROM employees WHERE job_id = j.job_id);

-- 7. Find the name (first_name, last_name) and salary of employees who earn more than the average salary and work in any of the IT departments
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees) AND d.department_name = 'IT';

-- 8. Find the name (first_name, last_name) and salary of employees who earn more than Mr. Bell
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bell');

-- 9. Find the name (first_name, last_name) and salary of employees who earn the same salary as the minimum salary for all departments
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary = (SELECT MIN(salary) FROM employees);

-- 10. Find the name (first_name, last_name) and salary of employees whose salary is greater than the average salary of all departments
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

-- 11. Find the name (first_name, last_name) and salary of employees who earn a salary higher than the salary of all Shipping Clerks (JOB_ID = 'SH_CLERK'). Sort the results by salary from lowest to highest
SELECT first_name, last_name, salary
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY salary;

-- 12. Find the name (first_name, last_name) of employees who are not supervisors
SELECT first_name, last_name
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id FROM employees);

-- 13. Display the employee ID, first name, last name, and department names of all employees
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 14. Display the employee ID, first name, last name, and salary of employees whose salary is above average for their departments
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

-- 15. Fetch even-numbered records from the employees table
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num
    FROM employees
) AS numbered_employees
WHERE row_num % 2 = 0;

-- 16. Find the 5th maximum salary in the employees table
SELECT DISTINCT salary
FROM employees e1
WHERE 5 = (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e1.salary <= e2.salary
);

-- 17. Find the 4th minimum salary in the employees table
SELECT DISTINCT salary
FROM employees e1
WHERE 4 = (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e1.salary >= e2.salary
);

-- 18. Select the last 10 records from a table
SELECT *
FROM employees
ORDER BY employee_id DESC
LIMIT 10;

-- 19. List the department ID and name of all departments where no employee is working
SELECT d.department_id, d.department_name
FROM departments d
WHERE d.department_id NOT IN (SELECT DISTINCT department_id FROM employees);

-- 20. Get 3 maximum salaries
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 21. Get 3 minimum salaries
SELECT DISTINCT salary
FROM employees
ORDER BY salary
LIMIT 3;

-- 22. Get nth max salaries of employees (replace 'n' with the desired rank)
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET n - 1;
