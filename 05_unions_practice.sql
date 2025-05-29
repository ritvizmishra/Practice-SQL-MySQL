-- UNION

USE company_db;

-- Combine clients and suppliers & count
SELECT client_name AS client_and_suppliers, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- Find list of all the money spent or earned by the company in desc
SELECT salary AS money_in_or_out, 'OUT' AS direction
FROM employee
UNION
SELECT total_sales, 'IN' AS direction
FROM works_with
ORDER BY money_in_or_out DESC;