-- 1. Change the email column of the employees table to 'not available' for all employees
UPDATE employees SET email = 'not available';

-- 2. Change the email and commission_pct column of the employees table to 'not available' and 0.10 for all employees
UPDATE employees SET email = 'not available', commission_pct = 0.10;

-- 3. Change the email and commission_pct column of the employees table to 'not available' and 0.10 for those employees whose department_id is 110
UPDATE employees SET email = 'not available', commission_pct = 0.10 WHERE department_id = 110;

-- 4. Change the email column of the employees table to 'not available' for those employees whose department_id is 80 and commission is less than 0.20%
UPDATE employees SET email = 'not available' WHERE department_id = 80 AND commission_pct < 0.20;

-- 5. Change the email column of the employees table to 'not available' for those employees who belong to the 'Accounting' department
UPDATE employees e
SET email = 'not available'
WHERE e.department_id = (SELECT department_id FROM departments WHERE department_name = 'Accounting');

-- 6. Change the salary of an employee to 8000 if their ID is 105 and the existing salary is less than 5000
UPDATE employees SET salary = 8000 WHERE employee_id = 105 AND salary < 5000;

-- 7. Change the job ID of an employee with ID 118 to 'SH_CLERK' if the employee belongs to department 30 and the existing job ID does not start with 'SH'
UPDATE employees SET job_id = 'SH_CLERK'
WHERE employee_id = 118
AND department_id = 30
AND NOT (job_id LIKE 'SH%');

-- 8. Increase the salary of employees under departments 40, 90, and 110 by the specified percentages, keeping the rest unchanged
UPDATE employees
SET salary = CASE
    WHEN department_id = 40 THEN salary * 1.25
    WHEN department_id = 90 THEN salary * 1.15
    WHEN department_id = 110 THEN salary * 1.10
    ELSE salary
END;

-- 9. Increase the minimum and maximum salary of 'PU_CLERK' by 2000 and increase salaries by 20% and commission percent by 0.10
UPDATE employees
SET min_salary = min_salary + 2000,
    max_salary = max_salary + 2000,
    salary = salary * 1.20,
    commission_pct = commission_pct + 0.10
WHERE job_id = 'PU_CLERK';
