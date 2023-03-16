-- Comando para ver todas las Views de la BBDD:

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'Views';

-- 1. Create a view (with name V_DEPARTMENTS) that shows all the departments with their number of employees and their town name.

CREATE VIEW V_DEPARTMENTS AS
    SELECT DEPARTMENTS.name, 
       CASE WHEN COUNT(EMPLOYEES.dept_num) IS NULL THEN 0
            ELSE COUNT(EMPLOYEES.dept_num)
       END AS NumEmployees
    FROM DEPARTMENTS
    LEFT JOIN EMPLOYEES ON EMPLOYEES.dept_num = DEPARTMENTS.num
    GROUP BY DEPARTMENTS.name;

+-----------------+--------------+
| name            | count(E.num) |
+-----------------+--------------+
| ACCOUNTING      |            2 |
| PRODUCTION      |            0 |
| RESEARCH        |            5 |
| SALES           |            6 |
+-----------------+--------------+

-- 2. Update the last view to add a field with the average salary of every department.

ALTER VIEW V_DEPARTMENTS AS
SELECT DEPARTMENTS.name, 
       CASE WHEN COUNT(EMPLOYEES.dept_num) IS NULL THEN 0
            ELSE COUNT(EMPLOYEES.dept_num)
       END AS NumEmployees,
       AVG(EMPLOYEES.salary) AS AVGSalary
    FROM DEPARTMENTS
    LEFT JOIN EMPLOYEES ON EMPLOYEES.dept_num = DEPARTMENTS.num
    GROUP BY DEPARTMENTS.name;

+------------+--------------+-----------+
| name       | NumEmployees | AVGSalary |
+------------+--------------+-----------+
| ACCOUNTING |            2 | 2287.5000 |
| RESEARCH   |            5 | 2620.0000 |
| SALES      |            6 | 1735.8333 |
| PRODUCTION |            0 |      NULL |
+------------+--------------+-----------+

-- 3. Insert a new departments and a new employee with salary 9000€ who belongs to the new department. Check if the data of the view changed automatically. Note that you must insert data into the tables EMPLOYEES and DEPARTMENTS (not into the view).

INSERT INTO DEPARTMENTS VALUES (60, 'HUMAN RESOURCES', 'MAD');

INSERT INTO EMPLOYEES VALUES (9999, 'FERNÁNDEZ', 'MIGUEL', NULL, '2019-01-01', 9000, NULL, 60, NULL);

-- Resultado después de los Inserts:

+-----------------+--------------+-----------+
| name            | NumEmployees | AVGSalary |
+-----------------+--------------+-----------+
| ACCOUNTING      |            2 | 2287.5000 |
| RESEARCH        |            5 | 2620.0000 |
| SALES           |            6 | 1735.8333 |
| PRODUCTION      |            0 |      NULL |
| HUMAN RESOURCES |            1 | 9000.0000 |
+-----------------+--------------+-----------+

-- Se modifica debido a que las Views no guardan la información de la consulta, si no la query en si, por lo que si se modifica la información y vuelve a seleccionar la consulta los datos salen modificados.

-- 4. Create a view (with name V_EMPLOYEES) that shows all the employees columns with the name of their occupation name instead of the occupation code and the name of their department instead of the department number. 

CREATE VIEW V_EMPLOYEES AS 
    SELECT EMPLOYEES.num,
    EMPLOYEES.name,
    EMPLOYEES.surname,
    DEPARTMENTS.name AS DepartName,
    OCCUPATIONS.name AS OccupationName,
    m2.surname AS ManagerSurname,
    EMPLOYEES.start_date, 
    EMPLOYEES.salary, 
    EMPLOYEES.commission
    FROM EMPLOYEES 
    LEFT OUTER JOIN DEPARTMENTS ON EMPLOYEES.dept_num = DEPARTMENTS.num
    LEFT OUTER JOIN OCCUPATIONS ON EMPLOYEES.occu_code = OCCUPATIONS.code
    LEFT OUTER JOIN EMPLOYEES m2 ON EMPLOYEES.manager = m2.num;

+------+----------+------------+-----------------+----------------+----------------+------------+--------+------------+
| num  | name     | surname    | DepartName      | OccupationName | ManagerSurname | start_date | salary | commission |
+------+----------+------------+-----------------+----------------+----------------+------------+--------+------------+
|  800 | ANTONIO  | BANDERAS   | RESEARCH        | NULL           | NULL           | 1991-01-09 |   2885 |       NULL |
| 7369 | SERGIO   | SÁNCHEZ    | NULL            | NULL           | FERNÁNDEZ      | 1990-12-17 |   1040 |       NULL |
| 7499 | MARTA    | ARROYO     | SALES           | SALESMAN       | AMER           | 1990-02-20 |   1500 |        390 |
| 7521 | MATEU    | AGUILO     | SALES           | SALESMAN       | AMER           | 1991-02-22 |   1625 |        650 |
| 7566 | JUDIT    | AROCA      | RESEARCH        | MANAGER        | NULL           | 1991-04-02 |   2900 |       NULL |
| 7654 | MONICA   | MARTÍN     | SALES           | SALESMAN       | AMER           | 1991-09-29 |   1600 |       1020 |
| 7698 | JOAN     | AMER       | SALES           | NULL           | NULL           | 1991-05-01 |   3005 |       NULL |
| 7782 | ENRIQUE  | COLOM      | ACCOUNTING      | MANAGER        | NULL           | 1991-06-09 |   2885 |       NULL |
| 7788 | JAVIER   | GIL        | RESEARCH        | ANALYST        | AROCA          | 1991-11-09 |   3000 |       NULL |
| 7844 | MANUEL   | TOVAR      | SALES           | SALESMAN       | AMER           | 1991-09-08 |   1350 |          0 |
| 7876 | FERNANDO | ALONSO     | RESEARCH        | EMPLOYEE       | GIL            | 1991-09-23 |   1430 |       NULL |
| 7900 | XAVIER   | JIMENO     | SALES           | EMPLOYEE       | AMER           | 1991-12-03 |   1335 |       NULL |
| 7902 | ANA      | FERNÁNDEZ  | NULL            | ANALYST        | AROCA          | 1991-12-03 |   3000 |       NULL |
| 7934 | ANTONIA  | MUÑOZ      | ACCOUNTING      | EMPLOYEE       | COLOM          | 1992-01-23 |   1690 |       NULL |
| 8001 | FERNANDA | RUIZ       | RESEARCH        | MANAGER        | NULL           | 1992-06-10 |   2885 |       NULL |
| 9999 | MIGUEL   | FERNÁNDEZ  | HUMAN RESOURCES | NULL           | NULL           | 2019-01-01 |   9000 |       NULL |
+------+----------+------------+-----------------+----------------+----------------+------------+--------+------------+

