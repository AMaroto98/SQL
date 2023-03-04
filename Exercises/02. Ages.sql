
-- Database: Exercise2 and Exercise1 (Datos nuevos, los comentados al final del documento)

-- 1) In the university database, find the names of the departments with a budget higher than the budget of the music department.

SELECT X.dept_name FROM department AS X, department AS Y WHERE X.budget > Y.budget AND Y.dept_name = "Music";

-- 2) Find the supervisor of the supervisor of the supervisor of Bob.

SELECT e2.supervisor FROM emp_super as e1, emp_super as e2. WHERE e1.person = "Bob" and e2.person = e1.supervisor

-- 3) Compute the age.

SELECT name, birthday, (DATE_FORMAT(NOW(), '%Y%m%d') - DATE_FORMAT(birthday, '%Y%m%d')) DIV 10000 AS age FROM person;