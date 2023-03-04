DROP DATABASE IF EXISTS Ages;
CREATE DATABASE Ages;
USE Ages;

CREATE TABLE person (
    name VARCHAR(20),
    birthdate DATE
);

INSERT INTO person (name, birthdate) VALUES ("Chicote", '2018-10-20');
INSERT INTO person (name, birthdate) VALUES ("Alfredo", '1998-01-10');
INSERT INTO person (name, birthdate) VALUES ("Jesús", '1900-03-27');
INSERT INTO person (name, birthdate) VALUES ("Doraemon", '1818-12-03');