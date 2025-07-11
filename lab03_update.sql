col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab03.txt

--

-- Nome   :  Alan Diego Ribeirode Azevedo


-- Numero : 41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;
--
-- Script de Criacao do BD Projeto 
--
-- Eliminacao das tabelas 
--
DROP TABLE Func_Proj CASCADE CONSTRAINT; 
DROP TABLE Projeto CASCADE CONSTRAINT; 
DROP TABLE Funcionario CASCADE CONSTRAINT; 
DROP TABLE Departamento CASCADE CONSTRAINT; 
--
-- Criacao das tabelas 
--
CREATE TABLE Departamento 
(Cod_Depto INTEGER, 
Nome_Depto VARCHAR(20), 
PRIMARY KEY(Cod_Depto)); 
CREATE TABLE Funcionario 
(Cod_Func INTEGER, 
Nome_Func VARCHAR(20), 
Salario INTEGER, 
Cod_Depto INTEGER, 
PRIMARY KEY(Cod_Func), 
 FOREIGN KEY (Cod_Depto) REFERENCES Departamento (Cod_Depto)); 
CREATE TABLE Projeto 
(Cod_Proj INTEGER, 
 Nome_Proj VARCHAR(20), 
  Duracao INTEGER, 
 PRIMARY KEY(Cod_Proj)); 
CREATE TABLE Func_Proj 
(Cod_Func INTEGER, 
 Cod_Proj INTEGER, 
 Horas_Trab INTEGER, 
 PRIMARY KEY(Cod_Func, Cod_Proj), 
 FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func), 
 FOREIGN KEY (Cod_Proj) REFERENCES Projeto(Cod_Proj)); 
-- Insercaoo de dados na tabela Departamento 
INSERT 
INTO Departamento (Cod_Depto, Nome_Depto) 
VALUES (1, 'Marketing'); 
INSERT 
INTO Departamento (Cod_Depto, Nome_Depto) 
VALUES (2, 'Vendas'); 
INSERT 
INTO Departamento (Cod_Depto, Nome_Depto) 
VALUES (3, 'Dados'); 
INSERT 
INTO Departamento (Cod_Depto, Nome_Depto) 
VALUES (4, 'Pesquisa'); 
-- Insercao de dados na tabela Funcionario
INSERT 
INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) 
VALUES (101, 'Joao da Silva Santos', 2000, 2); 
INSERT 
INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) 
VALUES (102, 'Mario Souza', 1500, 1); 
INSERT 
INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) 
VALUES (103, 'Sergio Silva Santos', 2400, 2); 
INSERT 
INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) 
VALUES (104, 'Maria Castro', 1200, 1); 
INSERT 
INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) 
VALUES (105, 'Marcio Silva Santana', 1400, 4); 
-- Insercao de dados na tabela Projeto 
INSERT 
INTO Projeto (Cod_Proj, Nome_Proj, Duracao) 
VALUES (1001, 'SistemaA', 2); 
INSERT 
INTO Projeto (Cod_Proj, Nome_Proj, Duracao) 
VALUES (1002, 'SistemaB', 6); 
INSERT 
INTO Projeto (Cod_Proj, Nome_Proj, Duracao) 
VALUES (1003, 'SistemaX', 4); 
-- Insercao de dados na tabela Func_Proj 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (101, 1001, 24); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (101, 1002, 160); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (102, 1001, 56); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (102, 1003, 45); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (103, 1001, 86); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (103, 1003, 64); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (104, 1001, 46); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (105, 1001, 84); 
INSERT 
INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) 
VALUES (105, 1002, 86); 
COMMIT; 

set echo on

--
-- questao 1
--Faça um teste de PK (primary key) em uma das tabelas que você já inseriu dados (mostre como você fez esse teste e qual foi o erro encontrado). Ou seja, viole um valor de PK e veja o que acontece

select * from Departamento;

update Departamento
set Cod_Depto = 5
where Cod_Depto = 1;

--Depois de executar o comando "update", o sistema não aceita a violação 

select * from Departamento;

--e não executa o comando 

--
-- questao 2
--Faça um teste de FK (foreign key) em uma das tabelas que você já inseriu dados (mostre como você fez esse teste e qual foi o erro encontrado). Ou seja, viole um valor de FK e veja o que acontece

select * from Funcionario;

update Funcionario
set Cod_Depto = 5
where Cod_Depto = 2;

--Depois de executar o comando "update", o sistema encontra um erro de violação da chave estrangeira

select * from Funcionario;

--E não altera a tabela 

--
-- questao 3
--



--
-- questao 4
--



--
-- questao 5
--


--
-- questao 6
--

spool off

exit


