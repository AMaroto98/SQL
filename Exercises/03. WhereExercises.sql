-- 1) Based on the employees table below, select all fields from the employees table whose salary is less than or equal to $52,500 (no sorting is required):

SELECT * FROM employees WHERE salary <= 52500;

-- 2) Based on the suppliers table below, select the unique city values that reside in the state of California and order the results in descending order by city:

SELECT DISTINCT city FROM suppliers WHERE state = "California" ORDER BY city DESC;

-- 3) Based on the customers table and the orders table below, select the customer_id and last_name from the customers table and select the order_date from the orders table where there is a matching customer_id value in both the customers and orders tables. Order the results by customer_id in descending order.

SELECT customers.customer_id, customers.last_name, orders.order_date FROM customers, orders WHERE customers.customer_id = orders.customer_id ORDER BY customer_id DESC;

-- 4) Based on the customers and orders table from Practice Exercise #3, select the customer_id and last_name from the customers table where there is a record in the orders table for that customer_id. Order the results in ascending order by last_name and then descending order by customer_id.

SELECT customers.customer_id, customers.last_name FROM customers, orders WHERE customers.customer_id = orders.customer_id ORDER BY last_name ASC, customer_id DESC;

-- 5) Based on the orders table from Practice Exercise #3, select the distinct customer ids that placed orders in April 2016. Use the BETWEEN keyword.

SELECT DISTINCT customer_id FROM orders where order_date BETWEEN '2016-04-01' AND '2016-04-30';

-- 6) Based on the customers and orders table from Practice Exercise #3, select the last_name of the customers that placed orders in April, 2016. Use tuple comparison (month(order_date),year(order_date))=(4,2016)

SELECT DISTINCT customers.last_name FROM customers, orders WHERE (month(order_date), year(order_date)) = (4,2016);

-- 7) Based on the instructor table from the university database, compare the following two queries.
-- select * from instructor where (name = 'Mozart' or dept_name='Music') and salary=100000;
-- select * from instructor where name = 'Mozart' or (dept_name='Music' and salary=100000);
-- Explain why the results of the two queries are different if we simply change some parenthesis.


-- Los cambios que hay son mínimos, es debido a los paréntesis de las querys, en el primer caso seleccionará las personas que se llamen Mozart o trabajen en el departamento de Música y además de ello tengo un salario igual a 100000.

-- En el segundo caso se selecciona las personas que se llamen Mozart o trabajen en el departamento de Música y ganen un salario de 100000.