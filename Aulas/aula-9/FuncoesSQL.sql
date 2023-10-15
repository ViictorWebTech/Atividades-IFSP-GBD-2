CREATE TABLE Fornecedores(
	idfor serial,
	nomef varchar(30),
	cidade varchar(40),
	estado varchar(2),
	CONSTRAINT pk_fornecedor PRIMARY KEY(idfor)
);

--inserir alguns valores
INSERT INTO Fornecedores VALUES
 (default, 'Garitá', 'Jales', 'SP'),
 (default, 'Toninhas', 'Catanduva', 'SP'),
 (default, 'Villages', 'Catanduva', 'SP'),
 (default, 'Collonges', 'São Paulo', 'SP'),
 (default, 'Brusk', 'Curitiba', 'PR'),
 (default, 'Intercon', 'Campinas', 'SP'),
 (default, 'Tekcno', 'Cascavel', 'PR');
 
 SELECT * FROM Fornecedores;
 
 
 --Imagine que você queira saber quantos
 --fornecedores são da cidade de Catanduva.
 --Para isso nós temos um função que soma
 --o número de registros. Não é a soma
 --de um determinado valor, mas a soma 
 --de registros. Assim, ao olharmos
 --para nossa tabela, vemos que temos
 --2 ocorrências e é essa a resposta
 --que o BD deve conceder.
 
 SELECT COUNT(cidade) AS "Fornecedores da cidade de Catanduva" 
 FROM Fornecedores WHERE cidade = 'Catanduva';
 
 --vamos criar a tabela produtos
 CREATE TABLE Produtos(
 	idprod serial,
	 nomeprod varchar(30),
	 peso real,
	 valor real,
	 ano_fab date,
	 ano_val date,
	 idfor int,
	 CONSTRAINT PK_produtos PRIMARY KEY(idprod),
	 CONSTRAINT FK_produto_fornecedor FOREIGN KEY(idfor) REFERENCES Fornecedores(idfor)
 );
 
 INSERT INTO Produtos VALUES
 (default, 'Calmante', 20, 45, '2023-03-22', '2024-03-22', 5),
 (default, 'Azitromicina', 100, 58, '2022-09-30', '2025-05-21', 7),
 (default, 'Dipirona', 100, 25, '2023-07-18', '2026-07-18', 1);
 
  SELECT * FROM Produtos;
  
  --FUNÇÃO AVG()É UTILIZADA PARA ENCONTRAR
  --A MÉDIA DE VALORES NUMÉRICOS
  --ENTÃO, VAMOS ENCONTRAR A MÉDIA DOS VALORES
  --DAS MEDICAÇÕES.
  
   SELECT AVG(valor) AS "Valor médio de todas as medicações:" 
 FROM Produtos;
 
 
 --o código ORDER BY serve para ordenar
 --crescente ou decrescente baseado
 --em um campo da tabela
 
 SELECT * FROM Produtos ORDER BY nomeprod ASC;
 
 
 --vamos colocar em ordem decrescente;
 
 SELECT * FROM Produtos ORDER BY nomeprod DESC;
 
 --o que mais eu posso mostrar em ordem
 --crescente?
 
 SELECT * FROM Produtos ORDER BY valor ASC;
 
 --MAX() - essa função é utilizada para encontrar
 --o valor máximo dentro de um campo, que nesse
 --caso deve ser numérico.
 --vamos encontrar o maior valor
 
 SELECT MAX(valor) AS "Valor máximo: " FROM Produtos;
 
  --MIN() - essa função é utilizada para encontrar
 --o valor mínimo dentro de um campo, que nesse
 --caso deve ser numérico.
 --vamos encontrar a menor dose
 --das medicações.
 
  SELECT MIN(peso) AS "Menor peso (mg): " FROM Produtos;
  
  --Há uma função que consegue extraír
  --dia/mês/ano de um capo do tipo date
  --exemplo: 'extract(day from campoDate)' irá
  --extrair o dia da referida data.
  --Então vamos encontrar quais produtos
  --possuem data de validade menor que 2025.
  
  SELECT * FROM Produtos WHERE extract(year from ano_val) < 2025;