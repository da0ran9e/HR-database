-- 1. List the number of jobs available in the employees table
SELECT COUNT(DISTINCT job_id) AS total_jobs
FROM employees;

-- 2. Get the total salaries payable to employees in each department
SELECT department_id, SUM(salary) AS total_salaries
FROM employees
GROUP BY department_id;

-- 3. Get the minimum salary for each job
SELECT job_id, MIN(salary) AS min_salary
FROM employees
GROUP BY job_id;

-- 4. Get the maximum salary of an employee working as a Programmer (job title)
SELECT MAX(salary) AS max_programmer_salary
FROM employees
WHERE job_id = 'Programmer';

-- 5. Get the average salary and the number of employees working in department 90 (department ID)
SELECT AVG(salary) AS avg_salary, COUNT(*) AS num_employees
FROM employees
WHERE department_id = 90;

-- 6. Get the highest, lowest, sum, and average salary of all employees
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary, SUM(salary) AS total_salary, AVG(salary) AS avg_salary
FROM employees;

-- 8. Get the difference between the highest and lowest salaries
SELECT (MAX(salary) - MIN(salary)) AS salary_difference
FROM employees;

-- 9. Find the manager ID and the salary of the lowest-paid employee for each manager
SELECT manager_id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY manager_id;

-- 11. Get the average salary for each job ID excluding the 'Programmer' job
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
WHERE job_id <> 'Programmer'
GROUP BY job_id;

-- 13. Get the job ID and maximum salary of employees where the maximum salary is greater than or equal to $4000
SELECT job_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
HAVING MAX(salary) >= 4000;

-- 14. Get the average salary for all departments employing more than 10 employees
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;
