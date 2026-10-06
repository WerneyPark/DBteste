begin;

update disciplinas
	set codigo_disciplina_dependencia = null
		where codigo_disciplina_dependencia = 85853
			or codigo_disciplina_dependencia = 75189;


delete from disciplinas 
	where codigo_disciplina = 75189
		or codigo_disciplina = 85853;

delete from ofertas 
	where codigo_oferta = 1742;

delete from professores 
	where matricula_professor 
		not in (select matricula_professor
					from ofertas);

delete from telefones_alunos 
	where telefone like '27%';

rollback;