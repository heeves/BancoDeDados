col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab02_Insert.txt

--

-- Nome   :  Alan Diego Ribeiro de Azevedo


-- Numero : 41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;



-- Nao se esqueca de incluir o ";"   no final de cada comando SQL 


set echo off

DROP TABLE Func_Proj CASCADE CONSTRAINT;
DROP TABLE Projeto CASCADE CONSTRAINT;
DROP TABLE Funcionario CASCADE CONSTRAINT;
DROP TABLE Departamento CASCADE CONSTRAINT;
--
-- criacao das tabelas
--
CREATE TABLE Departamento
(Cod_Depto INTEGER,
Nome_Depto VARCHAR(20)NOT NULL,
PRIMARY KEY(Cod_Depto)
);
CREATE TABLE Funcionario
(Cod_Func INTEGER,
Nome_Func VARCHAR(20) NOT NULL,
Salario INTEGER,
Cod_Depto INTEGER,
PRIMARY KEY(Cod_Func),
FOREIGN KEY (Cod_Depto) REFERENCES Departamento (Cod_Depto)
);
CREATE TABLE Projeto
(Cod_Proj INTEGER,
Nome_Proj VARCHAR(20) NOT NULL,
Duracao INTEGER,
PRIMARY KEY(Cod_Proj)
);
CREATE TABLE Func_Proj
(Cod_Func INTEGER,
Cod_Proj INTEGER,
Horas_Trab INTEGER,
PRIMARY KEY(Cod_Func, Cod_Proj),
FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
FOREIGN KEY (Cod_Proj) REFERENCES Projeto(Cod_Proj)
);

set echo on

--
-- questao 01
--


insert into Departamento (cod_depto, nome_depto)
            values       (1, 'Marketing');
            
commit;

select * from Departamento;


select max(cod_depto) + 1 from Departamento;

insert into Departamento 
           values
           ((select max(cod_depto) + 1 from Departamento), 'Vendas');

insert into Departamento 
           values
           ((select max(cod_depto) + 1 from Departamento), 'Dados');

insert into Departamento 
           values
           ((select max(cod_depto) + 1 from Departamento), 'Pesquisa');
 
 commit;   
 
select * from Departamento;
 
 

--
-- questao 02
--

insert into Funcionario values (101, 'Joao da Silva Santos', 2000, 2);
insert into Funcionario values (102, 'Mario Souza', 1500, 1);
insert into Funcionario values (103, 'Sergio Silva Santos', 2400, 2);
insert into Funcionario values (104, 'Maria Castro', 1200, 1);
insert into Funcionario values (105, 'Marcio Silva Santana', 1400, 4);

commit;

select * from Funcionario;

--
-- questao 03
--

insert into Projeto values (1001, 'SistemaA', 2);
insert into Projeto values (1002, 'SistemaB', 6);
insert into Projeto values (1003, 'SistemaX', 4);

commit;

select * from Projeto;

--
-- questao 04
--

insert into Func_Proj values ( 101, 1001, 24);
insert into Func_Proj values ( 101, 1002, 160);
insert into Func_Proj values ( 102, 1001, 56);
insert into Func_Proj values ( 102, 1003, 45);
insert into Func_Proj values ( 103, 1001, 86);
insert into Func_Proj values ( 103, 1003, 64);
insert into Func_Proj values ( 104, 1001, 46);
insert into Func_Proj values ( 105, 1001, 84);
insert into Func_Proj values ( 105, 1002, 86);

commit;

select * from Func_Proj;


spool off

exit