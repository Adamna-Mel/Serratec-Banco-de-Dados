--Modelagem do sistema de farmácia

CREATE TABLE public.fabricante
(
id serial NOT NULL,
   nome character varying(100) NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO fabricante (nome)
VALUES
  ('Pfizer'),
  ('Medley'),
  ('Zantac'),
  ('Vitamedic'),
  ('Johnson e Johnson');


CREATE TABLE public.produto
(
id serial NOT NULL,
    nome character varying(100) NOT NULL,
    fabricante_id integer,
    unidade_medida character varying(5),    
    quantidade smallint,
    valor double precision,
    generico boolean,
    restricao_18_anos boolean,
    restricao_receita boolean,
    PRIMARY KEY (id)
);

INSERT INTO produto (nome, fabricante_id, unidade_medida, quantidade, valor, generico, restricao_18_anos, restricao_receita)
VALUES
  ('Para dor no corpo', 1, 'MG', 150, 15.00, false, true, false),
  ('Para dor de cabeça', 2, 'MG', 100, 11.00, false, true, false),
  ('Para dor de cabeça', 2, 'MG', 100, 9.00, true, true, false),
  ('Shampoo Infantil', 5, 'ML', 200, 18.00, false, false, false),
  ('Shampoo Infantil', 5, 'ML', 350, 22.00, false, false, false),
  ('Condicionador Infantil', 5, 'ML', 200, 23.00, false, false, false),
  ('Condicionador Infantil', 5, 'ML', 350, 27.00, false, false, false);


CREATE TABLE public.farmaceutico
(
id serial NOT NULL,
   nome character varying(80) NOT NULL,
   cpf character varying(11) NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO farmaceutico (nome, cpf)
VALUES
  ('Dr José', '07765730045'),
  ('Dr Manoel', '41563697068'),
  ('Dra Flavia', '91590551036'),
  ('Dra Claudia', '73547960002');


CREATE TABLE public.cliente
(
id serial NOT NULL,
   nome character varying(80) NOT NULL,
   cpf character varying(11) NOT NULL,
   data_nascimento date,
   PRIMARY KEY (id)
);

INSERT INTO cliente (nome, cpf, data_nascimento)
VALUES
  ('Arthur', '07682367032', '2009-01-14'),
  ('Liliane', '71059134012', '1988-06-15'),
  ('Jorge', '16101378098', '1987-11-29'),
  ('Carlos', '22984713044', '1979-06-14'),
  ('Tiago', '41450506062', '1990-09-10');


CREATE TABLE public.venda
(
id serial NOT NULL,
   cliente_id integer NOT NULL,
   farmaceutico_id integer NOT NULL,
   produto_id integer NOT NULL,
   quando timestamp, 
    PRIMARY KEY (id)
);

INSERT INTO venda (farmaceutico_id, cliente_id, produto_id, quando)
VALUES
  (1, 1, 2, '2020-02-01 10:00:23'),
  (3, 2, 4, '2020-02-01 10:20:45'),
  (4, 1, 2, '2020-03-01 12:45:45'),
  (1, 2, 3, '2021-02-01 13:44:45');
  
 
SELECT * FROM fabricante
SELECT * FROM produto
SELECT * FROM farmaceutico
SELECT * FROM cliente
SELECT * FROM venda
  
SELECT 
  F.nome AS farmaceutico,  
  C.nome AS cliente_nome,
  P.nome AS produto_nome,
  P.unidade_medida,
  P.quantidade,  
  V.quando
FROM venda AS V
JOIN farmaceutico F ON F.id = V.farmaceutico_id
JOIN cliente C ON C.id = V.cliente_id
JOIN produto P ON P.id = V.produto_id