-- 1) Write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount.

SELECT SUM(pur_amt) AS Total_Pur_Amt FROM orders;

-- 2) Write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount.

SELECT AVG(pur_amt) AS AVG_Pur_Amt FROM orders;

-- 3) Write a SQL query that counts the number of salespeople. Return number of salespeople.

SELECT COUNT(salesman_id) AS Salespeople FROM salesman;

-- 4) Write a SQL query to count the number of customers. Return number of customers.

SELECT COUNT(customer_id) AS Customers FROM customer;

-- 5) Count the number of customers that have a value of ‘grade’ different from null.

SELECT COUNT(customer_id) AS Customer FROM customer where grade IS NOT NULL;

-- 6) Find the maximum purchase amount.

SELECT MAX(pur_amt) AS Max_Pur_Amt FROM orders;

-- 7) Find the minimum purchase amount.

SELECT MIN(pur_amt) AS Min_Pur_Amt FROM orders;

-- 8) Write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.

SELECT city, MAX(grade) AS Max_Grade FROM customer GROUP BY city;

-- 9) Write a SQL query to find the highest purchase amount by each customer. Return customer ID, maximum purchase amount.

SELECT customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY customer_id;

-- 10) Write a SQL query to find the highest purchase amount by each customer on each date. Return customer_id, order date and highest purchase amount.

SELECT ord_date, customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY ord_date, customer_id;

-- 11) Write a SQL query to determine the highest purchase amount made by each salesperson in 2020. Return salesperson ID, purchase amount.

SELECT salesman_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders WHERE YEAR (ord_date) = '2020' GROUP BY salesman_id;

-- 12) Find the maximum purchase amount for each customer each day. Show only  the results where the maximum purchase exceeds 5000.

SELECT ord_date, customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY ord_date, customer_id HAVING MAX(pur_amt) > 5000;

-- 13) Find the maximum purchase amount for each customer each day. Show only  the results where the maximum purchase is between 3000 and 7000. 

SELECT ord_date, customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY ord_date, customer_id HAVING MAX(pur_amt) BETWEEN 3000 AND 7000;

-- 14) Find the maximum purchase amount for each customer each day. Show only  the results where the maximum purchase is either 10000, 8700 or 1500.

SELECT ord_date, customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY ord_date, customer_id HAVING MAX(pur_amt) = 10000 OR MAX(pur_amt) = 8700 OR MAX(pur_amt) = 1500;

-- Preguntar a ver si hay alguna otra forma de sacar la query.

-- 15) Find the maximum purchase amount for each customer each day. Show only  the results where the customer_id is between 250 and 450. 

SELECT ord_date, customer_id, MAX(pur_amt) AS Max_Pur_Amt FROM orders GROUP BY ord_date, customer_id HAVING customer_id BETWEEN 250 AND 450;

-- 16) Find the maximum order for each customer for customers with id between 200 and 400. Show only the results where the maximum order is higher than 9000. Return customer id and maximum purchase amount.

SELECT MAX(pur_amt), customer_id FROM orders GROUP BY customer_id HAVING (customer_id BETWEEN 200 AND 400) AND MAX(pur_amt) > 9000; 

-- 17) Find the maximum order for each salesman for salesmen with id between 15 and 40. Return salesperson id and maximum purchase amount.

SELECT MAX(pur_amt), salesman_id FROM orders GROUP BY salesman_id HAVING salesman_id BETWEEN 15 AND 40; 

-- 18) Count the orders on 2020-03-25.

SELECT COUNT(ord_date) AS Orders FROM orders WHERE ord_date = '2020-03-25';

-- 19) Count the number of salesmen that have a city (City is not null).

SELECT COUNT(salesman_id) AS Salesman FROM salesman WHERE city IS NOT NULL;

-- 20) List the number of orders for each salesperson and date.

SELECT salesman_id, ord_date, COUNT(ord_no) FROM orders GROUP BY ord_date, salesman_id; 