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
-- Retorne o nome dos alunos que já cursaram alguma disciplina.

select a.NOME_ALUNO, a_d.MATRICULA
from aluno a inner join aluno_disc a_d
on(a.MATRICULA = a_d.MATRICULA);

--
-- questao 2
-- Retorne o nome de cada professor que orienta aluno e, para cada um, a
-- quantidade de orientandos.

select p.NOME_PROFESSOR, count(a.MATRICULA) 
from professor p inner join aluno a
on(p.COD_PROFESSOR = a.COD_PROFESSOR_ORIENTADOR)
group by p.nome_professor
;

--
-- questao 3
-- Retorne o nome dos alunos que já cursaram as disciplinas de ‘Banco de Dados I’
-- ou ‘Banco de Dados II’.

select a.NOME_ALUNO, d.NOME_DISCIPLINA
from aluno a, disciplina d
where((d.NOME_DISCIPLINA = 'Banco de Dados I') or (d.NOME_DISCIPLINA = 'Banco de Dados II')) 
and(a.COD_CURSO = d.COD_CURSO)
;
--
-- questao 4
-- Retorne o nome de cada disciplina, o nome do curso que cada uma pertence,
-- bem como o nome do instituto que a disciplina pertence

select d.NOME_DISCIPLINA, c.nome_curso, i.nome_instituto
from disciplina d inner join curso c
on (d.cod_curso = c.cod_curso)
inner join instituto i on (c.cod_instituto = i.cod_instituto)
;

--
-- questao 5
-- Retorne o nome de cada aluno do curso de 'Ciencia da Computacao' e, para cada
-- aluno, a quantidade de disciplinas já cursadas e a nota média de cada um.

select a.nome_aluno, avg (a_d.nota)
from aluno a inner join curso c
on(a.cod_curso = a.cod_curso)
inner join aluno_disc a_d on(a.matricula = a_d.matricula)
where(c.nome_curso = 'Ciencia da Computacao')
group by a.nome_aluno
;
--
-- questao 6
--

spool off

exit
