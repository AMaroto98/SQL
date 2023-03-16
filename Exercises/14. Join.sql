-- 1. Show the full name of employees, salary and occupation name. Sort the results by full name. Make four versions:

-- Using an explicit inner join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
ORDER BY FullName;

+-----------------+--------+----------+
| FullName        | salary | name     |
+-----------------+--------+----------+
| ANA FERNÁNDEZ   |   3000 | ANALYST  |
| ANTONIA MUÑOZ   |   1690 | EMPLOYEE |
| ENRIQUE COLOM   |   2885 | MANAGER  |
| FERNANDA RUIZ   |   2885 | MANAGER  |
| FERNANDO ALONSO |   1430 | EMPLOYEE |
| JAVIER GIL      |   3000 | ANALYST  |
| JOSEP AGUILO    |   1625 | SALESMAN |
| JUDIT AROCA     |   2900 | MANAGER  |
| LUIS TOVAR      |   1350 | SALESMAN |
| MARTA ARROYO    |   1500 | SALESMAN |
| MONICA MARTÍN   |   1600 | SALESMAN |
| XAVIER JIMENO   |   1335 | EMPLOYEE |
+-----------------+--------+----------+

-- Using an implicit inner join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code
ORDER BY FullName;

+-----------------+--------+----------+
| FullName        | salary | name     |
+-----------------+--------+----------+
| ANA FERNÁNDEZ   |   3000 | ANALYST  |
| ANTONIA MUÑOZ   |   1690 | EMPLOYEE |
| ENRIQUE COLOM   |   2885 | MANAGER  |
| FERNANDA RUIZ   |   2885 | MANAGER  |
| FERNANDO ALONSO |   1430 | EMPLOYEE |
| JAVIER GIL      |   3000 | ANALYST  |
| JOSEP AGUILO    |   1625 | SALESMAN |
| JUDIT AROCA     |   2900 | MANAGER  |
| LUIS TOVAR      |   1350 | SALESMAN |
| MARTA ARROYO    |   1500 | SALESMAN |
| MONICA MARTÍN   |   1600 | SALESMAN |
| XAVIER JIMENO   |   1335 | EMPLOYEE |
+-----------------+--------+----------+

-- Using a left outer join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
ORDER BY FullName;

+------------------+--------+----------+
| FullName         | salary | name     |
+------------------+--------+----------+
| ANA FERNÁNDEZ    |   3000 | ANALYST  |
| ANTONIA MUÑOZ    |   1690 | EMPLOYEE |
| ANTONIO BANDERAS |   2885 | NULL     |
| BARTOLOME AMER   |   3005 | NULL     |
| ENRIQUE COLOM    |   2885 | MANAGER  |
| FERNANDA RUIZ    |   2885 | MANAGER  |
| FERNANDO ALONSO  |   1430 | EMPLOYEE |
| JAVIER GIL       |   3000 | ANALYST  |
| JOSEP AGUILO     |   1625 | SALESMAN |
| JUDIT AROCA      |   2900 | MANAGER  |
| LUIS TOVAR       |   1350 | SALESMAN |
| MARTA ARROYO     |   1500 | SALESMAN |
| MONICA MARTÍN    |   1600 | SALESMAN |
| SERGIO SÁNCHEZ   |   1040 | NULL     |
| XAVIER JIMENO    |   1335 | EMPLOYEE |
+------------------+--------+----------+

-- Using a right outer join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
ORDER BY FullName;

+-----------------+--------+-----------+
| FullName        | salary | name      |
+-----------------+--------+-----------+
| NULL            |   NULL | PRESIDENT |
| ANA FERNÁNDEZ   |   3000 | ANALYST   |
| ANTONIA MUÑOZ   |   1690 | EMPLOYEE  |
| ENRIQUE COLOM   |   2885 | MANAGER   |
| FERNANDA RUIZ   |   2885 | MANAGER   |
| FERNANDO ALONSO |   1430 | EMPLOYEE  |
| JAVIER GIL      |   3000 | ANALYST   |
| JOSEP AGUILO    |   1625 | SALESMAN  |
| JUDIT AROCA     |   2900 | MANAGER   |
| LUIS TOVAR      |   1350 | SALESMAN  |
| MARTA ARROYO    |   1500 | SALESMAN  |
| MONICA MARTÍN   |   1600 | SALESMAN  |
| XAVIER JIMENO   |   1335 | EMPLOYEE  |
+-----------------+--------+-----------+

