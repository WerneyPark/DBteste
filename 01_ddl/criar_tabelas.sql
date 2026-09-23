drop table alunos cascade;
drop table professores cascade;
drop table alunos_ofertas cascade;
drop table disciplinas cascade;
drop table telefones cascade;
drop table ofertas cascade;


create table ALUNOS(
	MATRICULA NUMERIC not null,
	NOME VARCHAR(100) not null,
	DATA_NASCIMENTO DATE not null
);

create table PROFESSORES(
	MATRICULA NUMERIC(5) not null,
	NOME VARCHAR(100) not null,
	FORMACAO VARCHAR(100) not null
);

create table ALUNOS_OFERTAS(
	MATRICULA numeric not null,
	CODIGO_OFERTA numeric not null,
	LIMITE_ALUNOS numeric not null,
	SEMESTRE VARCHAR(6),
	DATA_INICIAL DATE not null,
	DATA_FINAL DATE not null	
);

create table OFERTAS(
	CODIGO_OFERTA numeric not null,
	HORARIO_INICIAL TIMESTAMP not null,
	HORARIO_FINAL TIMESTAMP not null,
	DIA_SEMANA VARCHAR(20) not null,
	MATRICULA NUMERIC(5) not null,
	CODIGO_DISCIPLINA numeric not null
);

create table DISCIPLINAS(
	CODIGO_DISCIPLINA numeric not null,
	NOME_DISCIPLINA VARCHAR(100) not null,
	CARGA_HORARIA NUMERIC(3) not null,
	EMENTA VARCHAR(2000) not null,
	CODIGO_DISCIPLINA_DEPENDENCIA NUMERIC
);

create table TELEFONES(
	TELEFONE VARCHAR(11) not null,
	MATRICULA numeric not NULL
);



create view DISCIPLINAS_PROFESSOR as (
	select P.NOME as PROFESSOR
		 , P.FORMACAO
		 , D.CODIGO_DISCIPLINA
		 , D.NOME_DISCIPLINA
		 , D.CARGA_HORARIA
		 
	from OFERTAS O
	inner join professores p 
	on O.MATRICULA = P.MATRICULA
	inner join disciplinas d
	on O.CODIGO_DISCIPLINA = D.CODIGO_DISCIPLINA

);


create view ALUNOS_MATRICULADOS as (
	select A.MATRICULA
		 , A.NOME as ALUNO
		 , AO.SEMESTRE
		 , O.HORARIO_INICIAL
		 , O.HORARIO_FINAL
		 , O.DIA_SEMANA
		 , P.NOME as PROFESSOR
		 , D.NOME_DISCIPLINA
		 
		 from alunos_ofertas ao 
		 inner join alunos a 
		 on AO.MATRICULA = A.MATRICULA
		 inner join ofertas o 
		 on AO.CODIGO_OFERTA = O.CODIGO_OFERTA
		 inner join professores p 
		 on O.MATRICULA = P.MATRICULA
		 inner join disciplinas d 
		 on O.CODIGO_DISCIPLINA = D.CODIGO_DISCIPLINA
);

create index ALUNOS_NOME_IDX on ALUNOS(NOME);
create index OFERTAS_DIA_IDX on OFERTAS(DIA_SEMANA);
create index DISCIPLINA_NOME_IDX on DISCIPLINAS(NOME_DISCIPLINA);
create index PROFESSORES_NOME_IDX on PROFESSORES(NOME);

create sequence DISCIPLINAS_SEQ;
create sequence OFERTAS_SEQ;

alter table ALUNOS add
	EMAIL VARCHAR2(200),
	CPF VARCHAR2(11);






