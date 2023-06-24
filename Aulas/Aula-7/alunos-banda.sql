 CREATE TABLE Alunos
 	(Nome varchar(30),
	 Matricula int,
	 Rua varchar(50),
	 Bairro varchar(30),
	 Cidade varchar(30),
	 CEP varchar(15),
	 Fone varchar(15),
	 CONSTRAINT pk_matricula PRIMARY KEY(matricula)	
	);
	
	DROP TABLE Alunos;
	
	INSERT INTO Alunos VALUES
	('Nelson', 001, 'Rua das Palmeiras', 'Centro', 'Floreal', 15320000, 17996374817),
	('Richarlison', 002, 'Rua Catarina', 'Juca Miguel', 'Brasilândia', 15927999, 27995639467),
	('Victor', 003, 'Rua Michels', 'Centro', 'Álvares Florence', 15540000, 17997741846),
	('Rayssa', 004, 'Rua do Buraqueiro', 'Monte Verde', 'São Mateus', 69872453, 19971357597),
	('Luis', 005, 'Rua das Flores', 'Jardim das Rosas', 'Primavera', 24681357, 25961528764),
	('Laura', 006, 'Avenida dos Sonhos', 'Vila Esperança', 'Monte Azul', 76543210, 57931528764),
	('Fernanda', 007, 'Alameda dos Anjos', 'Novo Horizonte', 'Floreal', 15320000, 17998749328),
	('Ugo', 008, 'Avenida Bandeirantes', 'Jardim das Rosas', 'Álvares Florence', 15540000, 17997365285),
	('Ricardo', 009, 'Rua das Cerejeiras', 'Sol Nascente', 'Nova Esperança', 46269767, 75996594875),
	('Marcos', 010, 'Rua Amazonas', 'Centro', 'Fernandópolis', 15600000, 17997374854);
	
	SELECT * FROM Alunos;
	
-----------------
	CREATE TABLE Instrumento 
		(Instrumentos varchar(20),
		 CONSTRAINT PK_Instrumento PRIMARY KEY(Instrumentos)
		 );
		 
		 INSERT INTO Instrumento VALUES
		 ('Violão'),
		 ('Violino'),
		 ('Bateria'),
		 ('Guitarra'),
		 ('Piano');
		 
		 SELECT * FROM Instrumento;
		 
		 -------------------
		 
		 CREATE TABLE Alunos_Banda
		 	(Matricula int, 
			Instrumento varchar(20),
			DataIngresso date,
			 chave int,
			CONSTRAINT PK_chave PRIMARY KEY(chave),
			 CONSTRAINT FK_matricula FOREIGN KEY(matricula) REFERENCES Alunos(matricula),
			 CONSTRAINT FK_instrumento FOREIGN KEY(instrumento) REFERENCES Instrumento(instrumentos)
		);
		
		INSERT INTO Alunos_Banda VALUES
		(001, 'Violino', '2000-04-05', 17),
		(002, 'Bateria', '1999-06-25', 8),
		(003, 'Guitarra', '2002-04-28', 7),
		(005, 'Piano', '2002-05-19', 6),
		(008, 'Violão', '2002-04-28', 18),
		(007, null, '2001-08-27', 9),
		(004, null, '2003-09-15', 11),
		(006, null, '2003-09-10', 16),
		(009, null, '2005-10-17', 98);
		
		
		SELECT * FROM Alunos_Banda;
		
		
		
		--a) Qual a matricula do aluno que toca violino?
		SELECT ab.matricula, i.instrumentos
		FROM Alunos_banda ab INNER JOIN Instrumento i
		ON ab.instrumento = i.instrumentos
		WHERE i.instrumentos = 'Violino';
		
		--b) Qual a data de inscrição e o nome do aluno que toca piano?
		SELECT ab.dataingresso, a.nome, i.instrumentos
		FROM Alunos_banda ab INNER JOIN Instrumento i
		ON ab.instrumento = i.instrumentos
		INNER JOIN alunos a
		ON ab.matricula = a.matricula
		WHERE i.instrumentos = 'Piano';
		
		--c) Qual o nome, a cidade e o instrumento e data de ingresso na banda
		--do aluno de matrícula 003?
			SELECT a.matricula, a.nome, a.cidade, i.instrumentos, ab.dataingresso
		FROM Alunos_banda ab INNER JOIN Instrumento i
		ON ab.instrumento = i.instrumentos
		INNER JOIN alunos a
		ON ab.matricula = a.matricula
		WHERE a.matricula = 003;
		
		--d) Quais os nome dos alunos que moram em Floreal?
		SELECT a.nome, a.cidade
		FROM Alunos a
		WHERE a.cidade = 'Floreal';
		
		