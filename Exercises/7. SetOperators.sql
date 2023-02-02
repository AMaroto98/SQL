-- 1) Find all the names of all the salesman and customers.

SELECT cust_name FROM customer

UNION

SELECT name FROM salesman;

-- 2) Find all the cities where there are salesman and all the cities where there are customers. Include duplicates.

SELECT city FROM customer

UNION ALL

SELECT city FROM salesman;

-- 3) Find all the cities where there are salesman and customers.

SELECT city FROM customer

INTERSECT

SELECT city FROM salesman;

-- 4) Find all the customers and salesmen that live in Bengalore. Label the column customers_and_salesmen.

SELECT cust_name AS customers_and_salesmen FROM customer WHERE city = 'Bengalore'

UNION

SELECT name FROM salesman WHERE city = 'Bengalore';

-- 5) Find all the cities in which there is either a customer or a salesman involved in an order.

SELECT salesman.city FROM salesman, orders WHERE salesman.salesman_id = orders.salesman_id

UNION

SELECT customer.city FROM customer, orders WHERE customer.customer_id = orders.customer_id;

-- 6) Change the output of the grade column to pass if the grade is greater than or equal to 5 or fail if the grade is less than 5.

SELECT name, 'pass' AS result FROM student WHERE grade >= 5

UNION

SELECT name, 'fail' AS result FROM student WHERE grade < 5;

-- 7) Create a problem and (the solution) using set operators.

-- Encuentra todas las ciudades en las que no hay un cliente o un vendedor implicado en un pedido.

SELECT salesman.city FROM salesman, orders WHERE salesman.salesman_id = orders.salesman_id

EXCEPT

SELECT customer.city FROM customer, orders WHERE customer.customer_id = orders.customer_id;