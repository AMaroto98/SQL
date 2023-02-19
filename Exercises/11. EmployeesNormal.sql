-- 1) Display the number of employees in each department. Use GROUP BY to group by department.

SELECT dept_num, COUNT(*) AS Num_Empleados
FROM EMPLOYEES
GROUP BY dept_num;

-- 2) For each occupation obtain the average salary. 

SELECT OCCUPATIONS.name, EMPLOYEES.occu_code, AVG(EMPLOYEES.salary) AS AverageSalary
FROM EMPLOYEES, OCCUPATIONS
WHERE OCCUPATIONS.code = EMPLOYEES.occu_code
GROUP BY occu_code;

-- 3) Display the departments with more than 5 employees. Use GROUP BY to group by department and HAVING to establish the condition on the groups. 

SELECT DEPARTMENTS.name, EMPLOYEES.dept_num, COUNT(*) AS NumEmployees
FROM EMPLOYEES, DEPARTMENTS
WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num
GROUP BY dept_num
HAVING NumEmployees > 5;

-- 4) Find the average wages of each department (use the function avg and GROUP BY).

SELECT DEPARTMENTS.name, DEPARTMENTS.num, AVG(EMPLOYEES.salary) AS AverageSalary
FROM EMPLOYEES, DEPARTMENTS
WHERE DEPARTMENTS.num = EMPLOYEES.dept_num
GROUP BY dept_num;

-- 5) Display the surname of the salesmen of the 'SALES' department. 

SELECT EMPLOYEES.surname
FROM EMPLOYEES, DEPARTMENTS
WHERE DEPARTMENTS.num = EMPLOYEES.dept_num AND DEPARTMENTS.name = "SALES";

SELECT EMPLOYEES.surname
FROM EMPLOYEES, DEPARTMENTS
WHERE DEPARTMENTS.num = EMPLOYEES.dept_num AND EMPLOYEES.dept_num = 30;

SELECT surname
FROM EMPLOYEES 
WHERE dept_num = 30;

-- 6) Display the sum of salaries of the 'SALES' department. 

SELECT DEPARTMENTS.name, SUM(EMPLOYEES.salary)
FROM EMPLOYEES, DEPARTMENTS
GROUP BY DEPARTMENTS.name
HAVING DEPARTMENTS.name = "SALES";

-- 7) Display the count of employees with occupation “EMPLOYEE” in every department (show the name of the department).

SELECT DEPARTMENTS.name, COUNT(*) AS Num_Empleados
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND EMPLOYEES.occu_code = "EMP"
GROUP BY DEPARTMENTS.name;

-- 8) Show the number of different occupations in each department. 

SELECT dept_num, COUNT(DISTINCT occu_code) AS Num_Occupations
FROM EMPLOYEES
GROUP BY dept_num;

-- 9) Show departments that have more than two people working in the same occupation. 

-- Repasar

SELECT dept_num, occu_code, COUNT(*) as NumEmployees
FROM EMPLOYEES
GROUP BY dept_num, occu_code
HAVING COUNT(*) > 2;

-- 10) Displays a query that is the union between the table OCCUPATIONS and TOWNS.

(SELECT name FROM OCCUPATIONS)

UNION 

(SELECT name FROM TOWNS);

-- 11) Do the same query as in exercise 10 but order the results by name. 

WITH subquery(name) AS 

(SELECT name FROM OCCUPATIONS

UNION 

SELECT name FROM TOWNS)

SELECT name
FROM subquery
ORDER BY name;

-- 12) Select the occupation names of all the employees of the department with name ‘RESEARCH’ and do the union of this query with the selection of the occupation names of the employees of the department with name ‘SALES’. Use the union operator. 

(SELECT OCCUPATIONS.name 
FROM OCCUPATIONS, DEPARTMENTS
WHERE DEPARTMENTS.name = "RESEARCH")

UNION

(SELECT OCCUPATIONS.name 
FROM OCCUPATIONS, DEPARTMENTS
WHERE DEPARTMENTS.name = "SALES");

-- 13) Repeat the last query showing the repeated results (union all).

(SELECT OCCUPATIONS.name 
FROM OCCUPATIONS, DEPARTMENTS
WHERE DEPARTMENTS.name = "RESEARCH")

UNION ALL

(SELECT OCCUPATIONS.name 
FROM OCCUPATIONS, DEPARTMENTS
WHERE DEPARTMENTS.name = "SALES");

-- 14) Display the number of sellers in the 'SALES' department. 

SELECT COUNT(*) AS SellersInSales
FROM OCCUPATIONS, EMPLOYEES
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND OCCUPATIONS.name = "SALESMAN";

-- 15) Display the surnames and occupations of the employees of the 'SALES' department. 

-- No sé si es del todo correcta.

SELECT EMPLOYEES.surname, OCCUPATIONS.name, DEPARTMENTS.name
FROM EMPLOYEES, OCCUPATIONS, DEPARTMENTS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND DEPARTMENTS.name = "SALES" AND EMPLOYEES.dept_num = 30;

-- 

