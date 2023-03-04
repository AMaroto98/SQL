-- 1) Add a new column to the employees table which is called mentor_id. Optionally, change the table so that the mentor_id column references the employee_id column of the table employees.

ALTER TABLE employees ADD mentor_id VARCHAR(20); 

-- 2) Delete the column you created in the previous exercise.

ALTER TABLE employees DROP COLUMN mentor_id;

-- 3) Create a query to display all the data from the employees table.

SELECT * FROM employees;

-- 4) The following SELECT statement executes successfully (True / False)

FROM employees
SELECT last_name, first_name

-- Respuesta: False.

-- 5) Create a query to display the department number, department name, and location_id. Name the last column (location_id) heading as “LOC”

SELECT department_id, department_name, location_id as LOC FROM departments;

-- 6) The following SELECT statement executes successfully (True / False)

SELECT department_name, department_name
FROM departments;

-- Respuesta: True.

-- 7) The following SELECT statement executes successfully (True / False)

SeleCT last_NAME, fiRST_NamE, FROM Employees;

-- Respuesta: True.

-- 8) Create a query to display the employee number, first name, last name, phone number and department number (employees table).

SELECT employee_id, first_name, last_name, phone_number, department_id FROM employees;

-- 9) Create a query to display the first name, last name, hire date, salary, and salary after a raise of 20%. Name the last column (salary after a raise) heading as “ANNUAL_SAL” (employees table).

SELECT first_name, last_name, hire_date, salary, salary + (salary * 0.2) as ANNUAL_SAL FROM employees;

-- 10) Create a query to display the last name concatenated with the first name, separated by space, and the telephone number concatenated with the email address, separated by hyphen. Name the column headings “FULL_NAME” and “CONTACT_DETAILS” respectively (employees tables).

SELECT CONCAT(last_name, ' ', first_name) as FULL_NAME, CONCAT(phone_number, '-', email) AS CONTACT_DETAILS FROM employees;

-- 11) Create a query to display the unique manager numbers from employees table.

SELECT DISTINCT manager_id FROM employees;

-- 12) Create a query to display the last name concatenated with job_id column, separated by space. Name this column heading as “EMPLOYEE_AND_TITLE” (employees table).

SELECT CONCAT(last_name, ' ', job_id) AS EMPLOYEE_AND_TITLE FROM employees; 

-- 13) Create a query to display the first name, last name, salary, and hire date concatenated with the literal string “HD”, separated by space. Name the column headings “FN”, “LN”, “SAL”, and “HD” respectively (employees table).

SELECT first_name AS FN, last_name AS LN, salary AS SAL, CONCAT(hire_date, ' ', "HD") AS HD FROM employees;

-- 14) Create a query to display the unique salaries in employees tables.

SELECT DISTINCT salary FROM employees;

-- 15) Create a query to display the unique combination of values in department_id and job_id columns (employees table).

SELECT DISTINCT department_id, job_id FROM employees;

-- 16) Drop the table dependents.

DROP TABLE dependents;

-- 17) Drop the database.

DROP DATABASE Ejercicio1;