-- 2. Repeat the queries showing only employees whose salary is not between 1100 and 2000

-- Using an explicit inner join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000
ORDER BY FullName;

+----------------+--------+---------+
| FullName       | salary | name    |
+----------------+--------+---------+
| ANA FERNÁNDEZ  |   3000 | ANALYST |
| ENRIQUE COLOM  |   2885 | MANAGER |
| FERNANDA RUIZ  |   2885 | MANAGER |
| JAVIER GIL     |   3000 | ANALYST |
| JUDIT AROCA    |   2900 | MANAGER |
+----------------+--------+---------+

-- Using an implicit inner join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000
ORDER BY FullName;

+----------------+--------+---------+
| FullName       | salary | name    |
+----------------+--------+---------+
| ANA FERNÁNDEZ  |   3000 | ANALYST |
| ENRIQUE COLOM  |   2885 | MANAGER |
| FERNANDA RUIZ  |   2885 | MANAGER |
| JAVIER GIL     |   3000 | ANALYST |
| JUDIT AROCA    |   2900 | MANAGER |
+----------------+--------+---------+

-- Using a left outer join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000
ORDER BY FullName;

+------------------+--------+---------+
| FullName         | salary | name    |
+------------------+--------+---------+
| ANA FERNÁNDEZ    |   3000 | ANALYST |
| ANTONIA MUÑOZ    |   1690 | NULL    |
| ANTONIO BANDERAS |   2885 | NULL    |
| BARTOLOME AMER   |   3005 | NULL    |
| ENRIQUE COLOM    |   2885 | MANAGER |
| FERNANDA RUIZ    |   2885 | MANAGER |
| FERNANDO ALONSO  |   1430 | NULL    |
| JAVIER GIL       |   3000 | ANALYST |
| JOSEP AGUILO     |   1625 | NULL    |
| JUDIT AROCA      |   2900 | MANAGER |
| LUIS TOVAR       |   1350 | NULL    |
| MARTA ARROYO     |   1500 | NULL    |
| MONICA MARTÍN    |   1600 | NULL    |
| SERGIO SÁNCHEZ   |   1040 | NULL    |
| XAVIER JIMENO    |   1335 | NULL    |
+------------------+--------+---------+

-- Using a right outer join

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, EMPLOYEES.salary, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code
AND EMPLOYEES.salary NOT BETWEEN 1100 AND 2000
ORDER BY FullName;

+----------------+--------+-----------+
| FullName       | salary | name      |
+----------------+--------+-----------+
| NULL           |   NULL | EMPLOYEE  |
| NULL           |   NULL | PRESIDENT |
| NULL           |   NULL | SALESMAN  |
| ANA FERNÁNDEZ  |   3000 | ANALYST   |
| ENRIQUE COLOM  |   2885 | MANAGER   |
| FERNANDA RUIZ  |   2885 | MANAGER   |
| JAVIER GIL     |   3000 | ANALYST   |
| JUDIT AROCA    |   2900 | MANAGER   |
+----------------+--------+-----------+

-- 3. Select the surname and occupation of the employees of department number 20 (show occupation name instead occupation code). Make four versions:

-- Using an explicit inner join,

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

+---------+----------+
| surname | name     |
+---------+----------+
| AROCA   | MANAGER  |
| GIL     | ANALYST  |
| ALONSO  | EMPLOYEE |
| RUIZ    | MANAGER  |
+---------+----------+

-- Using an implicit inner join

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
WHERE EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

