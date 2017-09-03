--th
--Descrição: Função em plpgsql, retorna uma tabela a partir de uma linha detalhe do arquivo de remessa de 240 colunas
--Data: 02/09/2017

CREATE OR REPLACE FUNCTION public.cnab_itau_240_segmentoa(character varying)
  RETURNS table(
"CÓDIGO DO BANCO" VARCHAR,
"CÓDIGO DO LOTE" VARCHAR,
"TIPO DE REGISTRO" VARCHAR,
"NÚMERO DO REGISTRO" VARCHAR,
"SEGMENTO" VARCHAR,
"TIPO DE MOVIMENTO" VARCHAR,
"CÂMARA" VARCHAR,
"BANCO FAVORECIDO" VARCHAR,
"AGÊNCIA CONTA" VARCHAR,
"NOME DO FAVORECIDO" VARCHAR,
"SEU NÚMERO" VARCHAR,
"DATA DE PAGTO" VARCHAR,
"MOEDA  TIPO" VARCHAR,
"CÓDIGO ISPB" VARCHAR,
"ZEROS" VARCHAR,
"VALOR DO PAGTO" VARCHAR,
"NOSSO NÚMERO" VARCHAR,
"BRANCOS" VARCHAR,
"DATA EFETIVA" VARCHAR,
"VALOR EFETIVO" VARCHAR,
"FINALIDADE DETALHE" VARCHAR,
"BRANCOS2" VARCHAR,
"N DO DOCUMENTO" VARCHAR,
"N DE INSCRIÇÃO" VARCHAR,
"FINALIDADE DOC E STATUS" VARCHAR,
"FUNCIONÁRIO" VARCHAR,
"FINALIDADE TED" VARCHAR,
"BRANCOS3" VARCHAR,
"AVISO" VARCHAR

  ) AS
$BODY$

BEGIN
RETURN query
WITH linhas as
(select $1 as linha)

SELECT
cast( substr( linha    ,1    ,3    ) as varchar ) as    "CÓDIGO DO BANCO",
cast( substr( linha    ,4    ,4    ) as varchar ) as    "CÓDIGO DO LOTE",
cast( substr( linha    ,8    ,1    ) as varchar ) as    "TIPO DE REGISTRO",
cast( substr( linha    ,9    ,5    ) as varchar ) as    "NÚMERO DO REGISTRO",
cast( substr( linha    ,14    ,1    ) as varchar ) as    "SEGMENTO",
cast( substr( linha    ,15    ,3    ) as varchar ) as    "TIPO DE MOVIMENTO",
cast( substr( linha    ,18    ,3    ) as varchar ) as    "CÂMARA",
cast( substr( linha    ,21    ,3    ) as varchar ) as    "BANCO FAVORECIDO",
cast( substr( linha    ,24    ,20    ) as varchar ) as    "AGÊNCIA CONTA",
cast( substr( linha    ,44    ,30    ) as varchar ) as    "NOME DO FAVORECIDO",
cast( substr( linha    ,74    ,20    ) as varchar ) as    "SEU NÚMERO",
cast( substr( linha    ,94    ,8    ) as varchar ) as    "DATA DE PAGTO",
cast( substr( linha    ,102    ,3    ) as varchar ) as    "MOEDA  TIPO",
cast( substr( linha    ,105    ,8    ) as varchar ) as    "CÓDIGO ISPB",
cast( substr( linha    ,113    ,7    ) as varchar ) as    "ZEROS",
cast( substr( linha    ,120    ,15    ) as varchar ) as    "VALOR DO PAGTO",
cast( substr( linha    ,135    ,15    ) as varchar ) as    "NOSSO NÚMERO",
cast( substr( linha    ,150    ,5    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,155    ,8    ) as varchar ) as    "DATA EFETIVA",
cast( substr( linha    ,163    ,15    ) as varchar ) as    "VALOR EFETIVO",
cast( substr( linha    ,178    ,18    ) as varchar ) as    "FINALIDADE DETALHE",
cast( substr( linha    ,196    ,2    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,198    ,6    ) as varchar ) as    "N DO DOCUMENTO",
cast( substr( linha    ,204    ,14    ) as varchar ) as    "N DE INSCRIÇÃO",
cast( substr( linha    ,218    ,2    ) as varchar ) as    "FINALIDADE DOC E STATUS",
cast( substr( linha    ,220    ,5    ) as varchar ) as    "FUNCIONÁRIO",
cast( substr( linha    ,225    ,5    ) as varchar ) as    "FINALIDADE TED",
cast( substr( linha    ,230    ,1    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,231    ,10    ) as varchar ) as    "AVISO"

FROM linhas;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;