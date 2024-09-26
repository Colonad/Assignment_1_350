/* CS350 Assignment 1 */
/* Author: Brian Li */

/* Problem 1 */
SELECT country_name 
FROM countries
WHERE country_name ILIKE '%in%';

/* Problem 2 */
SELECT region_id, COUNT(*) AS country_count
FROM countries
GROUP BY region_id;

/* Problem 3 */
SELECT first_name, last_name
FROM employees
WHERE job_title ILIKE '%Manager%';

/* Problem 4 */
SELECT e.first_name, e.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.first_name = 'Nancy' AND m.last_name = 'Greenberg';
