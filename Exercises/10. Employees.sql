-- 1) Show the last name, occupation and department number of each employee.

SELECT surname, occupation, dept_num FROM employees; 

-- 2) Show the number and name of each department.

SELECT * FROM departments;

-- 3) Show all the data of all the employees.

SELECT * FROM employees;

-- 4) Employee data sorted by last name ascendent.

SELECT * FROM employees ORDER BY surname ASC;

-- 5) Employee data sorted by department number descending.

SELECT * FROM employees ORDER BY dept_num DESC;

-- 6) Employee data sorted by department number descending and, within each department, sort data by employee surname ascending.

SELECT * FROM employees ORDER BY dept_num DESC, surname ASC;

-- 7) Show the data of the employees whose salary is greater than 20000.

SELECT * FROM employees WHERE salary > 20000;

-- 8) Show the data of the employees whose occupation is 'SALESMAN'.

SELECT * FROM employees WHERE occupation = "SALESMAN";

-- 9) Select the surname and occupation of the employees of department number 20.

SELECT surname, occupation FROM employees WHERE dept_num = 20;

-- 10) Select employees whose occupation is 'SALESMAN'. Show data sorted by surname.

SELECT * FROM employees WHERE occupation = "SALESMAN" ORDER BY surname;

-- 11) Show employees whose department is 20 or 30 and whose occupation is 'MANAGER'. Sort the result by dept_num descendent and surname ascendent.

SELECT * FROM employees WHERE (dept_num = 20 OR 30) AND occupation = "MANAGER" ORDER BY dept_num DESC, surname ASC;
 
-- 12) Show employees who have a salary greater than 20000 or who belong to the department number 20.

SELECT * FROM employees WHERE salary > 20000 OR dept_num = 20;

-- 13) Show employees sorted by their occupation and by their surname.

SELECT * FROM employees ORDER BY occupation, surname;

-- 14) Select employees from the employees table whose surname starts with 'S'.

SELECT * FROM employees WHERE surname LIKE "S%";

-- 15) Select from the EMPLOYEE table those rows whose SURNAME starts with 'C 'and the occupation has an 'E' in any position.

SELECT * FROM employees WHERE surname LIKE "C%" AND occupation LIKE "%E%";

-- 16) Select employees whose salary is between 10000 and 20000.

SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;

-- 17) Obtain the employees whose occupation is 'SALESMAN' and have a commission exceeding 1000.

SELECT * FROM employees WHERE occupation = "SALESMAN" AND commission > 1000;

-- 18) Number and surnames of the employees whose surname ends with 'S' and have a salary higher than 30000.

SELECT num, surname FROM employees WHERE surname LIKE "%S" AND salary > 30000;

-- 19) Data of the departments whose name starts with 'A' and ends with ‘G’.

SELECT * FROM departments WHERE name LIKE "A%G";

-- 20) Show the surnames of the employees who do not have a commission (clue: is NULL).



-- 21. Show the surnames of the employees who do not have a commission and whose last
-- name begins with 'H' (clue: is NULL).
-- 22. Show the surnames of the employees whose occupation is 'SALESMAN', 'MANAGER' or
-- 'EMPLOYEE'.
-- 23. Show the surnames of the employees whose occupation is neither "MANAGER" nor
-- "EMPLOYEE", and also have a salary higher than 20000.
-- 24. Select the surname, salary and department number of employees whose salary is
-- greater than 20000 in departments 10 or 30.
-- 25. Show the surname and number of employees whose salary is not between 10000 and
-- 20000.
-- 26. Get the surnames of all employees in lowercase.
-- 27. In a query, concatenate the name of each employee with his/her surname.
-- 28. Show the surname and the length of the surname (function LENGTH) of all employees,
-- sorted by the length of the surnames of the employees descending.
-- 29. Show data of the employees whose surname have 4 characters and ends with ‘N’. Do a
-- version using the function LENGTH and another one without it.
-- 30. Obtain the years of recruitment of all employees (YEAR function) but without duplicated
-- data. Order the results.
-- 31. Show the data of the employees that have been recruited in the year 1992.
-- 32. Show data of employees who have been recruited in the month of February of any year
-- (function MONTHNAME).
-- 33. Show the data of the employees whose surname begins with 'R' and have been recruited
-- in the year 1990.
-- 34. Show the name, surname, department name of the employees who have no commission
-- (clue: is NULL).
-- 35. Show the name, surname and occupation of employees with the name, surname and
-- occupation of their managers. Columns must have different names and you must order it by
-- the manager surname.
