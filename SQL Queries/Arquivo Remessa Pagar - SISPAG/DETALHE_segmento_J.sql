--th
--Descrição: Função em plpgsql; retorna uma tabela a partir de uma linha detalhe do segmento J do arquivo de remessa de 240 colunas. Segundo o manual SISPAG versã 87
--Data: 02/09/2017
CREATE OR REPLACE FUNCTION public.cnab_itau_240_segmentoj(character varying)
  RETURNS table(

"CÓDIGO DO BANCO" varchar,
"CÓDIGO DO LOTE" varchar,
"TIPO DE REGISTRO" varchar,
"NÚMERO DO REGISTRO" varchar,
"SEGMENTO" varchar,
"TIPO DE MOVIMENTO" varchar,
"BANCO FAVORECIDO" varchar,
"MOEDA" varchar,
"DV" varchar,
"VENCIMENTO" varchar,
"VALOR" varchar,
"CAMPO LIVRE" varchar,
"NOME DO FAVORECIDO" varchar,
"DATA VENCTO" varchar,
"VALOR DO TÍTULO" varchar,
"DESCONTOS" varchar,
"ACRÉSCIMOS" varchar,
"DATA PAGAMENTO" varchar,
"VALOR PAGAMENTO" varchar,
"ZEROS" varchar,
"SEU NÚMERO" varchar,
"BRANCOS" varchar,
"NOSSO NÚMERO" varchar,
"OCORRÊNCIAS"varchar

  ) AS
$BODY$

BEGIN
RETURN query
WITH linhas as
(select $1 as linha)

SELECT

cast( substr( linha, 001, 3 ) as varchar ) as "CÓDIGO DO BANCO" ,
cast( substr( linha, 004, 4 ) as varchar ) as "CÓDIGO DO LOTE" ,
cast( substr( linha, 008, 1 ) as varchar ) as "TIPO DE REGISTRO" ,
cast( substr( linha, 009, 5 ) as varchar ) as "NÚMERO DO REGISTRO" ,
cast( substr( linha, 014, 1 ) as varchar ) as "SEGMENTO" ,
cast( substr( linha, 015, 3 ) as varchar ) as "TIPO DE MOVIMENTO" ,
cast( substr( linha, 018, 3 ) as varchar ) as "BANCO FAVORECIDO" ,
cast( substr( linha, 021, 1 ) as varchar ) as "MOEDA" ,
cast( substr( linha, 022, 1 ) as varchar ) as "DV" ,
cast( substr( linha, 023, 4 ) as varchar ) as "VENCIMENTO" ,
cast( substr( linha, 027, 10 ) as varchar ) as "VALOR" ,
cast( substr( linha, 037, 25 ) as varchar ) as "CAMPO LIVRE" ,
cast( substr( linha, 062, 30 ) as varchar ) as "NOME DO FAVORECIDO" ,
cast( substr( linha, 092, 8 ) as varchar ) as "DATA VENCTO" ,
cast( substr( linha, 100, 15 ) as varchar ) as "VALOR DO TÍTULO" ,
cast( substr( linha, 115, 15 ) as varchar ) as "DESCONTOS" ,
cast( substr( linha, 130, 15 ) as varchar ) as "ACRÉSCIMOS" ,
cast( substr( linha, 145, 8 ) as varchar ) as "DATA PAGAMENTO" ,
cast( substr( linha, 153, 15 ) as varchar ) as "VALOR PAGAMENTO" ,
cast( substr( linha, 168, 15 ) as varchar ) as "ZEROS" ,
cast( substr( linha, 183, 20 ) as varchar ) as "SEU NÚMERO" ,
cast( substr( linha, 203, 13 ) as varchar ) as "BRANCOS" ,
cast( substr( linha, 216, 15 ) as varchar ) as "NOSSO NÚMERO" ,
cast( substr( linha, 231, 10 ) as varchar ) as "OCORRÊNCIAS"

FROM linhas;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;