+---------+----------+
| surname | name     |
+---------+----------+
| AROCA   | MANAGER  |
| GIL     | ANALYST  |
| ALONSO  | EMPLOYEE |
| RUIZ    | MANAGER  |
+---------+----------+

-- Using a left outer join

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES LEFT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

+------------+----------+
| surname    | name     |
+------------+----------+
| BANDERAS   | NULL     |
| SÁNCHEZ    | NULL     |
| ARROYO     | NULL     |
| AGUILO     | NULL     |
| AROCA      | MANAGER  |
| MARTÍN     | NULL     |
| AMER       | NULL     |
| COLOM      | NULL     |
| GIL        | ANALYST  |
| TOVAR      | NULL     |
| ALONSO     | EMPLOYEE |
| JIMENO     | NULL     |
| FERNÁNDEZ  | NULL     |
| MUÑOZ      | NULL     |
| RUIZ       | MANAGER  |
+------------+----------+

-- Using a right outer join.

SELECT EMPLOYEES.surname, OCCUPATIONS.name
FROM EMPLOYEES RIGHT OUTER JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND EMPLOYEES.dept_num = 20;

+---------+-----------+
| surname | name      |
+---------+-----------+
| GIL     | ANALYST   |
| ALONSO  | EMPLOYEE  |
| AROCA   | MANAGER   |
| RUIZ    | MANAGER   |
| NULL    | PRESIDENT |
| NULL    | SALESMAN  |
+---------+-----------+

-- 4. Show employee full name of the employees with no occupation and no department (sorted by full name).

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName
FROM EMPLOYEES
WHERE occu_code IS NULL AND dept_num IS NULL
ORDER BY FullName;

+--------+----------+
| name   | surname  |
+--------+----------+
| SERGIO | SÁNCHEZ  |
+--------+----------+

-- 5. Show the full names of the employees and occupation name whose occupation is neither "MANAGER" nor "EMPLOYEE" (=”occupation is not manager and is not employee”) and also have a salary higher than 2000.

SELECT CONCAT(EMPLOYEES.name, " ", EMPLOYEES.surname) AS FullName, OCCUPATIONS.name
FROM EMPLOYEES JOIN OCCUPATIONS
ON EMPLOYEES.occu_code = OCCUPATIONS.code 
AND (OCCUPATIONS.name <> "MANAGER" OR "EMPLOYEE")
AND (EMPLOYEES.salary > 2000);

+----------------+---------+
| FullName       | name    |
+----------------+---------+
| JAVIER GIL     | ANALYST |
| ANA FERNÁNDEZ  | ANALYST |
+----------------+---------+

-- 6. Show all the data of all the employees (show department name instead department code, occupation name instead occupation code and manager surname instead manager num). Make two versions:

-- Falta la parte de los managers

-- Using INNER JOIN.

SELECT EMPLOYEES.num,
EMPLOYEES.name,
EMPLOYEES.surname,
DEPARTMENTS.name AS DepartName,
OCCUPATIONS.name AS OccupationName,
EMPLOYEES.name AS ManagerName,
EMPLOYEES.start_date, 
EMPLOYEES.salary, 
EMPLOYEES.commission
FROM EMPLOYEES 
INNER JOIN DEPARTMENTS ON EMPLOYEES.dept_num = DEPARTMENTS.num
INNER JOIN OCCUPATIONS ON EMPLOYEES.occu_code = OCCUPATIONS.code
INNER JOIN EMPLOYEES m2 ON EMPLOYEES.manager = m2.num;


-- Using LEFT OUTER JOIN.




-- 7. Show the data of the employees whose salary is greater than 2000  (show department name instead department code, occupation name instead occupation code and manager surname instead manager num). Make two versions:

-- EN AMBAS FALTA LA PARTE DE LOS MANAGERS QUE TODAVÍA NO SÉ COMO PONERLA PARA QUE SALGA TODO.

-- Using INNER JOIN

-- EMPLOYEES.name AS ManagerName,

