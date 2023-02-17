-- 1) Display the number of employees in each department. Use GROUP BY to group by department. 

SELECT dept_num, COUNT(*) AS Num_Empleados
FROM EMPLOYEES
GROUP BY dept_num;

-- Esta no sirve pero la dejo por si acaso.

SELECT DEPARTMENTS.name, COUNT(*) AS Num_Empleados
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.dept_num = DEPARTMENTS.num
GROUP BY DEPARTMENTS.name;

-- 2) For each occupation obtain the average salary. 

