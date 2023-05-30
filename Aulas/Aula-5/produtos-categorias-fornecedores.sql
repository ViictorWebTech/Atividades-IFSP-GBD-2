CREATE TABLE Fornecedores(
	codfor int,
	fornecedor varchar(30),
	CONSTRAINT pk_codfor PRIMARY KEY(codfor)
);

INSERT INTO Fornecedores VALUES
	(200, 'Bomdipreço'),
	(201, 'Temditudo'),
	(203, 'Sodubom'),
	(204, 'Fhrescou'),
	(205, 'Darozza');
	
SELECT * FROM Fornecedores;	

----------
CREATE TABLE Categorias(
	codcat int,
	descricacao varchar(30),
	codfor int,
	CONSTRAINT pk_codcat PRIMARY KEY(codcat),
	CONSTRAINT fk_categorias_fornecedores FOREIGN KEY(codfor) REFERENCES Fornecedores(codfor)
);

INSERT INTO Categorias VALUES
	(101, 'Cereal', 204),
	(102, 'Refrigerante', 200),
	(103, 'Doces', 203),
	(104, 'Cosmético', 201),
	(105, 'Higiene', 201),
	(106, 'Frutas', 205);
	
SELECT * FROM Categorias;	

---------
CREATE TABLE Produtos(
	codprod int,
	nomeprod varchar(50),
	preco real,
	codcat int,
	CONSTRAINT pk_codprod PRIMARY KEY(codprod),
	CONSTRAINT fk_produtos_categorias FOREIGN KEY(codcat) REFERENCES Categorias(codcat)
);

INSERT INTO Produtos VALUES
	(1, 'Feijão Tia Maria', 14.00, 101),
	(2, 'Arroz Solthim', 9.00, 101),
	(3, 'Coca-Cola', 7.00, 102),
	(4, 'Sampo Jubba', 19.55, 104),
	(5, 'Bolacha Dabboa', 8.70, 103),
	(6, 'Bombom Dobhom', 15, 103),
	(7, 'Sabonete Xerobom', 3.99, 104),
	(8, 'Desinfetante', 5.00, 105),
	(9, 'Banana', 3.00, 106),
	(10, 'Coco da Bahia', 6.50, 106);
	
SELECT * FROM Produtos ORDER BY codprod;

---------
--4)
SELECT produtos.nomeprod, produtos.preco 
FROM produtos
ORDER BY produtos.nomeprod;

-------------

--quem é o fornecedor do feijão Tia Maria
SELECT f.fornecedor, p.nomeprod
FROM Fornecedores f INNER JOIN Categorias c
ON f.codfor = c.codfor INNER JOIN Produtos p
ON p.codcat = c.codcat
WHERE p.nomeprod = 'Feijão Tia Maria';

-------------

--SELECT "aquilo que você quer saber"

--5)
--a)
SELECT p.nomeprod, p.preco, f.fornecedor
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat INNER JOIN Fornecedores f
ON f.codfor = c.codfor
WHERE p.nomeprod = 'Arroz Solthim';

--b)
SELECT p.preco, p.nomeprod, c.descricacao
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat
WHERE p.nomeprod = 'Feijão Tia Maria';

--c)
SELECT p.nomeprod, p.preco
FROM Produtos p
WHERE p.preco > 3.0;

--d)
SELECT p.nomeprod, c.descricacao, p.preco
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat
WHERE p.preco < 5;

--e)
SELECT c.descricacao, p.nomeprod, p.preco
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat
WHERE p.nomeprod = 'Bombom Dobhom';

--g)
SELECT c.descricacao, p.nomeprod
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat
WHERE p.nomeprod = 'Coca-Cola';

--h)
SELECT c.descricacao
FROM Categorias c;

--i)
SELECT f.codfor, f.fornecedor, p.nomeprod
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat INNER JOIN Fornecedores f
ON f.codfor = c.codfor
WHERE p.nomeprod = 'Coco da Bahia';

--j)
SELECT sum(preco) AS "Custo Total"
FROM Produtos;

--k)
SELECT f.fornecedor, p.nomeprod
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat INNER JOIN Fornecedores f
ON f.codfor = c.codfor
WHERE p.nomeprod = 'Batata';

--l)
SELECT f.fornecedor, p.nomeprod
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat INNER JOIN Fornecedores f
ON f.codfor = c.codfor
WHERE p.nomeprod = 'Sabonete';

--m)
SELECT p.preco, p.nomeprod, f.fornecedor
FROM Produtos p INNER JOIN Categorias c
ON p.codcat = c.codcat INNER JOIN Fornecedores f
ON f.codfor = c.codfor
WHERE f.fornecedor = 'Fhrescou';


