SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `db_pizzaria_legal`;
USE `db_pizzaria_legal`;

CREATE TABLE IF NOT EXISTS `db_pizzaria_legal`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_pizzaria_legal`.`tb_pizzas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `descricao` VARCHAR(500) NULL,
  `sabor` VARCHAR(255) NOT NULL,
  `tb_categorias_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_pizzas_tb_categorias_idx` (`tb_categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_pizzas_tb_categorias`
    FOREIGN KEY (`tb_categorias_id`)
    REFERENCES `db_pizzaria_legal`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO `tb_categorias` (nome, tipo) VALUES
('Salgada', 'Tradicional'),
('Doce', 'Sobremesa'),
('Vegetariana', 'Saudável'),
('Frutos do Mar', 'Especial'),
('Especial', 'Gourmet');

INSERT INTO `tb_pizzas` (nome, preco, descricao, sabor, tb_categorias_id) VALUES
('Pizza de Calabresa', 42.50, 'Pizza tradicional de calabresa, cebola e queijo.', 'Calabresa', 1),
('Pizza de Chocolate', 38.00, 'Pizza doce com chocolate, morango e chantilly.', 'Chocolate', 2),
('Pizza Margherita', 49.00, 'Pizza vegetariana com tomate, manjericão e mozzarella.', 'Margherita', 3),
('Pizza de Camarão', 65.00, 'Pizza especial com camarões, molho branco e queijo.', 'Camarão', 4),
('Pizza de Frango com Catupiry', 55.00, 'Pizza salgada com frango desfiado, catupiry e milho.', 'Frango com Catupiry', 1),
('Pizza de Nutella', 50.00, 'Pizza doce com Nutella, morangos e leite condensado.', 'Nutella', 2),
('Pizza Vegetariana', 45.00, 'Pizza vegetariana com berinjela, abobrinha e queijo.', 'Vegetariana', 3),
('Pizza de Bacalhau', 85.00, 'Pizza especial com bacalhau desfiado, azeite de oliva e alho.', 'Bacalhau', 4);

SELECT * FROM `tb_pizzas` WHERE preco > 45.00;

SELECT * FROM `tb_pizzas` WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM `tb_pizzas` WHERE nome LIKE "%M%";

SELECT 
    `tb_pizzas`.nome AS Pizza, 
    `tb_pizzas`.preco AS Preço, 
    `tb_pizzas`.descricao AS Descrição, 
    `tb_pizzas`.sabor AS Sabor, 
    `tb_categorias`.nome AS Categoria
FROM 
    `tb_pizzas`
INNER JOIN 
    `tb_categorias` 
ON 
    `tb_categorias`.id = `tb_pizzas`.tb_categorias_id;

SELECT 
    `tb_pizzas`.nome AS Pizza, 
    `tb_pizzas`.preco AS Preço, 
    `tb_pizzas`.descricao AS Descrição, 
    `tb_pizzas`.sabor AS Sabor, 
    `tb_categorias`.nome AS Categoria
FROM 
    `tb_pizzas`
INNER JOIN 
    `tb_categorias` 
ON 
    `tb_categorias`.id = `tb_pizzas`.tb_categorias_id
WHERE 
    `tb_categorias`.nome = 'Doce';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
