col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab08_JuncaoII.txt

--

-- Nome   :  Alan Diego Ribeiro de Azevedo


-- Numero :  41143485


SELECT sys_context ('USERENV', 'IP_ADDRESS')  FROM sys.dual;
SELECT sys_context ('USERENV', 'HOST')        FROM sys.dual;
SELECT sys_context ('USERENV', 'OS_USER') , 
  to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss')  FROM sys.dual;


--
-- questao 1
-- Obtenha o nome dos projetos que o funcionário 'Mario Souza' trabalhou.

select projeto.nome_proj
from projeto, funcionario, func_proj
where(funcionario.nome_func = 'Mario Souza')
and(projeto.cod_proj = func_proj.cod_proj)
and(func_proj.cod_func = funcionario.cod_func)
;

--
-- questao 2
-- Obtenha o nome dos funcionários que trabalharam no projeto 'SistemaB' ou 'SistemaX

select funcionario.NOME_FUNC
from funcionario, func_proj, projeto
where((projeto.NOME_PROJ = 'Sistema B')or(projeto.NOME_PROJ = 'SistemaX'))
and(funcionario.COD_FUNC = func_proj.COD_FUNC)
and(func_proj.COD_PROJ = projeto.COD_PROJ)
;

--
-- questao 3
-- Obtenha o nome do funcionário, o nome do(s) projeto(s) que cada um trabalhou,
-- juntamente com o número de horas trabalhadas em cada projeto.

select funcionario.NOME_FUNC, projeto.NOME_PROJ, func_proj.HORAS_TRAB
from funcionario, projeto, func_proj
where (funcionario.COD_FUNC = func_proj.COD_FUNC)
and (projeto.COD_PROJ = func_proj.COD_PROJ)
order by funcionario.nome_func
;
 
--
-- questao 4
-- Obtenha o nome de cada funcionário e a quantidade de projetos que cada um
-- trabalhou, mas somente para os funcionários que pertencem ao departamento de
-- ‘Marketing

select funcionario.NOME_FUNC, count(func_proj.COD_PROJ) as qdte_proj
from funcionario, func_proj
where (funcionario.COD_DEPTO = 1)
and (funcionario.COD_FUNC = func_proj.COD_FUNC)
group by funcionario.nome_func
;

--
-- questao 5
-- Obtenha, sem repetição, o nome e duração dos projetos onde houve a
-- participação dos funcionários do departamento de ‘Marketing’
  
select distinct projeto.NOME_PROJ, projeto.DURACAO
from projeto, func_proj, departamento, funcionario
where (departamento.cod_depto = funcionario.cod_depto)
and (projeto.COD_PROJ = func_proj.COD_PROJ)
and (funcionario.cod_func = func_proj.cod_func)
and(departamento.nome_depto = 'Marketing')
;

--
-- questao 6
--

spool off

exit
