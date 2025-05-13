-- 1
CREATE DATABASE db_empresa;

USE db_empresa;

-- 2
CREATE TABLE tb_colaboradores (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255),
    departamento VARCHAR(255),
    data_de_admissao DATE NOT NULL,
    salario decimal(8,2),
    PRIMARY KEY (id)
);

-- 3
INSERT INTO tb_colaboradores (
    nome,
    cargo,
    departamento,
    data_de_admissao,
    salario
) VALUES 
('Bruno', 'Desenvolvedor Júnior', 'T.I', '2025-05-29', 1200.90),
('Giovana', 'Analista de RH', 'Recursos Humanos', '2023-03-15', 3200.00),
('João', 'Designer Gráfico', 'Marketing', '2022-08-20', 2800.50),
('Daniel', 'Analista de Sistemas', 'T.I', '2024-12-01', 4100.00),
('Juan', 'Assistente Administrativo', 'Administrativo', '2021-05-10', 2500.75);

-- 4
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- 5
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- 6
UPDATE tb_colaboradores 
SET 
    salario = 1999.90, cargo = "Desenvolvedor Sênior"
WHERE
    id = 1;
    
-- Teste
SELECT * FROM tb_colaboradores;
