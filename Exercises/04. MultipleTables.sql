-- 1) Write a query in SQL to display the first name, last name, department_id, and department name for each employee (table:departments,employees).

SELECT employees.first_name, employees.last_name, employees.department_id, departments.department_name FROM employees, departments WHERE employees.department_id = departments.department_id;

-- 2) Write a query in SQL to display the first and last name, department, city,and state province for each employee (table: employees, departments, locations).

SELECT employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province FROM employees, departments, locations WHERE departments.location_id = locations.location_id AND employees.department_id = departments.department_id;

-- 3) Write a query in SQL to display the first name, last name, salary, and job_title for all employees (table: employees, jobs).

SELECT employees.first_name, employees.last_name, employees.salary, jobs.job_title FROM employees, jobs WHERE employees.job_id = jobs.job_id;

-- 4) Write a query in SQL to display the first name, last name, department_id and department name, for all employees for departments 1 and 2  (table: departments, employees).

(SELECT employees.first_name, employees.last_name, employees.department_id, departments.department_name FROM employees, departments WHERE (employees.department_id = departments.department_id) AND departments.department_id = "1")

UNION

(SELECT employees.first_name, employees.last_name, employees.department_id, departments.department_name FROM employees, departments WHERE (employees.department_id = departments.department_id) AND departments.department_id = "2");

-- Sin utilizar UNION

SELECT employees.first_name, employees.last_name, employees.department_id, departments.department_name FROM employees, departments WHERE employees.department_id = departments.department_id AND employees.department_id in (1,2);

-- 5) Write a query in SQL to display those employees who contain a letter ‘a’ into their first name and also display their last name, department, city, and state_province (table: departments, employees, locations).

SELECT employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province FROM employees, departments, locations WHERE (employees.department_id = departments.department_id AND departments.location_id = locations.location_id) AND employees.first_name LIKE '%A%'; 

-- 6) Write a query in SQL to display those employees whose first name contains a letter ‘e’ in the third position and are part of the Purchasing department (table: departments, employees).

SELECT employees.first_name FROM employees, departments WHERE employees.department_id = departments.department_id AND employees.first_name LIKE '__e%' AND departments.department_name = 'Purchasing';