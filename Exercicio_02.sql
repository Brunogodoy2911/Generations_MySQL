-- 1
CREATE DATABASE db_ecommerce;

USE db_ecommerce;

-- 2
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6 , 2 ),
    quantidade_estoque INT NOT NULL,
    categoria VARCHAR(100),
    PRIMARY KEY (id)
);

-- 3 
INSERT INTO tb_produtos (nome, descricao, preco, quantidade_estoque, categoria)
VALUES 
('Notebook Dell Inspiron', 'Notebook com processador Intel i5, 8GB RAM e SSD de 256GB.', 3500.00, 10, 'Informática'),
('Mouse Logitech M170', 'Mouse sem fio com conexão USB e pilha AA inclusa.', 89.90, 50, 'Acessórios'),
('Teclado Mecânico Redragon', 'Teclado com switches vermelhos e iluminação RGB.', 289.90, 25, 'Periféricos'),
('Monitor LG 24"', 'Monitor LED Full HD com entradas HDMI e VGA.', 899.99, 15, 'Informática'),
('Cadeira Gamer ThunderX3', 'Cadeira ergonômica com apoio lombar.', 1249.00, 8, 'Móveis Gamer'),
('Smartphone Samsung Galaxy S22', 'Celular com 128GB e câmera tripla.', 4299.00, 12, 'Celulares'),
('Headset HyperX Cloud Stinger', 'Fone de ouvido com microfone e som estéreo.', 299.00, 20, 'Áudio'),
('Impressora HP DeskJet 2774', 'Multifuncional com Wi-Fi e impressão colorida.', 479.90, 18, 'Impressoras');

-- 4
SELECT * FROM tb_produtos WHERE preco > 500;

-- 5
SELECT * FROM tb_produtos WHERE preco < 500;

-- 6
UPDATE tb_produtos 
SET 
    preco = 250.99, nome = "Mouse Razer"
WHERE
    id = 1;

-- Teste
SELECT * FROM tb_produtos;
    


