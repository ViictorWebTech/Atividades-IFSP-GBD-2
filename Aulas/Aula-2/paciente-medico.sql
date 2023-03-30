--Vamos criar uma nova tabela
--dessa vez utilizando constraint's
--A chave-primária trata de um conceito
--em que define que um ou mais determinado
--cmpo se torne um identificado único
--para algum tipo de entidade(cliente,
--funcionario, etc.)
--Além disso, a chave-primária possibilita
--criar consistência entre os realcionamentos
--entre tabelas.

CREATE TABLE funcionario(
	codf int,
	nome varchar(30),
	cidade varchar(40),
	salario real,
	horas int,
	CONSTRAINT pk_funcionario 
		PRIMARY KEY(codf)
);

SELECT * FROM funcionario;

--Vamos inserir um registro
INSERT INTO funcionario VALUES(1,'Bruno','Votuporanga',2000,40);

INSERT INTO funcionario VALUES(2,'Gabriela','Jales',2300,20);


CREATE TABLE paciente(
	codPaciente int,
	Nome varchar(40),
	Cidade varchar(40),
	Estado varchar(2),
	Tratamento varchar(30),
	CONSTRAINT pk_paciente PRIMARY KEY(codPaciente)
);

SELECT * FROM paciente ORDER BY codPaciente;

INSERT INTO paciente VALUES(111,'Cláudio Henrique','São Paulo','SP','Cardiovascular');
INSERT INTO paciente VALUES(112,'Maria Helena','Votuporanga','SP','Oftalmologia');
INSERT INTO paciente VALUES(113,'Jorge Silva','Cardodo','SP','Otorrino');
INSERT INTO paciente VALUES(114,'Clara Magalhães','Parisi','SP','Oftalmologia');
INSERT INTO paciente VALUES(115,'Votuporanga','Votuporanga','SP','Osteopatia');


CREATE TABLE medico(
	codMedico varchar(10),
	Nome varchar(40),
	Especialidade varchar(60),
	Hospital varchar(40),
	Experiencia int,
	CONSTRAINT pk_medico PRIMARY KEY(codMedico)
);

SELECT * FROM medico;

INSERT INTO medico VALUES('Med1','Júlio Batimento','Cardiovascular','Boa Saúde',10),
('Med2','Maria Velonge','Oftalmologia','Bom Retiro',15),
('Med3','Gabriel Curioso','Otorrino','Bom Retiro',21),
('Med4','Ana Veperto','Oftalmologia','Boa Saúde',5),
('Med5','Fábio Quebraoço','Osteopatia','Boa Saúde',17),
('Med6','Augusto Nunes','Pediatria','Santa Maria',22);