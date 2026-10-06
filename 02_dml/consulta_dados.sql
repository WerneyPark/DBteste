select * from alunos;
/* a consulta retorna todos os dados da tabela aluno, como matricula nome e data de nascimento  */


select MATRICULA_ALUNO
	 , initcap(NOME_ALUNO) as NOME_ALUNO
	 , data_nascimento  as DATA_NASCIMENTO
	 from alunos
	 	where data_nascimento <= to_date('01/01/2000','DD/MM/YYYY');

/* a consulta retorna uma tabela com matricula do aluno nome e data de nasimento. porem com a condição da data de nascimento ser menor ou igual a 2000 */


select count(1)
	from alunos
		where data_nascimento >= '01/01/2000';

/* a consulta retorna uma tabela com a contagem do numero de alunos que a data de nascimento é maior que 01/01/2000*/


select initcap(nome_aluno) as NOME_ALUNO
	 , TA.TELEFONE
	 from alunos a 
	 	inner join telefones_alunos ta
	 		on A.matricula_aluno = TA.matricula_aluno 
	 order by A.nome_aluno;

/* a consulta  retorna uma tabela  de alunos e numero de  telefones ordenadas pelo nome do aluno*/



select *
	from alunos
		where nome_aluno like '%ANTONIO%';

/* a consulta retorna uma tabela com os dados do anulo quando houver antonio em alguma parte do nome*/


select *
	from professores p 
		where not exists
			(select 1
			 	from ofertas o 
			 		where O.matricula_professor = P.matricula_professor);


/*retorna professores que não estão vinculados a nenhuma oferta de aulas*/



select *
	from disciplinas
		where codigo_disciplina in (85853, 75189);

/* retorna da tablela disciplina as que tem o codigo igual aos parametros*/




select *
	from disciplinas
		where codigo_disciplina_dependencia is null;

/* retorna as disciplinas que não tem nenhum pre requisito*/


select to_char(O.HORARIO_INICIAL, 'HH24:MI') as HORARIO_INICIAL
	 , to_char(O.HORARIO_FINAL, 'HH24:MI') as HORARIO_FINAL
	 , P.NOME_PROFESSOR
	 from OFERTAS O
	 	inner join PROFESSORES P
	 		on O.matricula_professor = P.matricula_professor 
	 	where P.matricula_professor = 55125;


/* o horario de aulas do professor que tem a matricula 55125 */

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


	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 




