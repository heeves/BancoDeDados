CREATE TABLE Filme (
  nroFilme VARCHAR(20) NOT NULL,
  titulo VARCHAR(45) NULL,
  classificacao VARCHAR(20) NULL,
  duracao INTEGER UNSIGNED NULL,
  statusFilme VARCHAR(20) NULL,
  diretor VARCHAR(45) NULL,
  distribuidora VARCHAR(20) NULL,
  PRIMARY KEY(nroFilme)
);

insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (1,'A esperança - Parte 2',livre,137,'emExibição','Gary Ross','Paris Filmes');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (2,'O pequeno Principe', livre,89,'em Espera','Antonie de Saint Exupéry','Paris Filmes');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (3,'Atividade Paranormal',14,120,'EmExibiçao','Oren Peli','Paramount');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (4,'Procurando a Dory','livre',90,'em Espera','Andrew Stantom','Walt Disney');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (5,'Titanic','Livre',118,'Em Exibição','James Cameron','Herbert Richers');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (6,'Homem Formiga','Livre',97, 'em Espera','Peyton Reed','Walt Disney');
insert into Filme(nro_Filme,titulo,classificacao, duracao, statusFilme, diretor, distribuidora)
VALUES (7, 'O ultimo Caçador de Bruxas',16,57,'em Espera',' Bruno Aveillan','Paris Filmes');

    --------------   FAZER SEQUENCE -----------------
CREATE TABLE Sala (
  nroSala INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  capcidade INTEGER UNSIGNED NULL,
  statusSala VARCHAR(20) NULL,
  PRIMARY KEY(nroSala)
);

insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (1,45,'livre');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (2,53,'Ocupada');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (3,46,'Livre');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (4,45,'Livre');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (5,46,'Ocupada');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (6,52,'Ocupada');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (7,53,'Ocupada');
insert into Sala(nro_Sala,capcidade, statusSala)
VALUES (8,47,'Livre');

CREATE TABLE Ator (
  idAtor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  nacionalidade VARCHAR(20) NULL,
  idade INTEGER UNSIGNED NULL,
  premiaçoes INTEGER UNSIGNED NULL,
  PRIMARY KEY(idAtor)
);


insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (1,'Vin Diesel','americano',39,5);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (2,'jennifer lawrence','americana',22,3);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (3,'Rodrigo Santoro','brasileiro',37,7);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (4,'Brad Pitt', americano,40,0);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (5,'Omar Sy','Frances',37,4);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (6,'Bruna Marquezine','Brasileira',19,3);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (7,'Leticia Sabatella',43,2);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (8,'Rocco Sifreddi','italiano',43,4);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (9,'David Caruso','america',56,6);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (10,'Mark Harmon',46,8);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (11,'Julianna Margulies',49,7);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (12,'Lauren Graham',48,11);
insert into Ator(idAtor,nome,nacionalidade, idade, premiaçoes)
VALUES (13,'ashton kutcher',29,10);

CREATE TABLE Ator_has_Filme (
  Ator_idAtor INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Ator_idAtor),
  INDEX Ator_has_Filme_FKIndex1(Ator_idAtor),
  FOREIGN KEY(Ator_idAtor)
    REFERENCES Ator(idAtor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Sessao (
  nroSessao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Filme_nroFilme VARCHAR() NOT NULL,
  horario INT NULL,
  status_Sessao VARCHAR(20) NULL,
  PRIMARY KEY(nroSessao),
  INDEX Sessao_FKIndex1(Filme_nroFilme),
  FOREIGN KEY(Filme_nroFilme)
    REFERENCES Filme(nroFilme)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

insert into Sessao(nroSessao,horario,status_Sessao, nroSala)
VALUES (1,'13:40','em Espera',3);
insert into Sessao(nroSessao,horario,status_Sessao)
VALUES (2,'20h35','Em espera',2);
insert into Sessao(nroSessao,horario,status_Sessao)
VALUES (3,'14h00','em Exibição',6);
insert into Sessao(nroSessao,horario,status_Sessao)
VALUES (4,'15h50','em espera',4);
insert into Sessao(nroSessao,horario,status_Sessao)
VALUES ();
insert into Sessao(nroSessao,horario,status_Sessao)
VALUES ();

CREATE TABLE Sala_has_Sessao (
  Sala_nroSala INTEGER UNSIGNED NOT NULL,
  Sessao_nroSessao INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Sala_nroSala, Sessao_nroSessao),
  INDEX Sala_has_Sessao_FKIndex1(Sala_nroSala),
  INDEX Sala_has_Sessao_FKIndex2(Sessao_nroSessao),
  FOREIGN KEY(Sala_nroSala)
    REFERENCES Sala(nroSala)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Sessao_nroSessao)
    REFERENCES Sessao(nroSessao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Filme_has_Ator_has_Filme (
  Filme_nroFilme VARCHAR() NOT NULL,
  Ator_has_Filme_Ator_idAtor INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Filme_nroFilme, Ator_has_Filme_Ator_idAtor),
  INDEX Filme_has_Ator_has_Filme_FKIndex1(Filme_nroFilme),
  INDEX Filme_has_Ator_has_Filme_FKIndex2(Ator_has_Filme_Ator_idAtor),
  FOREIGN KEY(Filme_nroFilme)
    REFERENCES Filme(nroFilme)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Ator_has_Filme_Ator_idAtor)
    REFERENCES Ator_has_Filme(Ator_idAtor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Ingresso (
  idIngresso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Sessao_nroSessao INTEGER UNSIGNED NOT NULL,
  tipoIngresso VARCHAR(20) NULL,
  PRIMARY KEY(idIngresso),
  INDEX Ingresso_FKIndex1(Sessao_nroSessao),
  FOREIGN KEY(Sessao_nroSessao)
    REFERENCES Sessao(nroSessao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

Spool c:\temp\nome_arquivo.txt
Set echo on
Show user


--  Elaborar e resolver 1 consulta contendo somente função(es) agregada(s) – sem
-- agrupamento - e com condição(ões) na cláusula WHERE, mas utilizando duas ou mais
-- tabelas (junção de tabelas);
select FROM group by having count

select cod_depto ,count(cod_func)             
from funcionario
group by cod_depto
having count (cod_func)
;

select cod_proj, sum(horas_trab)
from func_proj
group by cod_proj
having sum(horas_trab)> 200 
;
-- ?Elaborar e resolver 1 consulta contendo GROUP BY e HAVING, mas envolvendo duas ou
-- mais tabelas (junção de tabelas);


--? Elaborar e resolver 1 consulta contendo GROUP BY e HAVING, e com condição(ões) na
--cláusula WHERE, mas envolvendo três ou mais tabelas (junção de tabelas);
? Elaborar e resolver 2 consultas envolvendo três ou mais tabelas e com condições na
cláusula WHERE (junção de tabelas)
SELECT 
