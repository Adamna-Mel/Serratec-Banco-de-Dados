--Aluno Sistema de concessão de desconto em uma faculdade

CREATE TABLE public.aluno
(
id serial NOT NULL,
nome character varying(100) NOT NULL,
cpf character varying(100),
nascimento date NOT NULL,
renda_per_capita double precision NOT NULL,
entrada date NOT NULL,
matricula character varying(100),
PRIMARY KEY (id)
);

INSERT INTO aluno (nome, cpf, nascimento, renda_per_capita, entrada, matricula)
VALUES ('Ariane', '123.456', '2007-01-20', 1.500, '2018-03-01', '20183333' );
INSERT INTO aluno (nome, cpf, nascimento, renda_per_capita, entrada, matricula)
VALUES ('Renato', '222.555', '1996-12-08', 1.100, '2019-03-02', '20195555');
INSERT INTO aluno (nome, cpf, nascimento, renda_per_capita, entrada, matricula)
VALUES ('Julia', '333.897', '2001-02-14', 2.000, '2018-03-01', '20184234');
INSERT INTO aluno (nome, cpf, nascimento, renda_per_capita, entrada, matricula)
VALUES ('Gustavo', '258.697', '1987-05-09', 1.800, '2020-03-02', '20204497');
INSERT INTO aluno (nome, cpf, nascimento, renda_per_capita, entrada, matricula)
VALUES ('Tereza', '154.342', '2003-07-25', 650.00, '2021-03-01', '20218796' );

SELECT * FROM aluno
UPDATE aluno SET renda_per_capita = 1100 WHERE renda_per_capita = 1.1
 
SELECT 
nome,
matricula,
renda_per_capita,
CASE 
     WHEN renda_per_capita <= 800 THEN 0.4
     WHEN renda_per_capita <= 1500 THEN 0.3
	 WHEN renda_per_capita <= 2000 THEN 0.2
   ELSE 0
 END AS bolsa
FROM aluno