SELECT 
EMPLOYEES.num,
EMPLOYEES.name,
EMPLOYEES.surname,
DEPARTMENTS.name AS DepartName,
OCCUPATIONS.name AS OccupationName,
EMPLOYEES.start_date, 
EMPLOYEES.salary, 
EMPLOYEES.commission
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.dept_num = DEPARTMENTS.num
INNER JOIN OCCUPATIONS ON EMPLOYEES.occu_code = OCCUPATIONS.code
WHERE EMPLOYEES.salary > 2000;

+------+----------+---------+------------+----------------+------------+--------+------------+
| num  | name     | surname | DepartName | OccupationName | start_date | salary | commission |
+------+----------+---------+------------+----------------+------------+--------+------------+
| 7566 | JUDIT    | AROCA   | RESEARCH   | MANAGER        | 1991-04-02 |   2900 |       NULL |
| 7782 | ENRIQUE  | COLOM   | ACCOUNTING | MANAGER        | 1991-06-09 |   2885 |       NULL |
| 7788 | JAVIER   | GIL     | RESEARCH   | ANALYST        | 1991-11-09 |   3000 |       NULL |
| 8001 | FERNANDA | RUIZ    | RESEARCH   | MANAGER        | 1992-06-10 |   2885 |       NULL |
+------+----------+---------+------------+----------------+------------+--------+------------+

-- Using LEFT OUTER JOIN

-- EMPLOYEES.name AS ManagerName,

SELECT 
EMPLOYEES.num,
EMPLOYEES.name,
EMPLOYEES.surname,
DEPARTMENTS.name AS DepartName,
OCCUPATIONS.name AS OccupationName,
EMPLOYEES.start_date, 
EMPLOYEES.salary, 
EMPLOYEES.commission
FROM EMPLOYEES
LEFT OUTER JOIN DEPARTMENTS ON EMPLOYEES.dept_num = DEPARTMENTS.num
LEFT OUTER JOIN OCCUPATIONS ON EMPLOYEES.occu_code = OCCUPATIONS.code
WHERE EMPLOYEES.salary > 2000;


+------+-----------+------------+------------+----------------+------------+--------+------------+
| num  | name      | surname    | DepartName | OccupationName | start_date | salary | commission |
+------+-----------+------------+------------+----------------+------------+--------+------------+
|  800 | ANTONIO   | BANDERAS   | RESEARCH   | NULL           | 1991-01-09 |   2885 |       NULL |
| 7566 | JUDIT     | AROCA      | RESEARCH   | MANAGER        | 1991-04-02 |   2900 |       NULL |
| 7698 | BARTOLOME | AMER       | SALES      | NULL           | 1991-05-01 |   3005 |       NULL |
| 7782 | ENRIQUE   | COLOM      | ACCOUNTING | MANAGER        | 1991-06-09 |   2885 |       NULL |
| 7788 | JAVIER    | GIL        | RESEARCH   | ANALYST        | 1991-11-09 |   3000 |       NULL |
| 7902 | ANA       | FERNÁNDEZ  | NULL       | ANALYST        | 1991-12-03 |   3000 |       NULL |
| 8001 | FERNANDA  | RUIZ       | RESEARCH   | MANAGER        | 1992-06-10 |   2885 |       NULL |
+------+-----------+------------+------------+----------------+------------+--------+------------+

-- 8.- Show number of employees per department considering employees with no department (clue: two queries with UNION).

-- Lo hago sin Union 

SELECT DEPARTMENTS.name,
COUNT(*) AS NumEmployees
FROM EMPLOYEES LEFT JOIN DEPARTMENTS 
ON EMPLOYEES.dept_num = DEPARTMENTS.num
GROUP BY EMPLOYEES.dept_num;

+------------+--------------+
| name       | NumEmployees |
+------------+--------------+
| NULL       |            2 |
| ACCOUNTING |            2 |
| RESEARCH   |            5 |
| SALES      |            6 |
+------------+--------------+