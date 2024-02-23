CREATE DATABASE IF NOT EXISTS `prueba` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prueba`;

CREATE TABLE IF NOT EXISTS `libro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `autor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libro_id` int DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prestamo_libro` (`libro_id`),
  KEY `FK_prestamo_usuario` (`usuario_id`),
  CONSTRAINT `FK_prestamo_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`),
  CONSTRAINT `FK_prestamo_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`) VALUES
	(1, 'Usuario 1', 'Apellido 1', 'usuario1@email.com'),
	(2, 'Usuario 2', 'Apellido 2', 'usuario2@email.com'),
	(3, 'Usuario 3', 'Apellido 3', 'usuario3@email.com');

INSERT INTO `libro` (`id`, `titulo`, `autor`) VALUES
	(1, 'Libro 1', 'Autor 1'),
	(2, 'Libro 2', 'Autor 2'),
	(3, 'Libro 3', 'Autor 3');

INSERT INTO `prestamo` (`id`, `libro_id`, `fecha_prestamo`, `fecha_devolucion`, `usuario_id`) VALUES
	(1, 1, '2023-12-15', NULL, 1),
	(2, 2, '2023-12-20', NULL, 2),
	(3, 3, '2023-12-25', NULL, 3),
	(4, 1, '2023-12-30', '2024-01-05', 1),
	(5, 2, '2024-01-05', NULL, 2),
	(6, 3, '2024-01-10', NULL, 3),
	(7, 1, '2024-01-15', NULL, 1),
	(8, 2, '2024-01-20', NULL, 2),
	(9, 3, '2024-01-25', '2024-02-01', 3),
	(10, 1, '2024-01-30', NULL, 1),
	(11, 2, '2024-02-01', NULL, 2),
	(12, 3, '2024-02-05', NULL, 3),
	(13, 1, '2024-02-08', NULL, 1),
	(14, 2, '2024-02-12', '2024-02-19', 2),
	(15, 3, '2024-02-18', NULL, 3);


-- Encuentra el título y el autor de los libros actualmente prestados, junto
-- con el nombre del usuario que los tiene prestados. Incluye también la
-- fecha de préstamo y la fecha de devolución.
USE `prueba`;
SELECT prestamo.fecha_prestamo, prestamo.fecha_devolucion, libro.titulo AS titulo_libro, libro.autor, usuario.nombre AS nombre_usuario
FROM prestamo
INNER JOIN libro
ON libro.id = prestamo.libro_id
INNER JOIN usuario
ON usuario.id = prestamo.usuario_id
WHERE prestamo.fecha_devolucion IS NOT NULL



-- Encuentra los títulos y autores de los libros que fueron prestados hace
-- más de 7 días y aún no han sido devueltos. Incluye el nombre del
-- usuario que los tiene prestados y la fecha de préstamo.

USE `prueba`;
