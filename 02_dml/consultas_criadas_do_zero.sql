select * from clientes;

select nome_produto
	from produtos;

select distinct cidade
	 , uf 
	 , cep
	 from clientes;

select *
	from pedidos p
		where p.codigo_cliente = 04
			and p.valor_total > 10000;

select *
	from pedidos p 
		where (p.valor_total < 100
			or p.valor_total > 5000)
			and p.data_pedido between '13/01/2007' and '14/01/2007';

select *
	from clientes c 
		where c.codigo_cliente < 05
			or c.codigo_cliente > 25;
	 

select *
	from produtos p 
	 where p.nome_produto like 'm%'
	 	and p.nome_produto like '%an%'
	 	and p.nome_produto like '%a';

select *
	from produtos p 
		where p.nome_produto like'ma______';

/* na h se tem como usar alguma outra doisa alem do _ */

select * 
	from produtos p 
		where p.nome_produto like '__aca%';

select * 
	from produtos p 
		where p.nome_produto like '%a\_p%' escape '\';


select *
	from clientes c 
		where c.uf = 'MG'
		or c.uf = 'ES';

select *
	from clientes c 
		where c.uf not in ('RJ', 'SP')
	order by c.uf;


select p.nome_produto as Nome_do_Produto
	 , p.preco_produto as Preco_do_produto
	 , um.descricao_unidade_medida as Medida
	 from produtos p 
	 	inner join unidade_medida um 
	 		on p.codigo_unidade_medida = um.codigo_unidade_medida
		where (um.descricao_unidade_medida = 'KILOGRAMA'
			or um.descricao_unidade_medida = 'LITRO')
			and (P.codigo_produto is null 
				or P.codigo_produto );























