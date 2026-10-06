drop sequence DISCIPLINAS_SEQ;
drop sequence OFERTAS_SEQ;


drop table alunos cascade;
drop table professores cascade;
drop table alunos_ofertas cascade;
drop table disciplinas cascade;
drop table telefones_alunos cascade;
drop table ofertas cascade;


create table ALUNOS(
	MATRICULA NUMERIC not null,
	NOME VARCHAR(100) not null,
	DATA_NASCIMENTO DATE not null
);

create table TELEFONES(
	TELEFONE VARCHAR(11) not null,
	MATRICULA numeric not null
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
	HORARIO_INICIAL TIME not null,
	HORARIO_FINAL TIME not null,
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

alter table ALUNOS
	add EMAIL VARCHAR(200),
	add CPF VARCHAR(11);

alter table PROFESSORES
	add CONTATO VARCHAR(200);

alter table OFERTAS add DATA_CRIACAO DATE;

alter table ALUNOS 
	alter EMAIL type VARCHAR(250);

alter table OFERTAS 
	alter DATA_CRIACAO type DATE, 
	alter DATA_CRIACAO set not null,
	alter DATA_CRIACAO set default CURRENT_DATE;

alter table alunos
	rename column MATRICULA 
		to MATRICULA_ALUNO;
alter table alunos
	rename column NOME 
		to NOME_ALUNO;

alter table alunos_ofertas 
	rename column MATRICULA
		to MATRICULA_ALUNO;

alter table professores 
	rename column MATRICULA 
		to MATRICULA_PROFESSOR;

alter table professores 
	rename column NOME 
		to NOME_PROFESSOR;

alter table disciplinas 
	rename column EMENTA 
		to EMENTA_DISCIPLINA;

alter table ofertas 
	rename column MATRICULA
		to MATRICULA_PROFESSOR;

alter table telefones
	rename column MATRICULA
		to MATRICULA_ALUNO;

drop view alunos_matriculados;
drop view disciplinas_professor;

create view alunos_matriculados as(
	select
		A.MATRICULA_ALUNO,
		A.NOME_ALUNO as NOME_ALUNO,
		AO.SEMESTRE,
		O.HORARIO_INICIAL,
		O.HORARIO_FINAL,
		O.DIA_SEMANA,
		P.NOME_PROFESSOR as PROFESSOR,
		D.NOME_DISCIPLINA
	from ALUNOS_OFERTAS AO
		inner join ALUNOS A
			on AO.MATRICULA_ALUNO = A.MATRICULA_ALUNO
		inner join OFERTAS O
			on AO.CODIGO_OFERTA = O.CODIGO_OFERTA
		inner join PROFESSORES P
			on O.MATRICULA_PROFESSOR = P.MATRICULA_PROFESSOR
		inner join DISCIPLINAS D
			on O.CODIGO_DISCIPLINA = D.CODIGO_DISCIPLINA
);

create view DISCIPLINAS_PROFESSOR as (
	select P.NOME_PROFESSOR as NOME_PROFESSOR
		 , P.FORMACAO
		 , D.CODIGO_DISCIPLINA
		 , D.NOME_DISCIPLINA
		 , D.CARGA_HORARIA
		 
	from OFERTAS O
		inner join professores p 
			on O.MATRICULA_PROFESSOR = P.MATRICULA_PROFESSOR
		inner join disciplinas d
			on O.CODIGO_DISCIPLINA = D.CODIGO_DISCIPLINA

);


alter table telefones
	rename to TELEFONES_ALUNOS;

alter table professores
	drop column CONTATO;

alter table alunos 
	drop column EMAIL;

alter table ALUNOS
	drop column CPF;

alter table TELEFONES_ALUNOS
	add primary key (TELEFONE);

alter table alunos 
	add primary key (MATRICULA_ALUNO);

alter table alunos_ofertas 
	add primary key (MATRICULA_ALUNO, CODIGO_OFERTA);

alter table ofertas 
	add primary key (CODIGO_OFERTA);

alter table professores 
	add primary key (MATRICULA_PROFESSOR);

alter table disciplinas 
	add primary key (CODIGO_DISCIPLINA);

alter table TELEFONES_ALUNOS
	add constraint MATRICULA_ALUNO_FK
	foreign key (MATRICULA_ALUNO)
	references alunos (MATRICULA_ALUNO);

alter table alunos_ofertas 
	add constraint ALUNOS_ALUNO_FK
	foreign key (MATRICULA_ALUNO)
	references alunos (MATRICULA_ALUNO);

alter table alunos_ofertas 
	add constraint ALUNOS_OFERTA_FK
	foreign key (CODIGO_OFERTA)
	references OFERTAS (CODIGO_OFERTA);

alter table ofertas 
	add constraint OFERTAS_PROFESSOR_FK
	foreign key (MATRICULA_PROFESSOR)
	references professores (MATRICULA_PROFESSOR);

alter table ofertas 
	add constraint OFERTAS_DISCIPLINAS_FK
	foreign key (CODIGO_DISCIPLINA)
	references disciplinas (CODIGO_DISCIPLINA);

alter table disciplinas 
	add constraint DISCIPLINAS_DEPENDENCIA_FK
	foreign key (CODIGO_DISCIPLINA_DEPENDENCIA)
	references disciplinas (CODIGO_DISCIPLINA);








