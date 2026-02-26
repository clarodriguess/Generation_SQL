CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Remédios para tratamento de doenças'),
('Higiene', 'Produtos para cuidados pessoais'),
('Cosméticos', 'Produtos de beleza e cuidados com a pele'),
('Suplementos', 'Vitaminas e complementos alimentares'),
('Infantil', 'Produtos destinados a bebês e crianças');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(6,2) NOT NULL,
    estoque INT NOT NULL,
    validade DATE,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id) VALUES
('Paracetamol 500mg', 'Analgésico e antitérmico', 12.50, 100, '2027-05-10', 1),
('Amoxicilina 500mg', 'Antibiótico de amplo espectro', 35.90, 50, '2026-11-15', 1),
('Shampoo Anticaspa', 'Controle de caspa e oleosidade', 22.90, 80, '2028-03-01', 2),
('Protetor Solar FPS 50', 'Proteção contra raios UVA e UVB', 45.00, 60, '2027-12-30', 3),
('Vitamina C 1g', 'Suplemento alimentar com 30 comprimidos', 29.90, 120, '2028-01-20', 4),
('Fralda Descartável P', 'Pacote com 50 unidades', 59.90, 40, '2029-06-01', 5),
('Pomada para Assadura', 'Proteção contra irritações na pele do bebê', 18.75, 70, '2027-08-15', 5),
('Colágeno Hidrolisado', 'Suplemento para pele e articulações', 79.90, 35, '2028-09-10', 4);

-- preco maior q 50
SELECT p.nome, p.descricao, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE preco > 50.00;

-- preco entre 5 e 60
SELECT p.nome, p.descricao, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE preco BETWEEN 5.00 AND 60.00;

-- possuem C
SELECT p.nome, p.descricao, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE p.nome LIKE "%C%";

-- apenas da categoria cosmetico (3)
SELECT p.nome, p.descricao, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE c.id=3;