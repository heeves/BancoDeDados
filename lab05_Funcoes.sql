col spool_name new_value spname noprint
set serveroutput on
set echo on
set linesize 150 pagesize 150

SELECT replace((sys_context ('USERENV', 'OS_USER')),'MACKLABS','') spool_name 
                                              FROM sys.dual;

spool c:\temp\&spname._lab05_Funcoes.txt

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
-- Obtenha a média, o valor máximo e o valor mínimo dos salários pagos aos funcionários.

select avg(Salario) as Media_Salario,
       max(salario) as Maior_Salario,
       min(salario) as Memor_Salario
from funcionario
;


--
-- questao 2
--
--Obtenha a quantidade de funcionários que ganham um salário entre 2000 e 10000 
--(inclusive estes valores).

select count(nome_func) as Quant_Func
from funcionario
where (salario between 2000 and 10000)
;


--
-- questao 3
--
-- Obtenha a quantidade de funcionários cujo nome começa com a letra M.

select count (nome_func) as Inic_M  
from funcionario
where (nome_func like 'M%')
; 

--
-- questao 4
-- a
-- Obtenha a quantidade total de horas que foram utilizadas pelos funcionários no projeto de código 1001

select sum (horas_trab) as horas_1001
from func_proj
where (cod_proj = 1001)
;

-- quest�o 2
-- Obtenha a quantidade total de horas que foram utilizadas pelos funcionários no projeto de código 1002.

select sum (horas_trab) as horas_1002
from func_proj
where (cod_proj = 1002)
;

-- quest�o 3
-- Obtenha a quantidade total de horas que foram utilizadas pelos funcionários no projeto de código 1003.

select sum (horas_trab) as horas_1003
from func_proj
where (cod_proj = 1003)
;

-- quest�o 4
-- E se no banco de dados tivesse 1000 projetos diferentes, o que você faria 
-- para retornar a quantidade total de horas utilizadas em cada um dos 1000 projetos?

select sum (horas_trab) as horas_(número do projeto)
from func_proj
where (cod_proj = (número do projeto))
;

--
-- questao 5
--
-- Obtenha o total que deverá ser pago ao funcionário de código 102, de acordo 
-- com o total de horas que ele trabalhou nos projetos, considerando que o valor 
-- de cada hora trabalhada deste funcionário é 100 reais

select cod_func,(horas_trab * 100)
from func_proj
where (cod_func = 102)
;

--
-- questao 6
--

spool off

exit
