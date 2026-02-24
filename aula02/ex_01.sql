CREATE DATABASE db_empresa;

USE db_empresa;

CREATE TABLE tb_colaboradores(
	matricula bigint AUTO_INCREMENT,
    nome varchar (255) NOT NULL,
    cargo varchar (255),
    data_nascimento date,
    salario decimal(8,2) NOT NULL,
    PRIMARY KEY (matricula)
    );
    
INSERT INTO tb_colaboradores(nome, cargo, data_nascimento, salario)
VALUES 
('Clarisse Rodrigues', 'Desenvolvedora Front-end', '1989-01-26', 5500.00),
('Benedito Perez', 'Estagiario', '1988-03-22', 1200.00),
('Francisco Lima Rocha', 'Recepcionista', '1992-11-05', 1900.00),
('Rafael Martins', 'Gerente de Projetos', '1985-01-30', 9800.00),
('Juliana Castro', 'Analista', '1997-06-18', 2100.00);

SELECT * FROM tb_colaboradores WHERE salario > 2000;
SELECT * FROM tb_colaboradores WHERE salario < 2000;

UPDATE tb_colaboradores SET salario = 3000.00 WHERE matricula=5;

SELECT * FROM tb_colaboradores;
    
    