
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



------------------------------------------------------------------------
DELETE
FROM instructor
WHERE dept_name IN (SELECT dept_name
                    FROM department
                    WHERE building = "Watson");

DELETE
FROM instructor
WHERE dept_name IN (SELECT dept_name
                FROM department
                WHERE budget < 80000);


INSERT INTO instructor
            SELECT ID, name, dept_name, 30000
            FROM student
            WHERE dept_name = "Music" AND tot_cred > 144;

INSERT INTO student VALUES (00129, "Chicote", "Music", 400);

update instructor 
set salary = salary * 1.05
where salary < (select avg(salary)
                from instructor);

-- Con AVG PETA MYSQL

update instructor
set salary = salary * 1.05
where salary < (select avg (salary)
from instructor);

update instructor
set salary = salary * 1.05
where salary > 100000;


update instructor
set salary = case 
                when salary > 100000 then salary * 1.03
                else salary * 1.05
                end;


UPDATE student
SET tot_cred = (SELECT SUM(credits)
                FROM takes, course
                WHERE takes.course_id = course.course_id
                AND student.ID = takes.ID
                AND takes.grade <> "F"
                AND takes.grade IS NOT NULL
                GROUP BY student.ID);


-- Esta está mal, no es específicamente lo que se pedía.

UPDATE student
SET tot_cred = (SELECT SUM(credits)
                FROM takes, course
                WHERE takes.course_id = course.course_id
                AND student.ID = takes.ID
                AND takes.grade <> "F"
                AND takes.grade IS NOT NULL
                GROUP BY student.ID), tot_cred =0
WHERE tot_cred IS NULL;

-- CON UN IF
UPDATE student
SET tot_cred = (SELECT IF (SUM(course.credits) IS NOT NULL, SUM(course.credits), 0)
                FROM takes, course
                WHERE takes.course_id = course.course_id
                AND student.ID = takes.ID
                AND takes.grade <> "F"
                AND takes.grade IS NOT NULL);



-- CON UN CASE
UPDATE student
SET tot_cred = (SELECT CASE
                WHEN sum(C.credits) IS NOT NULL THEN sum(C.credits)
                ELSE 0
                END
                FROM takes T, course C
                WHERE student.ID=T.ID
                AND T.course_id=C.course_id
                AND T.grade<>'F'
                AND T.grade IS NOT NULL
                );

  -- CON COALESCE function... 
  -- La función COALESCE en SQL se utiliza para seleccionar el primer valor no nulo de una lista de expresiones o valores.
  -- En lugar de nulo saldrá 0.
UPDATE student
SET tot_cred = (SELECT COALESCE(SUM(credits), 0) 
                FROM takes, course
                WHERE takes.course_id = course.course_id
                AND student.ID = takes.ID
                AND takes.grade <> "F"
                AND takes.grade IS NOT NULL);


--------------------------------------------------------------------------

-- SQL INTERMEDIO

-- Ejemplos de Join
SELECT name, building
FROM instructor JOIN department
ON instructor.dept_name = department.dept_name;

SELECT name
FROM instructor JOIN department
ON instructor.dept_name = department.dept_name
AND building = "Taylor";

-- Natural Join (No hace falta igualar las tablas)
-- Mismo ejemplo de antes con el natural Join
-- Existe pero no se usa.

SELECT name
FROM instructor NATURAL JOIN department
WHERE building = "Taylor";

SELECT name, grade
FROM student NATURAL JOIN course NATURAL JOIN takes
WHERE grade = "A";

-- Peligro del NATURAL JOIN 

select name, title
from student natural join takes, course
where takes.course_id = course.course_id;

select name, title
from student natural join takes natural join course;

-- La query no coge los alumnos que pertenecen a un departamento pero cursan un curso de otro departamento.

-- NO dan el mismo resultado. Esta pregunta puede caer en un examen tipo test, yo veo a Jaume capaz.

SELECT name, title
FROM student JOIN takes 
ON student.ID = takes.ID
JOIN course
ON course.course_id = takes.course_id;

-- Para no tener peridas de información se usa el OUTER JOIN

-- En la siguiente query no salen los NULLS

SELECT *
FROM instructor JOIN department
ON instructor.dept_name = department.dept_name;

-- Y AQUI SI SALE

SELECT *
FROM instructor RIGHT OUTER JOIN department
ON instructor.dept_name = department.dept_name;

SELECT *
FROM instructor LEFT OUTER JOIN department
ON instructor.dept_name = department.dept_name;

-- LEFT : TODAS LAS LINEAS DE LA TABLA DE LA IZQUIERDA, PRIMERA QUE APARECE

-- RIGHT : TODAS LAS LINEAS DE LA TABLA DE LA DERECHA, SEGUNDA QUE APARECE


-- MariaDB no soporta FULL OUTER JOIN 



-- Mirar cuantas views tengo guardadas!

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'University';

-- MariaDB no soporta Materialized Views.

-- UPDATE A VIEW

-- Asegúrate de que la vista se pueda actualizar: Para que una vista se pueda actualizar, debe cumplir ciertos requisitos, como que las columnas que se van a actualizar correspondan a una sola tabla, no se utilicen funciones agregadas, y no se utilicen cláusulas "GROUP BY" ni "HAVING". Si la vista no cumple con estos requisitos, es posible que no puedas actualizarla directamente.

-- Si hago un update de una view funciona si solo tiene una tablas
-- Si hay dos tablas relacionadas puede petar
-- La inserción de vistas funciona a veces, esa es la idea que Jaume quiere que nos quedemos.


-- TRANSACTIONS

-- La transacción se empiza con el begin; o un start transaction;
-- Con el commit guardamos los cambios para siempre
-- Rollback, deshace lo que se ha hecho, como en los servidores del WOW.

-- se pueden hacer savepoint <nombre> para que cuando hagamos rollback volvamos ahí.
-- rollback to <nombre del savepoint>

-- dentro de las transaciones solo puedo hacer update y poco más, cualquier otra cosa hace commit instantaneo

set autocommit=off;

-- Con el comando anterior se pueden borrar tablas en transactions y hacer un rollback.

-- Integrity Constraint 

CREATE TABLE Chicote (
    name VARCHAR(25) NOT NULL,
    telephone VARCHAR(12) NOT NULL,
    countryCode VARCHAR(5),
    localNumber VARCHAR(3),
    UNIQUE (countryCode, localNumber)
);

INSERT INTO Chicote VALUES ("Xoxo2", "3456789", NULL, NULL);


create table section
(course_id varchar (8),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
building varchar (15),
room_number varchar (7),
time_slot_id varchar (4),
primary key (course_id, sec_id, semester, year),
check (semester in ('Fall', 'Winter', 'Spring', 'Summer')));

-- NO funciona
insert into section (semester, course_id, sec_id, year) VALUES ("Chicote", "mojon", "pito", 2030);

-- Si funciona
insert into section (semester, course_id, sec_id, year) VALUES ("Fall", "mojon", "pito", 2030);