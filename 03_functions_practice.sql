-- FUNCTIONS

USE company_db;

-- find the number of employees with supervisors
SELECT COUNT(super_id)
FROM employee;

-- find number of female employees born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND YEAR(birth_day) > 1970;

-- find average of all male employees' salary
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

-- find sum of all the female employees' salary
SELECT SUM(salary)
FROM employee
WHERE sex = 'F';

-- find out how many males and females are there
SELECT COUNT(emp_id), sex
FROM employee
GROUP BY sex;

-- find total sales of each salesman ordered in desc 
SELECT emp_id, SUM(total_sales) AS totalSales
FROM works_with
GROUP BY emp_id 
ORDER BY totalSales DESC;




