col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._Lab04_Select.txt

--

-- Nome   :  


-- Numero : 


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;


--
-- questao 1
--
-- Obtenha o nome dos funcionários que ganham mais de 1800, 
-- em ordem decrescente de salário.

select nome_func , salario
from funcionario
order by salario desc
;

select nome_func , salario
from funcionario
order by 2 desc
;

--
-- questao 2
--
-- Obtenha, sem repetição e em ordem crescente, 
-- os valores dos salários pagos aos funcionários
select distinct salario
from funcionario
ORDER BY SALARIO ASC
;

--
-- questao 3
--



--
-- questao 4
--
-- Obtenha o nome dos funcionários que possuem o 
-- sobrenome Silva no nome, em ordem decrescente de salário
select nome_func, salario 
from funcionario
where nome_func like '%Silva%'
;

select upper(nome_func) , salario
from funcionario
where UPPER(nome_func) like '%Silva%'
;

--
-- questao 5
--
-- Obtenha, sem repetição, os códigos dos funcionários que trabalharam 
-- no projeto de código 1001 mais de 50 horas
-- ou que trabalharam no projeto de código 1003 mais de 60 horas.

select cod_func
from
func_proj
where ((cod_proj = 1001) and (horas_trab > 50))
or    ((cod_proj = 1003) and (horas_trab > 60))
;
--
-- questao 6
--

--
-- questao 7
-- 
-- Obtenha a média de salário pago aos funcionários,
-- mas somente para os funcionários do departamento de código 2


select avg(salario)
from funcionario
where cod_depto = 2
;


spool off

exit
