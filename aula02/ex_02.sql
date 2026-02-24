CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id bigint AUTO_INCREMENT,
    nome varchar (255) NOT NULL,
    descricao varchar (255),
    quantidade int,
    valor decimal(6,2) NOT NULL,
    PRIMARY KEY (id)
    );
    
INSERT INTO tb_produtos(nome, descricao, quantidade, valor)
VALUES
('Notebook Pro 14', 'Notebook 14 polegadas, 16GB RAM, SSD 512GB', 15, 4599.90),
('Mouse Gamer RGB', 'Mouse óptico 7200 DPI com iluminação RGB', 40, 149.90),
('Teclado Mecânico', 'Teclado mecânico switch azul ABNT2', 25, 329.90),
('Monitor 24 LED', 'Monitor 24 polegadas Full HD HDMI', 18, 899.90),
('Headset Bluetooth', 'Fone de ouvido sem fio com microfone', 30, 279.90),
('Cadeira Escritório', 'Cadeira ergonômica com ajuste de altura', 12, 749.90),
('HD Externo 1TB', 'HD externo portátil USB 3.0', 22, 389.90),
('Webcam Full HD', 'Webcam 1080p com microfone embutido', 35, 219.90);

SELECT * FROM tb_produtos WHERE valor > 500;
SELECT * FROM tb_produtos WHERE valor < 500;

ALTER TABLE tb_produtos MODIFY valor decimal (10,2);
UPDATE tb_produtos SET quantidade = 14 WHERE id =1;

SELECT * FROM tb_produtos;
    
