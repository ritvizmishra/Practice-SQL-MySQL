-- JOINS

USE company_db;

SELECT * FROM employee;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch;
SELECT * FROM branch_supplier;

-- Find all the branches and name of their managers.
SELECT employee.emp_id, employee.first_name AS name, branch.branch_name AS branch
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Show all employees and their corresponding clients, if any. Include employees who don’t work with any clients.
SELECT employee.emp_id, employee.first_name, client.client_name
FROM employee
LEFT JOIN works_with
ON employee.emp_id = works_with.emp_id
LEFT JOIN client 
ON works_with.client_id = client.client_id;

-- Get a list of all employees and the names of the branches they work at.
SELECT employee.first_name AS name, branch.branch_name AS branch
FROM employee
INNER JOIN branch
ON employee.branch_id = branch.branch_id;

-- Create a combined list of all employees and all managers. 
-- If someone is a manager but not listed as a regular employee, include them too.
-- Answer 1
SELECT e1.first_name AS employee_name, e2.first_name AS manager_name
FROM employee e1, employee e2
WHERE e2.emp_id = e1.super_id;

-- Answer 2
SELECT e1.first_name AS employee_name, e2.first_name AS manager_name
FROM employee e1
INNER JOIN employee e2
ON e1.super_id = e2.emp_id;

-- List all branch suppliers and show the corresponding branch name. 
-- Include suppliers even if the branch information is missing or invalid.
SELECT branch_supplier.supplier_name, branch.branch_name
FROM branch
RIGHT JOIN branch_supplier
ON branch.branch_id = branch_supplier.branch_id;






