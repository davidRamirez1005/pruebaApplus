CREATE DATABASE IF NOT EXISTS `primeraPrueba`;
USE `primeraPrueba`;

CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) UNIQUE,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` int DEFAULT NULL,
  `price` FLOAT DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
);

INSERT INTO `category` ( `name`, `createdAt`, `updatedAt`) VALUES
	('producto 1', '2023-12-5', '2024-12-25'),
	('producto 2', '2023-12-15', '2024-12-25'),
	('producto 3', '2023-12-4', '2024-12-25');
	('producto 4', '2023-12-5', '2024-12-25');
	('producto 5', '2023-12-26', '2024-12-25');
	('producto 6', '2023-12-28', '2024-12-25');
INSERT INTO `product` (`code`, `name`, `category`, `price`, `createdAt`, `updatedAt`) VALUES
	('as1223', 'name 1', 1, 1000.0, '2023-12-25', '2024-12-25'),
	('fg4526', 'name 2', 2, 2000.0, '2023-12-25', '2024-12-25'),
	('tg5862', 'name 3', 3, 3000.0, '2023-12-25', '2024-12-25');
	('tg586', 'name 3', 6, 40000.0, '2023-12-25', '2024-12-25');
	('tg586', 'name 3', 4, 42000.0, '2023-12-25', '2024-12-25');
	('tg586', 'name 3', 5, 20000.0, '2023-12-25', '2024-12-25');

USE `primeraPrueba`;
SELECT *, category
FROM product
INNER JOIN category
ON category.id = product.category