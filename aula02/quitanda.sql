CREATE DATABASE db_quitanda;

CREATE TABLE tb_produtos(
	id bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    quantidade int,
    data_validade date,
    preco decimal NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUE ("tomate", 1000, "2026-03-24", 8.99);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUE ("banana", 15000, "2026-03-04", 12.50),
	  ("morango", 5000, "2026-03-14", 22.00),
      ("alface", 500, "2026-03-01", 6.50),
      ("beterraba", 4000, "2026-03-20", 9.50);

SELECT * FROM tb_produtos;

ALTER TABLE tb_produtos MODIFY preco decimal (6,2);

UPDATE tb_produtos SET preco = 8.99 WHERE id = 1;

DELETE FROM tb_produtos WHERE id = 6;

ALTER TABLE tb_produtos ADD descricao varchar(500);

ALTER TABLE tb_produtos CHANGE descricao descricao_produto varchar(500);

ALTER TABLE tb_produtos DROP descricao_produto;
