-- BASIC QUERIES & APPLICATION

USE company_db;

-- find all the employees
SELECT *
FROM employee;

-- find all the employees ordered by the salary
SELECT *
FROM employee
ORDER BY salary DESC;

-- find all the employees ordered by sex and then name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- find first 5 employees in the table
SELECT * 
FROM employee
LIMIT 5;

-- find first and last name of employees
SELECT first_name, last_name
FROM employee;

-- find forenames and surnames of the employee
SELECT first_name AS forename, last_name AS surname
FROM employee;

-- find out all the different genders
SELECT DISTINCT sex 
FROM employee;