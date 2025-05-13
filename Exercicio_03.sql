-- 1
CREATE DATABASE db_registros_escolares;

USE db_registros_escolares;

-- 2
CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    serie VARCHAR(50) NOT NULL,
    contato_responsavel VARCHAR(100),
    nota DECIMAL(6 , 2),
    PRIMARY KEY (id)
);

-- 3
INSERT INTO tb_estudantes (nome, data_nascimento, serie, contato_responsavel, nota) 
VALUES
('João Silva', '2005-02-15', '5º Ano', 'Maria Silva', 8.5),
('Ana Oliveira', '2006-04-10', '6º Ano', 'Carlos Oliveira', 9.0),
('Lucas Santos', '2007-03-22', '7º Ano', 'Ana Santos', 7.5),
('Pedro Lima', '2008-07-11', '8º Ano', 'José Lima', 6.8),
('Maria Fernanda', '2005-08-25', '5º Ano', 'Luciana Fernanda', 8.0),
('Camila Costa', '2006-12-30', '6º Ano', 'Ricardo Costa', 7.9),
('Thiago Pereira', '2007-01-17', '7º Ano', 'Gustavo Pereira', 9.5),
('Carla Martins', '2008-05-05', '8º Ano', 'Patrícia Martins', 6.4);

-- 4
SELECT * FROM tb_estudantes WHERE nota > 7.0;

-- 5
SELECT 
    *
FROM
    tb_estudantes
WHERE
    nota < 7.0;
    
-- 6
UPDATE tb_estudantes 
SET 
    nome = 'Bruno Godoy',
    nota = 10.0
WHERE
    id = 1;

-- Teste
SELECT 
    *
FROM
    tb_estudantes;
