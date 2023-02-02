DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;


CREATE TABLE autor (
    
    autorID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(64)
);

CREATE TABLE libro (

    libroID INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(64),
    ISBN CHAR(10) UNIQUE NOT NULL,
    paginas INT CHECK(paginas>0),
    editorial VARCHAR(64)
);

CREATE TABLE ejemplar (

    ejemplarID INT PRIMARY KEY AUTO_INCREMENT,
    libroID INT,
    localizacion VARCHAR(128),
    FOREIGN KEY (libroID) REFERENCES libro(libroID)
);

CREATE TABLE usuario (
    usuarioID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(64),
    telefono VARCHAR(9),
    direccion VARCHAR(128)
);

CREATE TABLE autoria (

    autorID INT,
    libroID INT,
    PRIMARY KEY (autorID, libroID),
    FOREIGN KEY (autorID) REFERENCES autor(autorID),
    FOREIGN KEY (libroID) REFERENCES libro(libroID)
);

CREATE TABLE prestamo (

    usuarioID INT,
    ejemplarID INT,
    fechaDevolucion DATE,
    fechaPrestamo DATE NOT NULL,
    PRIMARY KEY(usuarioID, ejemplarID),
    FOREIGN KEY (usuarioID) REFERENCES usuario(usuarioID),
    FOREIGN KEY (ejemplarID) REFERENCES ejemplar(ejemplarID)
);


INSERT INTO libro (titulo, ISBN, paginas, editorial) VALUES
    ('El ritmo de la guerra', '001', 1474, 'NOVA'),
    ('El camino de los reyes', '002', 1514, 'NOVA'),
    ('La llamada de Cthulhu', '003', 96, 'ALMA EUROPA'),
    ('Mort', '004', 243, 'DEBOLSILLO'),
    ('Palabras radiantes', '005', 1248, 'NOVA'),
    ('Juramentada', '006', 1408, 'NOVA'),
    ('Dune', '007', 704, 'NOVA');


INSERT INTO ejemplar (libroID, localizacion) VALUES 
    (1, "Palma"),
    (1, "Palma"),
    (1, "Inca"),
    (2, "Palma"),
    (2, "Inca"),
    (3, "Palma"),
    (3, "Inca"),
    (4, "Palma"),
    (4, "Inca"),
    (5, "Palma"),
    (6, "Inca");


INSERT INTO autor (nombre) VALUES
    ('Brandon Sanderson'),
    ('Terry Pratchet'),
    ('H.P. Lovecraft'),
    ('Frank Herbert');

INSERT INTO autoria (autorID, libroID) VALUES 
    (1, 1),
    (1, 2),
    (1, 5),
    (1, 6),
    (2, 4),
    (3, 3),
    (4, 7);

INSERT INTO usuario (nombre, telefono, direccion)  VALUES
    ('Pedro', '971901677', 'Calle 1'),
    ('Maria', '644567781', 'Calle 2'),
    ('Miquel', '971905544', 'Calle 3');


INSERT INTO prestamo (usuarioID, ejemplarID, fechaPrestamo, fechaDevolucion) VALUES 
    (1, 1, '2022-01-01', '2022-01-07'),
    (1, 3, '2022-01-08', '2022-01-12'),
    (2, 5, '2022-01-17', NULL),
    (3, 7, '2022-01-15', '2022-01-17'),
    (3, 11, '2022-01-6', NULL);
