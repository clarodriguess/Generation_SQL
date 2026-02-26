CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    setor_loja VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO tb_categorias (nome, descricao, setor_loja) 
VALUES
('Hidráulica', 'Produtos para instalação de água e esgoto', 'Corredor 1'),
('Elétrica', 'Materiais para instalações elétricas', 'Corredor 2'),
('Ferramentas', 'Ferramentas manuais e elétricas', 'Corredor 3'),
('Acabamento', 'Produtos para finalização de obras', 'Corredor 4'),
('Estrutura', 'Materiais básicos para construção', 'Pátio externo');

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    marca VARCHAR(100),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    unidade_medida VARCHAR(50),
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, marca, preco, estoque, unidade_medida, categoria_id) 
VALUES
('Cimento 50kg', 'Votoran', 39.90, 200, 'Saco', 5),
('Tijolo Baiano', 'Cerâmica Forte', 1.20, 5000, 'Unidade', 5),
('Tinta Acrílica 18L', 'Suvinil', 289.90, 50, 'Lata', 4),
('Furadeira 650W', 'Bosch', 399.90, 30, 'Unidade', 3),
('Cano PVC 100mm', 'Tigre', 79.90, 120, 'Barra', 1),
('Disjuntor 20A', 'Tramontina', 24.90, 150, 'Unidade', 2),
('Chuveiro Elétrico', 'Lorenzetti', 129.90, 80, 'Unidade', 2),
('Argamassa 20kg', 'Quartzolit', 29.90, 300, 'Saco', 4);


-- preco maior q 100
SELECT p.nome, p.marca, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE preco > 100.00;

-- preco entre 70 e 150
SELECT p.nome, p.marca, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE preco BETWEEN 70.00 AND 150.00;

-- possuem C
SELECT p.nome, p.marca, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE p.nome LIKE "%C%";

-- apenas da categoria hidraulica (1)
SELECT p.nome, p.marca, p.preco, p.estoque, c.nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
WHERE c.id=1;