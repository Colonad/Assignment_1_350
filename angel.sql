-- CS350: Assignment 1

--Angel Colon

-- Problem 9: Total salary for employees in the Finance department
SELECT SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Problem 10: Employees in IT paid more than the Shipping department manager
SELECT COUNT(*)
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'IT'
AND e.salary > (
    SELECT MAX(m.salary)
    FROM employees m
    JOIN departments d2 ON m.department_id = d2.department_id
    JOIN jobs j2 ON m.job_id = j2.job_id
    WHERE d2.department_name = 'Shipping' AND j2.job_title LIKE '%Manager%'
);

-- Problem 11: Employees not managed by Nancy Greenberg
SELECT employee_id, first_name, last_name
FROM employees

EXCEPT

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.first_name = 'Nancy' AND m.last_name = 'Greenberg';

-- Problem 12: Employees paid more than 9000 or who work in Germany
SELECT employee_id, last_name
FROM employees
WHERE salary > 9000

UNION

SELECT e.employee_id, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'Germany';

-- Problem 13: Countries in region 4 whose names begin with 'Z'
SELECT country_name
FROM countries
WHERE region_id = 4

INTERSECT

SELECT country_name
FROM countries
WHERE country_name LIKE 'Z%';
