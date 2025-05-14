SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `db_generation_game_online`;
USE `db_generation_game_online`;

CREATE TABLE IF NOT EXISTS `db_generation_game_online`.`tb_classes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_generation_game_online`.`tb_personagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `poder_ataque` INT NOT NULL,
  `poder_defesa` INT NOT NULL,
  `classe` VARCHAR(255) NOT NULL,
  `tb_classes_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_personagens_tb_classes_idx` (`tb_classes_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_personagens_tb_classes`
    FOREIGN KEY (`tb_classes_id`)
    REFERENCES `db_generation_game_online`.`tb_classes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO tb_classes (nome, tipo) VALUES
('Guerreiro', 'Ataque Corpo a Corpo'),
('Mago', 'Magia'),
('Arqueiro', 'Ataque à Distância'),
('Cavaleiro', 'Defensivo'),
('Assassino', 'Ataque Rápido');

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, classe, tb_classes_id) VALUES
('Thorin', 2500, 1000, 'Guerreiro', 1),
('Elaria', 1800, 2000, 'Arqueiro', 3),
('Merlin', 2200, 3000, 'Mago', 2),
('Ragnar', 1600, 1200, 'Guerreiro', 4),
('Core', 3000, 2000, 'Assassino', 5),
('Ayla', 1950, 2500, 'Arqueiro', 3),
('Kael', 2100, 1000, 'Mago', 2),
('Drako', 2700, 4400, 'Guerreiro', 1);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa  BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_classes.id = tb_personagens.tb_classes_id;

SELECT 
    *
FROM
    tb_personagens
        INNER JOIN
    tb_classes ON tb_classes.id = tb_personagens.tb_classes_id
WHERE
    tb_classes.nome = 'Arqueiro';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
