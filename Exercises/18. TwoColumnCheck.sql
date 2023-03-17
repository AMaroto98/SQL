-- Create a table with a column ‘date_of_birth’ and a column ‘date_of_death’. Add a constraint that prevents that a row is inserted with a date_of_birth bigger than the date_of_death. Verify that it works.

CREATE TABLE Prueba (
    name VARCHAR(45),
    FechaNacimiento DATE,
    FechaMuerte DATE,
    CHECK (FechaMuerte > FechaNacimiento)
);

INSERT INTO Prueba VALUES ("Pedro", '1997-01-16', '2099-09-16');

INSERT INTO Prueba VALUES ("Pedro", '3000-01-16', '2099-09-16');
ERROR 3819 (HY000): Check constraint 'Chicote_chk_1' is violated.