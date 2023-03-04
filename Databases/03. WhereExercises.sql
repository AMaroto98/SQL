DROP DATABASE IF EXISTS WhereExercises;
CREATE DATABASE WhereExercises;
USE WhereExercises;

CREATE TABLE employees (
    employee_number INT NOT NULL,
    last_name CHAR(50) NOT NULL,
    first_name CHAR(50) NOT NULL,
    salary INT,
    dept_id INT,
    CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);

CREATE TABLE suppliers( 
    supplier_id INT NOT NULL,
    supplier_name CHAR(50) NOT NULL,
    city CHAR(50),
    state CHAR(25),
    CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

CREATE TABLE customers ( 
    customer_id INT NOT NULL,
    last_name CHAR(50) NOT NULL,
    first_name CHAR(50) NOT NULL,
    favorite_website CHAR(50),
    CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE orders ( 
    order_id INT NOT NULL,
    customer_id INT,
    order_date date,
    CONSTRAINT orders_pk PRIMARY KEY (order_id)
);


-- Data Employees

INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (1001, 'Smith', 'John', 62000, 500);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (1002, 'Anderson', 'Jane', 57500, 500);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (1003, 'Everest', 'Brad', 71000, 501);
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (1004, 'Horvath', 'Jack', 42000, 501);

-- Data Suppliers

INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (100, 'Microsoft', 'Redmond', 'Washington');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (200, 'Google', 'Mountain View', 'California');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (300, 'Oracle', 'Redwood City', 'California');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (400, 'Kimberly-Clark', 'Irving', 'Texas');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (500, 'Tyson Foods', 'Springdale', 'Arkansas');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (600, 'SC Johnson', 'Racine', 'Wisconsin');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (700, 'Dole Food Company', 'Westlake Village', 'California');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (800, 'Flowers Foods', 'Thomasville', 'Georgia');
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (900, 'Electronic Arts', 'Redwood City', 'California');

-- Data Customers

INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (4000, 'Jackson', 'Joe', 'techonthenet.com');
INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (5000, 'Smith', 'Jane', 'digminecraft.com');
INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (6000, 'Ferguson', 'Samantha', 'bigactivities.com');
INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (7000, 'Reynolds', 'Allen', 'checkyourmath.com');
INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (8000, 'Anderson', 'Paige', NULL);
INSERT INTO customers (customer_id, last_name, first_name, favorite_website) VALUES (9000, 'Johnson', 'Derek', 'techonthenet.com');

-- Data Orders

INSERT INTO orders (order_id, customer_id, order_date) VALUES (1,7000,'2016/04/18');
INSERT INTO orders (order_id, customer_id, order_date) VALUES (2,5000,'2016/04/18');
INSERT INTO orders (order_id, customer_id, order_date) VALUES (3,8000,'2016/04/19');
INSERT INTO orders (order_id, customer_id, order_date) VALUES (4,4000,'2016/04/20');
INSERT INTO orders (order_id, customer_id, order_date) VALUES (5,null,'2016/05/01');
