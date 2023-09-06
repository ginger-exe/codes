 -- criando o banco de dados
 CREATE DATABASE LOJABD;
 
 USE LOJABD;
 
 -- criando as tabelas:
 CREATE TABLE CLIENTE (
   codigo INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255),
   estado VARCHAR(255),
   cidade VARCHAR(255),
   telefone VARCHAR(255)
  );
   
 CREATE TABLE PRODUTO (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255),
   valor DECIMAL(10,2),
   quantidade VARCHAR(255)
 );
-- 
 CREATE TABLE COMPRA (
   numero INT AUTO_INCREMENT PRIMARY KEY, 
   data_da_compra DATE,
   codigo_cliente INT, 
   id_produto INT,
   quantidade_comprada INT,
   valor_compra DECIMAL(10,2),
   CONSTRAINT compra_codigo_fk1 FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE (codigo), 
   CONSTRAINT compra_codigo_fk2 FOREIGN KEY (id_produto) REFERENCES PRODUTO (id)
 );
-- 
 -- inserir dados na tabela CLIENTE
 INSERT INTO CLIENTE (nome, estado, cidade, telefone) VALUES
 
 ('Fagner', 'SP', 'P. Prudente', '997989491'),
 ('Maria', 'SP', 'Campinas', '997989493'),
 ('Marcela', 'RJ', 'Angra dos Reis', '997989492'),
 ('Caio', 'SP', 'Assis', '997989495'),
 ('Marcos', 'SP', 'Campos do Jordão', '997989498'),
 ('Penelope', 'MG', 'Itajubá', '997989494'),
 ('Rian', 'SP', 'Santos', '997989490');
 
 -- inserir dados na tabela produto:
 INSERT INTO PRODUTO (nome, valor, quantidade) VALUES
 
 ('Mouse', '200', '30'),
 ('Teclado', '250', '15'),
 ('Notebook', '3500', '10'),
 ('Fone de ouvido', '150', '25');
-- 
-- inserir dados na tabela compra:
INSERT INTO COMPRA (numero, data_da_compra, codigo_cliente, id_produto, quantidade_comprada) VALUES

('1', current_date(), '1', '4', '1'),
('2', DATE(current_date() +2), '2', '2', '2'),
('3', DATE(current_date() +3), '3', '1', '2'),
('4', DATE(current_date() +1), '4', '3', '1'),
('5', DATE(current_date() -2), '5', '1', '2'),
('6', DATE(current_date() -5), '6', '3', '1'),
('7', DATE(current_date() -3), '5', '2', '1'),
('8', DATE(current_date() -1), '4', '4', '2'),
('9', current_date(), '3', '4', '3'),
('10', DATE(current_date() +1), '2', '2', '4');



-- utilizando junções (JOIN) para consultas:
use LOJABD;

SELECT 
  COMPRA.numero, 
  CLIENTE.nome, 
  PRODUTO.nome, 
  COMPRA.valor_compra
FROM 
  COMPRA
INNER JOIN PRODUTO ON PRODUTO.id = COMPRA.id_produto
INNER JOIN CLIENTE ON CLIENTE.codigo = COMPRA.codigo_cliente
ORDER BY 
  COMPRA.numero;


SELECT 
  COMPRA.numero, 
  CLIENTE.nome,
  IFNULL(COMPRA.numero, 'NULL') AS codigo_compra
FROM 
  CLIENTE
LEFT JOIN COMPRA ON CLIENTE.codigo = COMPRA.codigo_cliente
ORDER BY 
  COMPRA.numero;

SELECT 
  DISTINCT CLIENTE.nome,
	CLIENTE.telefone
FROM 
	CLIENTE
INNER JOIN COMPRA ON COMPRA.codigo_cliente = CLIENTE.codigo
WHERE 
	COMPRA.data_da_compra < CURRENT_DATE();