--Sistema lanchonete Matinta Vegana

CREATE TABLE public.pao
(
   id serial NOT NULL,
   tipo_pao character varying(100) NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO pao (tipo_pao)
VALUES ('Frânces');
INSERT INTO pao (tipo_pao)
VALUES ('Ciabata');
INSERT INTO pao (tipo_pao)
VALUES ('Sírio');
INSERT INTO pao (tipo_pao)
VALUES ('Multigãos');


CREATE TABLE public.ingrediente_tipo
(
   id serial NOT NULL,
   nome character varying(100) NOT NUL
   PRIMARY KEY (id)
);

INSERT INTO ingrediente_tipo (nome)
VALUES ('Queijo'),
       ('Proteina'),
	   ('Salada')


CREATE TABLE public.ingrediente
(
   id serial NOT NULL,
   nome character varying(100) NOT NULL,
   ingrediente_tipo integer NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO ingrediente(nome, ingrediente_tipo)
VALUES ('Queijo Cheddar Veg', 1),
       ('Queijo Mussarela Veg', 1),
	   ('Queijo Cremoso de Castanha', 1),
	   ('PTS', 2),
	   ('Seitan', 2),
	   ('Mix de folhas', 3),
	   ('Tomate', 3),
	   ('Pepino', 3),
	   ('Picles', 3);
	   

CREATE TABLE public.lanche
(
   id serial NOT NULL,
   pao_id integer,
   tamanho integer,
   quente boolean,
   PRIMARY KEY (id)
);

INSERT INTO lanche (pao_id, tamanho, quente)
VALUES (1, 30, true),
        (2, 15, true),
		(3, 20, false);
	

CREATE TABLE public.lanche_ingrediente
(
   id serial NOT NULL,
   lanche_id integer NOT NULL,
   ingrediente_id integer NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO lanche_ingrediente (lanche_id, ingrediente_id)
VALUES (1,3),
       (2,2),
	   (3,2)

SELECT * FROM ingrediente
SELECT * FROM ingrediente_tipo
SELECT * FROM lanche
SELECT * FROM pao
SELECT * FROM lanche_ingrediente

SELECT
pao.tipo_pao,
lanche.quente,
lanche.tamanho
FROM  lanche
JOIN pao ON pao.id = lanche.pao_id
WHERE lanche.id = 1

SELECT
IT.nome,
ingrediente.nome
FROM ingrediente
JOIN ingrediente_tipo AS IT ON IT.id = ingrediente_tipo
WHERE ingrediente.ingrediente_tipo = 2


