/*select * from alunos;*/

select MATRICULA_ALUNO
	 , initcap(NOME_ALUNO) as NOME_ALUNO
	 , data_nascimento  as DATA_NASCIMENTO
	 from alunos
	 	where data_nascimento <= to_date('01/01/2000','DD/MM/YYYY');

select count(1)
	from alunos
		where data_nascimento >= '01/01/2000';

select A.NOME_ALUNO
	 , TA.TELEFONE
	 from alunos a 
	 	inner join telefones_alunos ta
	 		on A.matricula_aluno = TA.matricula_aluno 
	 order by A.nome_aluno;

select *
	from alunos
		where nome_aluno like '%ANTONIO%';

select *
	from professores p 
		where not exists
			(select 1
			 	from ofertas o 
			 		where O.matricula_professor = P.matricula_professor);

select *
	from disciplinas
		where codigo_disciplina in (85853, 75189);

select *
	from disciplinas
		where codigo_disciplina_dependencia is null;

select to_char(O.HORARIO_INICIAL, 'HH24:MI') as HORARIO_INICIAL
	 , to_char(O.HORARIO_FINAL, 'HH24:MI') as HORARIO_FINAL
	 , P.NOME_PROFESSOR
	 from OFERTAS O
	 	inner join PROFESSORES P
	 		on O.matricula_professor = P.matricula_professor 
	 	where P.matricula_professor = 55125;

select A.NOME_ALUNO
	 , AO.SEMESTRE
	 , to_char(O.HORARIO_INICIAL, 'HH24:MI') as HORARIO_INICIAL
	 , to_char(O.HORARIO_FINAL, 'HH24:MI') as HORARIO_FINAL
	 , LOWER(O.DIA_SEMANA) as DIA_SEMANA
	 , D.NOME_DISCIPLINA
	 , P.NOME_PROFESSOR
	 , D.CARGA_HORARIA
	 from alunos_ofertas ao 
	 	inner join ofertas o 
	 		on AO.codigo_oferta = O.codigo_oferta
	 	inner join ALUNOS A
	 		on AO.matricula_aluno = A.matricula_aluno 
	 	inner join PROFESSORES P
	 		on O.matricula_professor = P.matricula_professor
	 	inner join DISCIPLINAS D
	 		on O.codigo_disciplina = D.codigo_disciplina 
	 	where D.codigo_disciplina_dependencia is not null
	 order by A.nome_aluno;
	 	
select D.NOME_DISCIPLINA as PRE_REQUISITO
	 , DD.NOME_DISCIPLINA as DISCIPLINA
	 from disciplinas d 
	 	inner join DISCIPLINAS DD
	 		on D.codigo_disciplina = DD.codigo_disciplina_dependencia
	 order by 1,2;

select count(1) as TOTAL_DISCIPLINAS
	 , P.NOME_PROFESSOR
	 from OFERTAS O
	 	inner join DISCIPLINAS D 
	 		on O.codigo_disciplina = D.codigo_disciplina 
	 	inner join professores p 
	 		on O.matricula_professor = P.matricula_professor 
	 group by P.nome_professor 
	 order by P.nome_professor;


	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 




