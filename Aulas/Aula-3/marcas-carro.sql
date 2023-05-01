CREATE TABLE marcas(
 	codigom int,
	nomem varchar(30),
	paisorigem varchar(30),
	CONSTRAINT pk_marcas PRIMARY KEY(codigom)	
);

INSERT INTO marcas VALUES 
	(1014, 'Audi', 'Alemanha'),
	(1012, 'Volkswagen', 'Brasil'),
	(1013, 'Fiat', 'Brasil'),
	(1015, 'Chevrolet', 'Brasil'),
	(1016, 'Chevrolet', 'USA');
	
SELECT * FROM marcas;

---------
CREATE TABLE modelos(
	codigomo int,
	nomemo varchar(30),
	tipomo varchar(5),
	cormo varchar(20),
	codigom int,
	CONSTRAINT pk_modelos PRIMARY KEY(codigomo),
	CONSTRAINT fk_modelos_marcas FOREIGN KEY(codigom) REFERENCES marcas(codigom)
);

DROP TABLE modelos;
	

INSERT INTO modelos VALUES
	(101, 'Gol', 'GT', 'Cinza', 1012),
	(102, 'Pálio', 'XS', 'Preto', 1013),
	(103, 'Zafira', 'GLS', 'Verde', 1015),
	(104, 'Linea', 'GL', 'Cinza', 1013),
	(105, 'A3', 'GT', 'Preto', 1014),
	(106, 'Polo', 'GL', 'Cinza', 1012),
	(107, 'Taurus', 'XLS', 'Preto', 1016);
	

SELECT * FROM modelos;	


-------
SELECT nomem, nomemo 
FROM modelos, marcas
WHERE modelos.nomemo='A3' AND modelos.codigom=marcas.codigom;

--Vamos apagar a marca Audi:
DELETE FROM marcas WHERE nomem='Audi';

--Eu quero saber o país de origem 
--dos modelos que possuem cor 'Cinza'
SELECT marcas.paisorigem, modelos.nomemo, modelos.cormo
FROM marcas inner join modelos
ON modelos.codigom=marcas.codigom
WHERE modelos.cormo='Cinza';