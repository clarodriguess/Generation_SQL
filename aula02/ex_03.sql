CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes(
	matricula bigint AUTO_INCREMENT,
    nome varchar (255) NOT NULL,
    turma varchar (255),
    data_nascimento date,
    nota decimal(3,2) NOT NULL,
    PRIMARY KEY (matricula)
);

INSERT INTO tb_estudantes(nome, turma, data_nascimento, nota)
VALUES
('Lucas Andrade', 'Turma A', '2006-04-12', 8.75),
('Beatriz Oliveira', 'Turma A', '2005-09-30', 9.10),
('Gabriel Santos', 'Turma B', '2006-01-18', 7.85),
('Ana Clara Mendes', 'Turma B', '2005-12-02', 8.40),
('Matheus Lima', 'Turma C', '2006-07-25', 6.95),
('Juliana Ferreira', 'Turma C', '2005-03-14', 9.50),
('Pedro Henrique Costa', 'Turma D', '2006-10-08', 7.20),
('Larissa Almeida', 'Turma D', '2005-05-19', 8.90);

SELECT * FROM tb_estudantes WHERE nota > 7.00;
SELECT * FROM tb_estudantes WHERE nota < 7.00;

UPDATE tb_estudantes SET turma = 'Turma A1' WHERE matricula = 1;

SELECT * FROM tb_estudantes;