-- 5. Create a view (with name V_EMPLOYEES_FULL) using  V_EMPLOYEES that shows manager’s surname and name instead of manager num (you can NOT use the table EMPLOYEES you must use the view V_EMPLOYEES).

CREATE VIEW V_EMPLOYEES_FULL AS 
    SELECT num,
    name,
    surname,
    DepartName,
    OccupationName,
    CONCAT(name, " ", surname) AS ManagerFullName,
    start_date, 
    salary, 
    commission
    FROM V_EMPLOYEES;

+------+----------+------------+-----------------+----------------+-------------------+------------+--------+------------+
| num  | name     | surname    | DepartName      | OccupationName | ManagerFullName   | start_date | salary | commission |
+------+----------+------------+-----------------+----------------+-------------------+------------+--------+------------+
|  800 | ANTONIO  | BANDERAS   | RESEARCH        | NULL           | ANTONIO BANDERAS  | 1991-01-09 |   2885 |       NULL |
| 7369 | SERGIO   | SÁNCHEZ    | NULL            | NULL           | SERGIO SÁNCHEZ    | 1990-12-17 |   1040 |       NULL |
| 7499 | MARTA    | ARROYO     | SALES           | SALESMAN       | MARTA ARROYO      | 1990-02-20 |   1500 |        390 |
| 7521 | MATEU    | AGUILO     | SALES           | SALESMAN       | MATEU AGUILO      | 1991-02-22 |   1625 |        650 |
| 7566 | JUDIT    | AROCA      | RESEARCH        | MANAGER        | JUDIT AROCA       | 1991-04-02 |   2900 |       NULL |
| 7654 | MONICA   | MARTÍN     | SALES           | SALESMAN       | MONICA MARTÍN     | 1991-09-29 |   1600 |       1020 |
| 7698 | JOAN     | AMER       | SALES           | NULL           | JOAN AMER         | 1991-05-01 |   3005 |       NULL |
| 7782 | ENRIQUE  | COLOM      | ACCOUNTING      | MANAGER        | ENRIQUE COLOM     | 1991-06-09 |   2885 |       NULL |
| 7788 | JAVIER   | GIL        | RESEARCH        | ANALYST        | JAVIER GIL        | 1991-11-09 |   3000 |       NULL |
| 7844 | MANUEL   | TOVAR      | SALES           | SALESMAN       | MANUEL TOVAR      | 1991-09-08 |   1350 |          0 |
| 7876 | FERNANDO | ALONSO     | RESEARCH        | EMPLOYEE       | FERNANDO ALONSO   | 1991-09-23 |   1430 |       NULL |
| 7900 | XAVIER   | JIMENO     | SALES           | EMPLOYEE       | XAVIER JIMENO     | 1991-12-03 |   1335 |       NULL |
| 7902 | ANA      | FERNÁNDEZ  | NULL            | ANALYST        | ANA FERNÁNDEZ     | 1991-12-03 |   3000 |       NULL |
| 7934 | ANTONIA  | MUÑOZ      | ACCOUNTING      | EMPLOYEE       | ANTONIA MUÑOZ     | 1992-01-23 |   1690 |       NULL |
| 8001 | FERNANDA | RUIZ       | RESEARCH        | MANAGER        | FERNANDA RUIZ     | 1992-06-10 |   2885 |       NULL |
| 9999 | MIGUEL   | FERNÁNDEZ  | HUMAN RESOURCES | NULL           | MIGUEL FERNÁNDEZ  | 2019-01-01 |   9000 |       NULL |
+------+----------+------------+-----------------+----------------+-------------------+------------+--------+------------+

-- 6. Try to update the EMPLOYEE with number 9999 (for instance, try to change his/her surname) using the view V_EMPLOYEES. Did it work?

UPDATE V_EMPLOYEES SET surname = "Sánchez" WHERE num = 9999;

ERROR 1288 (HY000): The target table V_EMPLOYEES of the UPDATE is not updatable

-- No se puede actualizar debido a que la View utiliza varías tablas.

-- 7. Now insert a new employee using the view V_EMPLOYEES. Did it work? Why?

INSERT INTO V_EMPLOYEES VALUES (99999, 'Antonio', 'Maroto', 'PRODUCTION', 'SALESMAN', 'Férnandez', '1991-09-29', 100000, 0); 

ERROR 1471 (HY000): The target table V_EMPLOYEES of the INSERT is not insertable-into

-- Lo mismo de antes.
