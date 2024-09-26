-- 5
SELECT first_name, last_name FROM employees
WHERE salary BETWEEN
(SELECT salary FROM employees WHERE first_name = 'Luis' AND last_name = 'Popp')
AND 
(SELECT salary FROM employees WHERE first_name = 'Alexander' AND last_name = 'Hunold');

-- 6
SELECT AVG(e.salary) AS avg
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'Germany';

-- 7
SELECT e.department_id, AVG(e.salary) AS avg
FROM employees e
GROUP BY e.department_id
HAVING COUNT(e.employee_id) >= 8;

-- 8
SELECT MIN(salary) AS min, MAX(salary) AS max
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = 'Programmer';
