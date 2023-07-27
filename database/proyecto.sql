-- Active: 1690256662382@@127.0.0.1@3306@db_paperplus
CREATE DATABASE db_paperplus;

USE db_paperplus;

CREATE TABLE IF NOT EXISTS users (
    id INT(11) NOT NULL,
    usuario VARCHAR(16) NOT NULL,
    contra VARCHAR(60) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

ALTER TABLE users
  ADD PRIMARY KEY (id);

ALTER TABLE users
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

ALTER TABLE users MODIFY nombre VARCHAR(100) NULL;


-- Crear la tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT
);

-- Insertamos los productos a la base de datos
INSERT INTO productos (nombre, precio, descripcion)
VALUES ('Lápiz', 0.50, 'Lápiz grafito #2'),
       ('Cuaderno', 2.00, 'Cuaderno tamaño carta de 100 hojas'),
       ('Borrador', 0.25, 'Borrador de goma blanca'),
       ('Plumón', 1.50, 'Plumón para pizarra de color negro'),
       ('Regla', 0.75, 'Regla plástica de 30 cm'),
       ('Resaltador', 0.80, 'Resaltador de colores surtidos'),
       ('Pegamento', 1.00, 'Pegamento líquido transparente'),
       ('Tijeras', 1.20, 'Tijeras de punta redonda'),
       ('Cinta adhesiva', 0.60, 'Cinta adhesiva transparente'),
       ('Papel bond', 5.00, 'Resma de papel bond tamaño carta'),
	   ('Esfero', 0.50, 'Esferografico color azul'),
       ('Goma en barra', 0.50, 'Pegamento blanco para uso escolar'),
       ('Lápiz mecánico', 0.90, 'Lápiz mecánico con goma incluida'),
       ('Agenda', 5.50, 'Agenda semanal de tapa dura'),
       ('Sacapuntas', 0.30, 'Sacapuntas de plástico'),
       ('Papel de colores', 1.20, 'Paquete de hojas de papel de colores'),
       ('Grapadora', 2.50, 'Grapadora metálica'),
       ('Notas adhesivas', 0.75, 'Bloc de notas adhesivas'),
       ('Carpeta de argollas', 3.80, 'Carpeta de argollas tamaño carta'),
	   ('Portaminas', 1.00, 'Portaminas 5mm'),
	   ('Juego de compas', 4.00, 'Juego geometrico'),
	   ('Juego de reglas', 4.00, 'Juego de reglas y escuadras'),
	   ('Cuaderno de lineas', 2.00, 'Cuaderno para literatura'),
	   ('Empower B1 Cambrigde', 78.00, 'Texto para ingles'),
	   ('Pack textos Santillana', 120.00, 'Pack de libros para las principales materias');

--Obtencion de productos
SELECT * FROM productos LIMIT 25;

--Listas de utiles
INSERT INTO productos (nombre, precio, descripcion)
VALUES ('Lista de utiles Jim Irwin', 190.00, '4 Cuadernos universitarios a cuadros\n3 Esferograficos\n1 Juego de compas\n1 Tijeras\n1 Agenda\n1 Grapadora\n2 Resmas\n2 Borradores\n2 Carpetas\n1 Resaltador\nPack Santillana\nCon un 20% de descuento!'),
('Lista de utiles Paul Dirac', 120.00, '2 Cuadernos universitarios a cuadros\n2 Esferograficos\n1 Goma en barra\n1 Tijeras\n1 Agenda\n1 Grapadora\n2 Borradores\n4 Carpetas\n1 Resaltador\nPack Santillana\nStudents book Empower B1\nCon un 20% de descuento!');


SELECT * FROM productos
WHERE id IN (26, 27);


