CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT,
	categoria varchar(255) NOT NULL,
    descricao varchar(255),
	PRIMARY KEY (id)
);

INSERT INTO tb_categorias (categoria, descricao) 
VALUES
('Tradicional', 'Pizzas salgadas clássicas com combinações populares'),
('Especial', 'Pizzas com ingredientes diferenciados e combinações gourmet'),
('Doce', 'Pizzas com recheios doces e sobremesas'),
('Vegana', 'Pizzas sem ingredientes de origem animal'),
('Premium', 'Pizzas com ingredientes selecionados e de alta qualidade');

SELECT * FROM tb_categorias;

CREATE TABLE tb_tamanhos (
    id BIGINT AUTO_INCREMENT,
    tamanho VARCHAR(100) NOT NULL,
    qtd_fatias INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_tamanhos (tamanho, qtd_fatias) 
VALUES
('Individual', 4),
('Média', 6),
('Grande', 8);

SELECT * FROM tb_tamanhos;

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(500),
    preco DECIMAL(6,2) NOT NULL,
    categoria_id BIGINT NOT NULL,
    tamanho_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id),
    FOREIGN KEY (tamanho_id) REFERENCES tb_tamanhos(id)
);

INSERT INTO tb_pizzas (nome, ingredientes, preco, categoria_id, tamanho_id)
VALUES
-- Tradicional (1)
('Calabresa', 'Molho de tomate, mussarela, calabresa e cebola', 39.90, 1, 2),
('Margherita', 'Molho de tomate, mussarela, tomate e manjericão', 42.50, 1, 3),
-- Especial (2)
('Frango com Catupiry', 'Molho de tomate, frango desfiado e catupiry', 47.00, 2, 3),
('Portuguesa Especial', 'Molho de tomate, presunto, ovos, cebola e azeitonas', 49.90, 2, 3),
-- Doce (3)
('Chocolate', 'Chocolate ao leite e granulado', 35.00, 3, 2),
('Morango com Chocolate', 'Chocolate ao leite, morangos e leite condensado', 38.50, 3, 3),
-- Vegana (4)
('Vegana Mediterrânea', 'Molho de tomate, abobrinha, berinjela, pimentão e azeitonas', 46.00, 4, 3),
-- Premium (5)
('Parma & Rúcula', 'Molho de tomate, presunto de parma, rúcula e parmesão', 58.90, 5, 3);

SELECT * FROM tb_pizzas;

-- preco maior q 45
SELECT c.categoria, p.nome, p.ingredientes,  t.tamanho, p.preco
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
INNER JOIN tb_tamanhos AS t ON p.tamanho_id = t.id
WHERE p.preco > 45.00;

-- preco entre 50 e 100
SELECT c.categoria, p.nome, p.ingredientes,  t.tamanho, p.preco
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
INNER JOIN tb_tamanhos AS t ON p.tamanho_id = t.id
WHERE p.preco BETWEEN 50.00 AND 100.00;

-- Possui M no nome
SELECT c.categoria, p.nome, p.ingredientes,  t.tamanho, p.preco
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
INNER JOIN tb_tamanhos AS t ON p.tamanho_id = t.id
WHERE p.nome LIKE "%M%";

-- somente categoria doce(3)
SELECT c.categoria, p.nome, p.ingredientes,  t.tamanho, p.preco
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.categoria_id = c.id
INNER JOIN tb_tamanhos AS t ON p.tamanho_id = t.id
WHERE c.id = 3;

