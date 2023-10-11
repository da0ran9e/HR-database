--1--
SELECT first_name AS "First Name", last_name AS "Last Name" FROM employees;
--2--
SELECT DISTINCT department_id FROM employees;
--3--
SELECT * FROM employees ORDER BY first_name DESC;
--4--
SELECT first_name, last_name, salary, salary * 0.15 AS PF
FROM employees
WHERE salary * 0.15 > 1000;
--4'--
SELECT first_name, last_name, job_title, salary, salary * 0.15 AS PF
FROM employees;
--5--
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary ASC;
--6--
SELECT SUM(salary) AS "Total Salaries Payable" FROM employees;
--7--
SELECT MAX(salary) AS "Maximum Salary", MIN(salary) AS "Minimum Salary" FROM employees;
--8--
SELECT AVG(salary) AS "Average Salary", COUNT(*) AS "Number of Employees" FROM employees;
--9--
SELECT COUNT(*) AS "Number of Employees" FROM employees;
--10--
SELECT COUNT(DISTINCT job_id) AS "Number of Jobs" FROM employees;
--11--
SELECT UPPER(first_name) FROM employees;
--12--
SELECT SUBSTRING(first_name, 1, 3) FROM employees;
--13--
SELECT 171 * 214 + 625 AS "Result";
--14--
SELECT CONCAT(first_name, ' ', last_name) AS "Employee Names" FROM employees;
--15--
SELECT TRIM(BOTH FROM first_name) FROM employees;
--16--
SELECT LENGTH(CONCAT(first_name, last_name)) AS "Name Length" FROM employees;
--17--
SELECT first_name
FROM employees
WHERE first_name ~ '.*[0-9]+.*';
--18--
SELECT * FROM table_name LIMIT 10;
--19--
SELECT ROUND(salary / 12, 2) AS "Monthly Salary" FROM employees;

