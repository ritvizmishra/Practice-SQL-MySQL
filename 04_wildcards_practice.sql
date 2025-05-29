-- WILDCARDS

USE company_db;

-- Find any client who are at LLC
SELECT *
FROM client
WHERE client_name LIKE '%llc%';

-- Find branch suppliers in label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%label%';

-- Find any employee born in February
SELECT *
FROM employee
WHERE MONTH(birth_day) = 02;

-- Find any clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%school%';