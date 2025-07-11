col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._Lab06_Agrupamento.txt

--

-- Nome   :  Alan Diego Ribeiro de Azevedo


-- Numero : 41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;

select table_name, owner
from all_tables
where owner like 'BD_4H12_30'
;
--
-- questao 1
--
-- Obtenha, para cada c?digo de cada departamento, 
-- o total gasto com sal?rio pago aos funcion?rios, bem
-- como a m?dia salarial de cada departamento.

select cod_depto, sum(salario), avg(salario), max(salario)
from bd_4h12_30.funcionario
group by cod_depto
;


--
-- questao 2
--
-- Obtenha somente o código dos departamentos que possuem uma quantidade 
-- de funcionários entre 2 e 10 funcionários.

select cod_depto ,count(cod_func)             
from funcionario
group by cod_depto
having count (cod_func)
between 2 and 10
;

--
-- questao 3
--
--Obtenha, para cada funcionário (considere somente o código do funcionário), 
-- a quantidade total de horas trabalhadas nos projetos como um todo.

select cod_func, sum(horas_trab)
from bd_4h12_30.func_proj
where cod_func > 102
group by cod_func
having sum(horas_trab) > 50
order by sum(horas_trab) asc
;

--
-- questao 4
--
-- Obtenha o código de cada projeto e a quantidade to tal de horas trabalhadas
-- pelos funcionários em cada um deles, em ordem decrescente do total de horas, 
-- mas desde que o total de horas trabalhadas no projeto seja maior que 200.
--

select cod_proj, sum(horas_trab)
from func_proj
group by cod_proj
having sum(horas_trab)> 200 
order by sum (horas_trab) desc
;

--
-- questao 5
--
-- Obtenha, para cada projeto (considere somente o c?digo do projeto),
-- a quantidade de funcion?rios que trabalharam em cada um deles,
-- mas desde que o n?mero de funcion?rios por projeto seja superior 
-- a tr?s funcion?rios.

select cod_proj, count(cod_func), sum(horas_trab)
from bd_4h12_30.func_proj
where cod_proj in (1001, 1010)
group by cod_proj
having count(cod_func) >= 2
;

--
-- questao 6
--

spool off

exit