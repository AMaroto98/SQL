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

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'Views';


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

MariaDB [views]> select * from V_EMPLOYEES;
MariaDB [views]> select * from V_EMPLOYEES;
+------+------------+----------+---------+------------+--------+------------+-----------------+----------+
| num  | surname    | E_name   | manager | start_date | salary | commission | D_name          | O_name   |
+------+------------+----------+---------+------------+--------+------------+-----------------+----------+
|  800 | BANDERAS   | ANTONIO  |    NULL | 1991-01-09 |   2885 |       NULL | RESEARCH        | NULL     |
| 7369 | SÁNCHEZ    | SERGIO   |    7902 | 1990-12-17 |   1040 |       NULL | NULL            | NULL     |
| 7499 | ARROYO     | MARTA    |    7698 | 1990-02-20 |   1500 |        390 | SALES           | SALESMAN |
| 7521 | AGUILO     | MATEU    |    7698 | 1991-02-22 |   1625 |        650 | SALES           | SALESMAN |
| 7566 | AROCA      | JUDIT    |    7839 | 1991-04-02 |   2900 |       NULL | RESEARCH        | MANAGER  |
| 7654 | MARTÍN     | MONICA   |    7698 | 1991-09-29 |   1600 |       1020 | SALES           | SALESMAN |
| 7698 | AMER       | JOAN     |    7839 | 1991-05-01 |   3005 |       NULL | SALES           | NULL     |
| 7782 | COLOM      | ENRIQUE  |    7839 | 1991-06-09 |   2885 |       NULL | ACCOUNTING      | MANAGER  |
| 7788 | GIL        | JAVIER   |    7566 | 1991-11-09 |   3000 |       NULL | RESEARCH        | ANALYST  |
| 7844 | TOVAR      | MANUEL   |    7698 | 1991-09-08 |   1350 |          0 | SALES           | SALESMAN |
| 7876 | ALONSO     | FERNANDO |    7788 | 1991-09-23 |   1430 |       NULL | RESEARCH        | EMPLOYEE |
| 7900 | JIMENO     | XAVIER   |    7698 | 1991-12-03 |   1335 |       NULL | SALES           | EMPLOYEE |
| 7902 | FERNÁNDEZ  | ANA      |    7566 | 1991-12-03 |   3000 |       NULL | NULL            | ANALYST  |
| 7934 | MUÑOZ      | ANTONIA  |    7782 | 1992-01-23 |   1690 |       NULL | ACCOUNTING      | EMPLOYEE |
| 8001 | RUIZ       | FERNANDA |    7839 | 1992-06-10 |   2885 |       NULL | RESEARCH        | MANAGER  |
| 9999 | FERNÁNDEZ  | MIGUEL   |    NULL | 2019-01-01 |   9000 |       NULL | HUMAN RESOURCES | NULL     |
+------+------------+----------+---------+------------+--------+------------+-----------------+----------+
16 rows in set (0,003 sec)



5. Create a view (with name V_EMPLOYEES_FULL) using  V_EMPLOYEES that shows manager’s surname and name instead of manager num (you can NOT use the table EMPLOYEES you must use the view V_EMPLOYEES).

MariaDB [views]> select * from V_EMPLOYEES_FULL;
+------+------------+----------+----------------+------------+--------+------------+-----------------+----------+
| num  | surname    | E_name   | M_surname_name | start_date | salary | commission | D_name          | O_name   |
+------+------------+----------+----------------+------------+--------+------------+-----------------+----------+
|  800 | BANDERAS   | ANTONIO  | NULL           | 1991-01-09 |   2885 |       NULL | RESEARCH        | NULL     |
| 7369 | SÁNCHEZ    | SERGIO   | FERNÁNDEZ ANA  | 1990-12-17 |   1040 |       NULL | NULL            | NULL     |
| 7499 | ARROYO     | MARTA    | AMER JOAN      | 1990-02-20 |   1500 |        390 | SALES           | SALESMAN |
| 7521 | AGUILO     | MATEU    | AMER JOAN      | 1991-02-22 |   1625 |        650 | SALES           | SALESMAN |
| 7566 | AROCA      | JUDIT    | NULL           | 1991-04-02 |   2900 |       NULL | RESEARCH        | MANAGER  |
| 7654 | MARTÍN     | MONICA   | AMER JOAN      | 1991-09-29 |   1600 |       1020 | SALES           | SALESMAN |
| 7698 | AMER       | JOAN     | NULL           | 1991-05-01 |   3005 |       NULL | SALES           | NULL     |
| 7782 | COLOM      | ENRIQUE  | NULL           | 1991-06-09 |   2885 |       NULL | ACCOUNTING      | MANAGER  |
| 7788 | GIL        | JAVIER   | AROCA JUDIT    | 1991-11-09 |   3000 |       NULL | RESEARCH        | ANALYST  |
| 7844 | TOVAR      | MANUEL   | AMER JOAN      | 1991-09-08 |   1350 |          0 | SALES           | SALESMAN |
| 7876 | ALONSO     | FERNANDO | GIL JAVIER     | 1991-09-23 |   1430 |       NULL | RESEARCH        | EMPLOYEE |
| 7900 | JIMENO     | XAVIER   | AMER JOAN      | 1991-12-03 |   1335 |       NULL | SALES           | EMPLOYEE |
| 7902 | FERNÁNDEZ  | ANA      | AROCA JUDIT    | 1991-12-03 |   3000 |       NULL | NULL            | ANALYST  |
| 7934 | MUÑOZ      | ANTONIA  | COLOM ENRIQUE  | 1992-01-23 |   1690 |       NULL | ACCOUNTING      | EMPLOYEE |
| 8001 | RUIZ       | FERNANDA | NULL           | 1992-06-10 |   2885 |       NULL | RESEARCH        | MANAGER  |
| 9999 | FERNÁNDEZ  | MIGUEL   | NULL           | 2019-01-01 |   9000 |       NULL | HUMAN RESOURCES | NULL     |
+------+------------+----------+----------------+------------+--------+------------+-----------------+----------+
16 rows in set (0,003 sec)




6. Try to update the EMPLOYEE with number 9999 (for instance, try to change his/her surname) using the view V_EMPLOYEES. Did it work?

7. Now insert a new employee using the view V_EMPLOYEES. Did it work? Why?
