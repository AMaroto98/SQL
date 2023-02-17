-- 1) What is the result of the following queries? Try to guess the result before trying them on a computer.

select null;

-- El resultado será Null

select null = 1;

-- El resultado seŕa Null

select null = null;

-- El resultado será Null

select (null=1) or (1=1);

-- El resultado es Null.
-- Antonio, espabila que el resultado es 1.

select (null=1) and (1=0);

-- El resultado es Null.
-- Antonio, espabila que el resultado es 0.

-- 2) Use the database sample at the end of this document. Try to guess the result of the following queries and then verify the result using the computer.

SELECT * FROM listofitem WHERE coname=NULL;

-- Empty set
-- Si se selecciona un null no sale nada.

SELECT * FROM listofitem WHERE coname<>NULL;

-- <> --> No es igual
-- Por qué no salen los dos que no son NULL?

-- Empty set

SELECT * FROM listofitem WHERE coname<=>NULL;

-- Al contrario que en el apartado anterior el operador <=> selecciona NUll

SELECT * FROM listofitem WHERE coname IS NULL;

-- Chocolate es la respuesta.

SELECT * FROM listofitem WHERE coname IS NOT NULL;

-- Selecciona las dos que no son Null.

SELECT * FROM listofitem WHERE coname = NULL OR NOT (coname = NULL);

-- Empty set. Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL);

-- Empty set. Mirar el motivo

SELECT * FROM listofitem WHERE coname NOT IN (NULL, 'ABJ ENTERPRISE');

-- Empty set. Mirar el motivo

SELECT 0 IS UNKNOWN;

-- False

SELECT 1 IS UNKNOWN;

-- False

SELECT NULL IS UNKNOWN;

-- True

SELECT (NULL = NULL) IN UNKNOWN;

-- Null

SELECT coname FROM listofitem;

-- Lo esperado

SELECT CONCAT(coname, 'is the best') FROM listofitem;

-- Concaternar String con null da null

SELECT CONCAT(coname, 'is the best') is UNKNOWN FROM listofitem;

-- El primero como es null es desconocido por eso da TRUE dado de NULL ES DESCONOCIDO

-- Los otros dos dan false porque se conoce su valor.







select name from instructor i1 WHERE exists (select name from instructor i2 where i2.salary < i1.salary);

select name from instructor i1 WHERE not exists (select name from instructor i2 where i2.salary < i1.salary);



select dept_name, avg(salary) from instructor group by dept_name having avg(salary) > 42000;

SELECT dept_name, avg_salary
from (
    select dept_name, avg(salary) as avg_salary 
    from instructor 
    group by dept_name) as subquery
    where avg_salary > 42000
;




SELECT dept_name, avg_salary
from (
    select dept_name, avg(salary) 
    from instructor 
    group by dept_name) as subquery(dept_name, avg_salary)
    where avg_salary > 42000;

-- Ahora en el as se renombran las columnas de la subquery, en lugar de renombrar solo una como en el primer caso se renombran todas y el efecto es el mismo. Esto en MARIADB peta, en MySQL no.


-- Lo mismo con el with
with subquery(dept_name, avg_salary) as
(
    select dept_name, avg(salary) 
    from instructor 
    group by dept_name) 

    select dept_name, avg_salary
    from subquery
    where avg_salary > 42000;






select dept_name from(
    SELECT max(budget) from department) as subquery

;
-- FIND ALL DEPARTMENTS WITH ALL MAXIMUM BUDGET.
-- Sin subquery

(SELECT D1.dept_name
FROM department D1) 

EXCEPT

(SELECT D1.dept_name
FROM department D1, department D2
WHERE D1.budget < D2.budget);


-- Con subquery

WITH subquery(MAX_BUDGET) AS(
    SELECT MAX(budget) AS MAX_BUDGET
    FROM department
)
SELECT dept_name, budget
FROM department, subquery
WHERE department.budget = subquery.MAX_BUDGET
GROUP BY dept_name;



-- Otra forma de hacerlo.
    
SELECT dept_name, budget
FROM department, (SELECT MAX(budget) AS MAX_BUDGET
    FROM department) as subquery
WHERE department.budget = subquery.MAX_BUDGET
GROUP BY dept_name;

-- Find all departments where the total salary is greater than the average of the total salary at all departments

-- Encuentre todos los departamentos en los que el salario total sea superior a la media de el salario total en todos los departamentos

-- 1) Calcular la suma de los salarios de los Departamentos.

SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name;

-- 2) Calcular el promedio de las sumas de los salarios de los departamentos.

WITH total_salary(dept_name, sum_salary) AS 
(SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name)
SELECT AVG(sum_salary)
FROM total_salary;

-- 3) Mostarar los departamentos donde la suma de los salarios sea superior al promedio de la suma de los salarios de los departamentos. 

-- Primera subquery
 WITH total_salary(dept_name, sum_salary) AS (SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name), 

-- Segunda subquery
avg_table(avg_colum) AS (SELECT AVG(sum_salary) FROM total_salary)

-- Consulta final
SELECT dept_name, sum_salary
FROM total_salary, avg_table
WHERE sum_salary > avg_colum;

WITH total_salary(dept_name, sum_salary) AS (SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name), 
avg_table(avg_colum) AS (SELECT AVG(sum_salary) FROM total_salary)
SELECT dept_name, sum_salary
FROM total_salary, avg_table
WHERE sum_salary > avg_colum;






WITH total_salary(dept_name, sum_salary) AS 
(SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name)
SELECT dept_name
FROM total_salary
GROUP BY dept_name
HAVING sum_salary > AVG(sum_salary);


-- Scalar subquerys

-- Se usan cuando podemos seleccionar valores de las subquerys, es decir, si lo que nos devuelve la subquery son números.

-- Número de instructores de cada departamento sin subquerys

SELECT department.dept_name, count(instructor.name) 
FROM department, instructor
WHERE department.dept_name = instructor.dept_name
GROUP BY department.dept_name;

SELECT dept_name, count(*) AS  Num_instructors
FROM instructor
GROUP BY dept_name;

-- Lo mismo son subquery scalar

SELECT dept_name, (SELECT count(*) AS  Num_instructors
FROM instructor
WHERE department.dept_name = instructor.dept_name)  as num_instructores
FROM department;

-- Contar número de instructores de cada edificio.
-- Si dijese que hay que contar todos incluidos los departamentos que tienen 0 instructores hay que usar subquerys si o si

-- Sin subquerys

SELECT building, count(*) AS num_instructores
FROM instructor, department 
WHERE instructor.dept_name = department.dept_name
GROUP BY building;

-- Con subquery

SELECT building, SUM((SELECT count(*) AS  Num_instructors
FROM instructor
WHERE department.dept_name = instructor.dept_name)) AS num_instructores
FROM department
GROUP BY building;



