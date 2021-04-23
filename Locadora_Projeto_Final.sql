/* Sistema para vídeo locadora de filmes.
  O projeto consiste em entregar 3 comandos em diferentes pontos de vista, por exemplo:
  
    Quais filmes cada cliente já alugou
    Quais filmes cada ator já participou
    Quais os filmes de uma determinada categoria
*/


CREATE TABLE public.filme
(
id serial NOT NULL,
filme character varying(100) NOT NULL,
categoria character varying(100) NOT NULL,
atriz_id integer NOT NULL,
direcao character varying(100) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('A Espuma dos Dias', 'Drama', 1, 'Michel Gondry');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('O Fabuloso Destino de Amelie Poulain', 'Romance', 1, 'Jean-Pierre Jeunet');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Convenção das Bruxas', 'Fantasia', 2, 'Nicolas Roeg' );
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Os Excêntricos Tenenbaums', 'Comédia-Drama', 2, 'Wes Anderson');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('A Vida Marinha com Steve Zissou', 'Comédia-Drama', 2, 'Wes Anderson');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Os Sonhadores', 'Drama', 3, 'Bernado Bertolucci');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('A Cidade dos Sonhos', 'Suspense', 4, 'David Lynch' );
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Carol', 'Romance', 5, 'Todd Haynes');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Babel', 'Drama', 5, 'Alejandro González Iñárritu');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('As Virgens Suicidas', 'Comédia dramático-romântica', 6, 'Sofia Coppola');
INSERT INTO filme (filme, categoria, atriz_id, direcao)
VALUES ('Brilho Eterno de Uma Mente Sem Lembranças', 'Comédia dramático-romântica', 7, 'Michel Gondry');


CREATE TABLE public.atriz
(
id serial NOT NULL,
nome character varying(50) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO atriz (nome)
VALUES ('Audrey Tautou');
INSERT INTO atriz (nome)
VALUES ('Angelica Huston');
INSERT INTO atriz (nome)
VALUES ('Eva Green');
INSERT INTO atriz (nome)
VALUES ('Naomi Watts');
INSERT INTO atriz (nome)
VALUES ('Cate Blanchett');
INSERT INTO atriz (nome)
VALUES ('Kirsten Dunst');
INSERT INTO atriz (nome)
VALUES ('Kate Winslet');


CREATE TABLE public.cliente
(
id serial NOT NULL,
nome_cliente character varying(80) NOT NULL,
id_cliente integer,
cpf character varying(15) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Amanda', 1, '123.456.789');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Maria Julia', 2, '369.258.147');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Tomás', 3, '753.195.761');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Jorge', 4, '883.254.792');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Luiza', 5, '953.461.223');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('João', 6, '222.999.456');
INSERT INTO cliente (nome_cliente, id_cliente, cpf)
VALUES ('Clara', 7, '617.284.111');


 CREATE TABLE public.locacao
(
id serial NOT NULL,
cliente_id integer NOT NULL,
filme_id integer NOT NULL,
locado_em date, 
    PRIMARY KEY (id)
);

INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (1, 1, '2020-05-18');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (2, 3, '2021-02-04');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (3, 11, '2020-09-27');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (4, 9, '2020-03-16');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (5, 8, '2021-02-25');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (6, 6, '2019-10-07');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (7, 2, '2019-08-30'); 
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (1, 4, '2020-12-16');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (1, 11, '2021-03-08');
INSERT INTO locacao (cliente_id, filme_id, locado_em)
VALUES (3, 7, '2019-11-23');
		
SELECT * FROM filme
SELECT * FROM atriz
SELECT * FROM cliente
SELECT * FROM locacao

SELECT
filme.filme,
filme.categoria,
atriz.atriz,
filme.direcao
FROM filme
JOIN atriz ON atriz.id = filme.atriz_id
WHERE filme.categoria ILIKE '%comédia%'

SELECT
filme.filme,
filme.categoria,
atriz.atriz,
filme.direcao
FROM filme
JOIN atriz ON atriz.id = filme.atriz_id
WHERE filme.atriz_id = 1

SELECT
filme.filme,
filme.categoria,
filme.direcao,
locacao.locado_em,
cliente.nome_cliente
FROM locacao
JOIN filme ON filme.id = locacao.filme_id
JOIN cliente ON cliente.id = locacao.cliente_id
WHERE locacao.cliente_id = 1
ORDER BY locacao.locado_em DESC