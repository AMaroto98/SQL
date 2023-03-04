DROP DATABASE IF EXISTS Pizzas;
CREATE DATABASE Pizzas;
USE Pizzas;

/* Delete the tables if they already exist */
drop table if exists Person;
drop table if exists Frequents;
drop table if exists Eats;
drop table if exists Serves;

/* CREATE the schema for our tables */

CREATE TABLE Person(
    name TEXT, 
    age INT, 
    gender TEXT
);

CREATE TABLE Frequents(
    name TEXT, 
    pizzeria TEXT
);

CREATE TABLE Eats(
    name TEXT, 
    pizza TEXT
);

CREATE TABLE Serves(
    pizzeria TEXT, 
    pizza TEXT, 
    price DECIMAL
);

/* Populate the tables with our data */
INSERT INTO Person VALUES ('Amy', 16, 'female');
INSERT INTO Person VALUES ('Ben', 21, 'male');
INSERT INTO Person VALUES ('Cal', 33, 'male');
INSERT INTO Person VALUES ('Dan', 13, 'male');
INSERT INTO Person VALUES ('Eli', 45, 'male');
INSERT INTO Person VALUES ('Fay', 21, 'female');
INSERT INTO Person VALUES ('Gus', 24, 'male');
INSERT INTO Person VALUES ('Hil', 30, 'female');
INSERT INTO Person VALUES ('Ian', 18, 'male');

INSERT INTO Frequents VALUES ('Amy', 'Pizza Hut');
INSERT INTO Frequents VALUES ('Ben', 'Pizza Hut');
INSERT INTO Frequents VALUES ('Ben', 'Chicago Pizza');
INSERT INTO Frequents VALUES ('Cal', 'Straw Hat');
INSERT INTO Frequents VALUES ('Cal', 'New York Pizza');
INSERT INTO Frequents VALUES ('Dan', 'Straw Hat');
INSERT INTO Frequents VALUES ('Dan', 'New York Pizza');
INSERT INTO Frequents VALUES ('Eli', 'Straw Hat');
INSERT INTO Frequents VALUES ('Eli', 'Chicago Pizza');
INSERT INTO Frequents VALUES ('Fay', 'Dominos');
INSERT INTO Frequents VALUES ('Fay', 'Little Caesars');
INSERT INTO Frequents VALUES ('Gus', 'Chicago Pizza');
INSERT INTO Frequents VALUES ('Gus', 'Pizza Hut');
INSERT INTO Frequents VALUES ('Hil', 'Dominos');
INSERT INTO Frequents VALUES ('Hil', 'Straw Hat');
INSERT INTO Frequents VALUES ('Hil', 'Pizza Hut');
INSERT INTO Frequents VALUES ('Ian', 'New York Pizza');
INSERT INTO Frequents VALUES ('Ian', 'Straw Hat');
INSERT INTO Frequents VALUES ('Ian', 'Dominos');

INSERT INTO Eats VALUES ('Amy', 'pepperoni');
INSERT INTO Eats VALUES ('Amy', 'mushroom');
INSERT INTO Eats VALUES ('Ben', 'pepperoni');
INSERT INTO Eats VALUES ('Ben', 'cheese');
INSERT INTO Eats VALUES ('Cal', 'supreme');
INSERT INTO Eats VALUES ('Dan', 'pepperoni');
INSERT INTO Eats VALUES ('Dan', 'cheese');
INSERT INTO Eats VALUES ('Dan', 'sausage');
INSERT INTO Eats VALUES ('Dan', 'supreme');
INSERT INTO Eats VALUES ('Dan', 'mushroom');
INSERT INTO Eats VALUES ('Eli', 'supreme');
INSERT INTO Eats VALUES ('Eli', 'cheese');
INSERT INTO Eats VALUES ('Fay', 'mushroom');
INSERT INTO Eats VALUES ('Gus', 'mushroom');
INSERT INTO Eats VALUES ('Gus', 'supreme');
INSERT INTO Eats VALUES ('Gus', 'cheese');
INSERT INTO Eats VALUES ('Hil', 'supreme');
INSERT INTO Eats VALUES ('Hil', 'cheese');
INSERT INTO Eats VALUES ('Ian', 'supreme');
INSERT INTO Eats VALUES ('Ian', 'pepperoni');

INSERT INTO Serves VALUES ('Pizza Hut', 'pepperoni', 12);
INSERT INTO Serves VALUES ('Pizza Hut', 'sausage', 12);
INSERT INTO Serves VALUES ('Pizza Hut', 'cheese', 9);
INSERT INTO Serves VALUES ('Pizza Hut', 'supreme', 12);
INSERT INTO Serves VALUES ('Little Caesars', 'pepperoni', 9.75);
INSERT INTO Serves VALUES ('Little Caesars', 'sausage', 9.5);
INSERT INTO Serves VALUES ('Little Caesars', 'cheese', 7);
INSERT INTO Serves VALUES ('Little Caesars', 'mushroom', 9.25);
INSERT INTO Serves VALUES ('Dominos', 'cheese', 9.75);
INSERT INTO Serves VALUES ('Dominos', 'mushroom', 11);
INSERT INTO Serves VALUES ('Straw Hat', 'pepperoni', 8);
INSERT INTO Serves VALUES ('Straw Hat', 'cheese', 9.25);
INSERT INTO Serves VALUES ('Straw Hat', 'sausage', 9.75);
INSERT INTO Serves VALUES ('New York Pizza', 'pepperoni', 8);
INSERT INTO Serves VALUES ('New York Pizza', 'cheese', 7);
INSERT INTO Serves VALUES ('New York Pizza', 'supreme', 8.5);
INSERT INTO Serves VALUES ('Chicago Pizza', 'cheese', 7.75);
INSERT INTO Serves VALUES ('Chicago Pizza', 'supreme', 8.5);