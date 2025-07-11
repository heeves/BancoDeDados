col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab08_JuncaoII.txt

--

-- Nome   :  Alan Diego Ribeiro de Azevedo


-- Numero : 41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;



--
-- questão 1
--
-- Obtenha o nome do funcionário, o seu salário e o nome do departamento que 
-- cada um pertence, mas somente para aqueles funcionários que são do departamento
-- de ‘Vendas’ ou ‘Pesquisa’.

select funcionario.NOME_FUNC, funcionario.SALARIO, departamento.NOME_DEPTO
from funcionario, departamento
where((departamento.NOME_DEPTO = 'Vendas')or(departamento.NOME_DEPTO = 'Pesquisa'))
and(funcionario.COD_DEPTO=departamento.COD_DEPTO)
;

--
-- questão 2
--
-- Obtenha, sem repetição, o nome dos funcionários que trabalharam no projeto 
-- de código 1001 mais de 50 horas ou que trabalharam no projeto de código 1003
-- mais de 60 horas.

select distinct funcionario.NOME_FUNC, func_proj.COD_PROJ
from funcionario, func_proj
where (((func_proj.COD_PROJ = 1001)and(func_proj.HORAS_TRAB > 50))or((func_proj.COD_PROJ = 1003)and(func_proj.HORAS_TRAB > 60)))
and(funcionario.COD_FUNC = func_proj.COD_FUNC)
;

--
-- questão 3
--
-- Obtenha a média salarial, o maior salário, o menor salário e a quantidade de
-- funcionários do departamento de ‘Vendas’.

select avg(funcionario.SALARIO) as media_salario,
       max(funcionario.SALARIO) as maximo_salario,
       min(funcionario.SALARIO) as minimo_salario,
       count(funcionario.COD_DEPTO) as quant_func
from funcionario, departamento
where(departamento.NOME_DEPTO = 'Vendas')
and(funcionario.COD_DEPTO = departamento.COD_DEPTO)
;

--
-- questão 4
--
-- Obtenha o nome de cada departamento e o total gasto com salário pago aos
-- funcionários de cada departamento, bem como a média salarial.

select departamento.NOME_DEPTO, sum(funcionario.SALARIO) as total_pago,
                                avg(funcionario.SALARIO) as media_salario
from departamento, funcionario
where(departamento.COD_DEPTO=funcionario.COD_DEPTO)
group by departamento.NOME_DEPTO
;

--
-- questão 5
--
-- Obtenha o nome de cada funcionário e o total a ser pago para cada
-- funcionário, de acordo com o total de horas que cada um trabalhou
-- nos projetos, considerando que o valor de cada hora trabalhada, de cada
-- funcionário, é 100 reais.

select funcionario.NOME_FUNC, (func_proj.HORAS_TRAB * 100) as novo_salario
from funcionario, func_proj
where(funcionario.COD_FUNC = func_proj.COD_FUNC);
group by func_proj.horas_trab
;

spool off

exit
