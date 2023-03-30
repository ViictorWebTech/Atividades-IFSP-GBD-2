CREATE TABLE cliente(
	codcli int,
	nome varchar(30),
	endereco varchar(40),
	cidade varchar(30),
	estado char(2)
	-- varchar => o que for varchar pode ocupar
	--quanto estiver difinido, o que não usar
	--de processamento será devolvido para
	--o servidor utilizar em outras funções
	
	--char => o que não utilizar a memória e
	--processamento ainda será destinado
	--para uso exclusivo dessa categoria 
);


--PARA CONFIRMAR SE A TABELA FOI CRIADA
--PODEMOS UTILIZAR O COMANDO
--BUSCA/PESQUISA - SELECT
SELECT * FROM cliente;

--vamos inserir uma linha
INSERT INTO cliente VALUES(1,'Ana',
						   'Rua Sergipe, 3344',
						  'Votuporanga','SP');
						  
INSERT INTO cliente VALUES(1,'Pedra','Av. Brasil, 312',
						  'Cosmorama','SP');						  