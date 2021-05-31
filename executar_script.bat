@echo off
prompt
prompt Executando laboratorio
prompt ==============================
prompt
prompt Substitua o campo xxxx_xx por informacoes do seu usuario oracle 
prompt Substitua o campo yy      por informacoes da atividade que esta sendo realizada 
prompt
rem Compilando arquivos via ms-dos / SO
set oracle_sid=oramack
cd C:\app\client\Administrador\product\12.1.0\client_1\BIN

sqlplus "bd_4l11_xx/bd_4l11_xx@oramack" @c:\temp\Lab04_Select.sql 

exit
