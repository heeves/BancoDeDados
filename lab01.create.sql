col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab01_Create.txt

--

-- Nome   :  Alan Diego Ribeiro de Azevedo


-- Numero : 41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;


--
-- questao 1
--
DROP TABLE Departamento cascade constraints;

CREATE TABLE Departamento
(
Cod_Depto INTEGER NOT NULL,
Nome_Depto VARCHAR(30),
PRIMARY KEY(Cod_Depto)
);


--
-- questao 2
--

DROP TABLE Funcionario cascade constraints;

CREATE TABLE Funcionario
(
Cod_Func INTEGER NOT NULL,
Nome_Func VARCHAR(30),
Salario INTEGER,
Cod_Depto VARCHAR(30),
PRIMARY KEY(Cod_Func)
);



--
-- questao 3
--

DROP TABLE Projeto cascade constraints;

CREATE TABLE Projeto
(
Cod_Proj INTEGER NOT NULL,
Nome_Proj VARCHAR(30),
Duracao INTEGER,
PRIMARY KEY(Cod_Proj)
);



--
-- questao 4
--

DROP TABLE Func_Proj cascade constraints;

CREATE TABLE Func_Proj
(
Cod_Func INTEGER NOT NULL,
Cod_Proj VARCHAR(30),
Horas_Trab VARCHAR(30),
PRIMARY KEY(Cod_Func)
);


--
-- questao 5
--


--
-- questao 6
--

spool off

exit


