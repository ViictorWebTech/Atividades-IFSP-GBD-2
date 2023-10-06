CREATE TABLE Disciplina(
	codDisc int,
	nomeDisc varchar(30),
	CONSTRAINT pk_codDisc PRIMARY KEY(codDisc)
);

INSERT INTO Disciplina VALUES
	(1, 'Desenvolvimento de Web Sites'),
	(2, 'História');
	
	
SELECT * FROM Disciplina;	

--------------------
CREATE TABLE Turma(
	codTurma int,
	descriTurma varchar(300),
	CONSTRAINT pk_codTurma PRIMARY KEY(codTurma)
);

INSERT INTO Turma VALUES
	(1, 'Turma do Curso Técnico de Informática Integrado ao Ensino Médio'),
	(2, 'Turma do Curso Técnico de Mecatrônica Integrado ao Ensino Médio');
	
SELECT * FROM Turma;

-------------------------
CREATE TABLE Cidade(
	codCidade int,
	nomeCidade varchar(50),
	CONSTRAINT pk_codCidade PRIMARY KEY(codCidade)
);

INSERT INTO Cidade VALUES
	(1, 'Álvares Florence'),
	(2, 'Votuporanga');
	
	SELECT * FROM Cidade;
	
--------------------------
CREATE TABLE Aluno(
	codAluno int,
	nomeAlu varchar(50),
	codCidade int,
	CONSTRAINT pk_codAluno PRIMARY KEY(codAluno),
	CONSTRAINT fk_cidade_aluno FOREIGN KEY(codCidade) REFERENCES Cidade(codCidade)
);

INSERT INTO Aluno VALUES
	(25, 'Victor', 1),
	(18, 'Ricardo', 2);

SELECT * FROM Aluno;

--------------------
CREATE TABLE Matricula(
	codTurma int,
	codAluno int,
	codDisc int,
	CONSTRAINT pk_codAlunoTurmaMatricula PRIMARY KEY(codTurma, codAluno),
	CONSTRAINT fk_turma_matricula FOREIGN KEY(codTurma) REFERENCES Turma(codTurma),
	CONSTRAINT fk_aluno_matricula FOREIGN KEY(codAluno) REFERENCES Aluno(codAluno),
	CONSTRAINT fk_disciplina_matricula FOREIGN KEY(codDisc) REFERENCES Disciplina(codDisc)
);


INSERT INTO Matricula VALUES
	(1, 25, 1),
	(2, 18, 2);

SELECT * FROM Matricula;



