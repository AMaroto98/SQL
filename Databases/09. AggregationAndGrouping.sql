DROP DATABASE IF EXISTS Aggregation;
CREATE DATABASE Aggregation;
USE Aggregation;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    commission DECIMAL(6,2) NOT NULL
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    pur_amt DECIMAL(7,2) NOT NULL,
    ord_date DATE NOT NULL,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL
);

-- Inserts

INSERT INTO salesman VALUES (11,'Pranav','Karwar',200);
INSERT INTO salesman VALUES (24,'Prasanna','Bengalore',300);
INSERT INTO salesman VALUES (39,'Prajwal','Kodagu',100);
INSERT INTO salesman VALUES (44,'Pooja','Hubli',500.5);
INSERT INTO salesman VALUES (15,'Prokta','Mysore',200.2);

INSERT INTO customer VALUES (101,'Bhargav','Mysore',1,15);
INSERT INTO customer VALUES (206,'Ramya','Bengalore',3,24);
INSERT INTO customer VALUES (225,'Rajesh','Hubli',2,39);
INSERT INTO customer VALUES (324,'Ravi','Mangalore',5,44);
INSERT INTO customer VALUES (456,'Rajdeep','Belagavi',3,15);
INSERT INTO customer VALUES (501,'Raghu','Dharavad',4,39);
INSERT INTO customer VALUES (300,'Bhavya','Bengalore',1,15);
INSERT INTO customer VALUES (333,'Rajeed','Bengalore',NULL,15);

INSERT INTO orders VALUES (5,10000,STR_TO_DATE('25-03-2020','%e-%c-%Y'),101,11);
INSERT INTO orders VALUES (10,5000,STR_TO_DATE('25-03-2020','%e-%c-%Y'),456,15);
INSERT INTO orders VALUES (7,9500,STR_TO_DATE('30-04-2020','%e-%c-%Y'),225,44);
INSERT INTO orders VALUES (11,8700,STR_TO_DATE('07-07-2020','%e-%c-%Y'),324,24);
INSERT INTO orders VALUES (17,1500,STR_TO_DATE('07-07-2020','%e-%c-%Y'),206,39);
