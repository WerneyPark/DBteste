update alunos
	set data_nascimento = '29/04/2011'
		where matricula_aluno = 40004;

update professores
	set FORMACAO = 'PHD'
		where formacao = 'DOUTORADO';

update professores
	set FORMACAO = 'MSC'
		where MATRICULA_PROFESSOR = 55126 
			or matricula_professor = 55133; 
	
update disciplinas
	set CODIGO_DISCIPLINA_DEPENDENCIA = 31313
		where nome_disciplina = 'MACHINE LEARNING';

update ofertas
	set MATRICULA_PROFESSOR = 55128
		where codigo_disciplina = 12345
			and matricula_professor = 55125;

update alunos_ofertas AO
	set LIMITE_ALUNOS = 70
		where CODIGO_OFERTA
			in ( select O.CODIGO_OFERTA
				 	from ofertas o 
				 inner join disciplinas d on O.codigo_disciplina = D.codigo_disciplina 
				 	where D.nome_disciplina = 'NATURAL LANGUAGE PROCESSING');


commit;



