--Tabela de imóveis com relacionamento
--Seleção 

CREATE TABLE public.imovel
(
   codigo serial PRIMARY KEY,
   descricao text,
   valor double precision,
   quartos smallserial,
   suites smallserial,
   vagas smallserial,    
   banheiros smallserial,
   churrasqueira boolean,
   lareira boolean,
   area_interna integer,
   area_externa integer,
   categoria_id integer
);

ALTER TABLE public.imovel OWNER to postgres;

INSERT INTO imovel (descricao, valor, quartos, suites, vagas, banheiros, churrasqueira, lareira, area_interna, area_externa, categoria_id)
VALUES ('Casa com bela vista', 200000, 3, 1, 2, 2, true, false, 120, 300, 1);

INSERT INTO imovel (descricao, valor, quartos, suites, vagas, banheiros, churrasqueira, lareira, area_interna, area_externa, categoria_id)
VALUES ('Apartamento no centro', 280000, 2, 0, 2, 2, false, true, 70, 70, 2);

INSERT INTO imovel (descricao, valor, quartos, suites, vagas, banheiros, churrasqueira, lareira, area_interna, area_externa, categoria_id)
VALUES ('Sitio no interior', 500000, 3, 1, 2, 2, true, true, 250, 5000, 3);

INSERT INTO imovel (descricao, valor, quartos, suites, vagas, banheiros, churrasqueira, lareira, area_interna, area_externa, categoria_id)
VALUES ('Casa no Alto', 500000, 4, 1, 2, 2, true, true, 350, 2000, 1);

INSERT INTO imovel (descricao, valor, quartos, suites, vagas, banheiros, churrasqueira, lareira, area_interna, area_externa, categoria_id)
VALUES ('Chalé na Barra', 450000, 4, 1, 2, 2, false, true, 150, 1000, 1);


CREATE TABLE public.imovel_categoria
(
    codigo serial PRIMARY KEY,
    descricao character varying(20)
);

ALTER TABLE public.imovel_categoria OWNER to postgres;

INSERT INTO imovel_categoria (descricao) VALUES ('Casa');
INSERT INTO imovel_categoria (descricao) VALUES ('Apartamento');
INSERT INTO imovel_categoria (descricao) VALUES ('Sítio');
INSERT INTO imovel_categoria (descricao) VALUES ('Loja');

SELECT * FROM imovel
SELECT * FROM imovel_categoria

SELECT
imovel.codigo,
imovel.descricao,
imovel.valor,
imovel_categoria.descricao AS nome_categoria
FROM imovel
JOIN imovel_categoria ON imovel.categoria_id = imovel_categoria.codigo
ORDER BY imovel.codigo