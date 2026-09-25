-- Day 8 SQL Exercises

-- 1. Display all employees
SELECT *
FROM employees;

-- 2. Display employees with their department names
SELECT
    employees.name AS employee_name,
    departments.name AS department_name
FROM employees
JOIN departments
    ON employees.department_id = departments.id;

-- 3. Display employees with salary greater than 50000
SELECT *
FROM employees
WHERE salary > 50000;

-- 4. Display employees ordered by salary
SELECT *
FROM employees
ORDER BY salary DESC;

-- 5. Find average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- 6. Find highest-paid employee
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 7. Count employees in each department
SELECT
    departments.name AS department_name,
    COUNT(employees.id) AS employee_count
FROM departments
JOIN employees
    ON departments.id = employees.department_id
GROUP BY departments.id, departments.name;

-- 8. Departments having more than one employee
SELECT
    departments.name AS department_name,
    COUNT(employees.id) AS employee_count
FROM departments
JOIN employees
    ON departments.id = employees.department_id
GROUP BY departments.id, departments.name
HAVING COUNT(employees.id) > 1;

-- 9. Display active facilities
SELECT *
FROM facilities
WHERE status = 'Active';

-- 10. Display facilities with cleanliness score below 5
SELECT
    facilities.name AS facility_name,
    inspections.cleanliness_score
FROM facilities
JOIN inspections
    ON facilities.id = inspections.facility_id
WHERE inspections.cleanliness_score < 5;

-- 11. Display inspection history with facility names
SELECT
    facilities.name AS facility_name,
    inspections.inspection_date,
    inspections.cleanliness_score,
    inspections.status,
    inspections.remarks
FROM inspections
JOIN facilities
    ON inspections.facility_id = facilities.id
ORDER BY inspections.inspection_date DESC;

-- 12. Average cleanliness score by facility
SELECT
    facilities.name AS facility_name,
    AVG(inspections.cleanliness_score) AS average_cleanliness_score
FROM facilities
JOIN inspections
    ON facilities.id = inspections.facility_id
GROUP BY facilities.id, facilities.name;

-- 13. Count complaints by facility
SELECT
    facilities.name AS facility_name,
    COUNT(complaints.id) AS complaint_count
FROM facilities
LEFT JOIN complaints
    ON facilities.id = complaints.facility_id
GROUP BY facilities.id, facilities.name;

-- 14. Count complaints by status
SELECT
    status,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY status;

-- 15. Display open complaints
SELECT *
FROM complaints
WHERE status = 'Open';

-- 16. Display facilities having more than one complaint
SELECT
    facilities.name AS facility_name,
    COUNT(complaints.id) AS complaint_count
FROM facilities
JOIN complaints
    ON facilities.id = complaints.facility_id
GROUP BY facilities.id, facilities.name
HAVING COUNT(complaints.id) > 1;

-- 17. Subquery: employees earning above average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 18. Transaction example
BEGIN TRANSACTION;

UPDATE employees
SET salary = salary + 2000
WHERE id = 1;

COMMIT;