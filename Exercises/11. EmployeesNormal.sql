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

-- Las dos formas están bien

-- Vista en clase

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "RESEARCH")

UNION

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "SALES");

---------------------------------------------------

-- Mía

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'RESEARCH'
)

UNION

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'SALES'
);

-- 13) Repeat the last query showing the repeated results (union all).

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "RESEARCH")

UNION ALL

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "SALES");

-------------------------------------------------------

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'RESEARCH'
)

UNION ALL

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'SALES'
);

-- 14) Display the number of sellers in the 'SALES' department. 

SELECT COUNT(*) AS SellersInSales
FROM OCCUPATIONS, EMPLOYEES
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND OCCUPATIONS.name = "SALESMAN";

-- 15) Display the surnames and occupations of the employees of the 'SALES' department. 

-- No sé si es del todo correcta.

SELECT EMPLOYEES.surname, OCCUPATIONS.name, DEPARTMENTS.name
FROM EMPLOYEES, OCCUPATIONS, DEPARTMENTS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND DEPARTMENTS.name = "SALES" AND EMPLOYEES.dept_num = 30;

-- 16) Display the number of employees and occupations of the employees of the 'SALES' department. 

-- Con esta lo he pasado peor que el Quijote en un parque eólico.
-- No sé si es tan complicada.

WITH SUBQUERY(occu_code) AS (SELECT occu_code 
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND DEPARTMENTS.name = "SALES"
)
SELECT OCCUPATIONS.name, COUNT(occu_code) AS NumEmployees
FROM SUBQUERY, OCCUPATIONS
WHERE SUBQUERY.occu_code = OCCUPATIONS.code
GROUP BY OCCUPATIONS.name;

-- 17) Display the number of employees of each department whose profession is "EMPLOYEE".

SELECT DEPARTMENTS.name, COUNT(*) AS NumEmployees, OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num AND OCCUPATIONS.name = "EMPLOYEE" AND EMPLOYEES.occu_code = OCCUPATIONS.code
GROUP BY dept_num;

-- 18) Display the department names and the count of employees working into them. 

SELECT DEPARTMENTS.name, COUNT(*) AS NumEmployees
FROM EMPLOYEES, DEPARTMENTS
WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num
GROUP BY dept_num;

-- 19) Display the maximum number of employees of all the departments. In other words, find the maximum value of the column showing the maximum number of employees in the previous exercise. (clue: you need exercise 18 as a subquery and you should use MAX function). 

WITH SUBQUERY(name, NumEmployees) AS (
    SELECT DEPARTMENTS.name, COUNT(*) AS NumEmployees
    FROM EMPLOYEES, DEPARTMENTS
    WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num
    GROUP BY dept_num)

SELECT MAX(NumEmployees) AS MaxEmployees
FROM SUBQUERY;

-- 20) Show the departments whose average salary is greater than the average of salaries of all employees. 

WITH SUBQUERY(Employ_AVG_Salary) AS (

    SELECT AVG(salary)
    FROM EMPLOYEES)

SELECT DEPARTMENTS.name, AVG(EMPLOYEES.SALARY) AS Depart_AVG_Salary
FROM EMPLOYEES, DEPARTMENTS, SUBQUERY
WHERE AVG(EMPLOYEES.SALARY) > Employ_AVG_Salary
GROUP BY DEPARTMENTS.name;

-- scalar

SELECT DEPARTMENTS.name, (SELECT AVG(salary) 
    FROM EMPLOYEES) AS Employ_AVG_Salary,  
    AVG(EMPLOYEES.SALARY) AS Depart_AVG_Salary
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num
GROUP BY DEPARTMENTS.name
HAVING Depart_AVG_Salary > Employ_AVG_Salary;

-- 21) Display the name of the department with more employees and its number of employees. Option 1: combine “having” and a subselect. In case of a tie, this option will show all the departments with a maximum number of employees.

-- Option 2

SELECT DEPARTMENTS.name, COUNT(*) AS NumEmployees
FROM EMPLOYEES, DEPARTMENTS
WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num
GROUP BY DEPARTMENTS.name
ORDER BY NumEmployees DESC
LIMIT 1;

-- Option 1

SELECT DEPARTMENTS.name, COUNT(*) AS NumEmployees
FROM EMPLOYEES, DEPARTMENTS
WHERE  DEPARTMENTS.num = EMPLOYEES.dept_num
GROUP BY DEPARTMENTS.name
HAVING NumEmployees = (
  SELECT MAX(NumEmployees)
  FROM (
    SELECT COUNT(*) AS NumEmployees
    FROM EMPLOYEES
    GROUP BY dept_num
  ) AS SUBQUERY
);

-- 22) Repeat 12 changing “union” for “intersect”. 


(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "RESEARCH")

INTERSECT

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "SALES");

-------------------------------------------------------

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'RESEARCH'
)

INTERSECT

SELECT OCCUPATIONS.name 
FROM EMPLOYEES, OCCUPATIONS 
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code AND dept_num = (
  SELECT num 
  FROM DEPARTMENTS 
  WHERE name = 'SALES'
);

-- 23) Repeat 22 but do not use the intersect operator to query the same data (clue: IN operator).

SELECT DISTINCT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "RESEARCH" AND
OCCUPATIONS.name

IN 

(SELECT OCCUPATIONS.name
FROM EMPLOYEES, DEPARTMENTS, OCCUPATIONS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num AND
EMPLOYEES.occu_code = OCCUPATIONS.code AND 
DEPARTMENTS.name = "SALES");
