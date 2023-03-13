-- 1. Show the full name of employees, salary and occupation name. Sort the results by full name. Make four versions:

-- Using an explicit inner join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code;

-- Using an implicit inner join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code;

-- Using a left outer join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code;

-- Using a right outer join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code;

-- 2. Repeat the queries showing only employees whose salary is not between 1100 and 2000

-- Using an explicit inner join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000;

-- Using an implicit inner join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000;

-- Using a left outer join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000;

-- Using a right outer join

SELECT EMPLOYEES.name, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000;

-- 3. Select the surname and occupation of the employees of department number 20 (show occupation name instead occupation code). Make four versions:

-- Using an explicit inner join,

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

-- Using an implicit inner join

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

-- Using a left outer join

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

-- Using a right outer join.

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

-- 4. Show employee full name of the employees with no occupation and no department (sorted by full name).

SELECT name, surname
FROM EMPLOYEES
WHERE occu_code IS NULL AND dept_num IS NULL;

-- 5. Show the full names of the employees and occupation name whose occupation is neither "MANAGER" nor "EMPLOYEE" (=”occupation is not manager and is not employee”) and also have a salary higher than 2000.

SELECT EMPLOYEES.name, EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND (OCCUPATIONS.name <> "MANAGER" OR "EMPLOYEE")
AND (EMPLOYEES.salary > 2000);

-- 6. Show all the data of all the employees (show department name instead department code, occupation name instead occupation code and manager surname instead manager num). Make two versions:

-- Using INNER JOIN.



-- Using LEFT OUTER JOIN.

-- 7. Show the data of the employees whose salary is greater than 2000  (show department name instead department code, occupation name instead occupation code and manager surname instead manager num). Make two versions:
-- Using INNER JOIN.
-- Using LEFT OUTER JOIN.

-- 8.- Show number of employees per department considering employees with no department (clue: two queries with UNION).
