--th
--Descri��o: Fun��o em plpgsql, retorna uma tabela a partir de uma linha detalhe do arquivo de remessa de 240 colunas
--Data: 02/09/2017

CREATE OR REPLACE FUNCTION public.cnab_itau_240_segmentoa(character varying)
  RETURNS table(
"C�DIGO DO BANCO" VARCHAR,
"C�DIGO DO LOTE" VARCHAR,
"TIPO DE REGISTRO" VARCHAR,
"N�MERO DO REGISTRO" VARCHAR,
"SEGMENTO" VARCHAR,
"TIPO DE MOVIMENTO" VARCHAR,
"C�MARA" VARCHAR,
"BANCO FAVORECIDO" VARCHAR,
"AG�NCIA CONTA" VARCHAR,
"NOME DO FAVORECIDO" VARCHAR,
"SEU N�MERO" VARCHAR,
"DATA DE PAGTO" VARCHAR,
"MOEDA  TIPO" VARCHAR,
"C�DIGO ISPB" VARCHAR,
"ZEROS" VARCHAR,
"VALOR DO PAGTO" VARCHAR,
"NOSSO N�MERO" VARCHAR,
"BRANCOS" VARCHAR,
"DATA EFETIVA" VARCHAR,
"VALOR EFETIVO" VARCHAR,
"FINALIDADE DETALHE" VARCHAR,
"BRANCOS2" VARCHAR,
"N DO DOCUMENTO" VARCHAR,
"N DE INSCRI��O" VARCHAR,
"FINALIDADE DOC E STATUS" VARCHAR,
"FUNCION�RIO" VARCHAR,
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
cast( substr( linha    ,1    ,3    ) as varchar ) as    "C�DIGO DO BANCO",
cast( substr( linha    ,4    ,4    ) as varchar ) as    "C�DIGO DO LOTE",
cast( substr( linha    ,8    ,1    ) as varchar ) as    "TIPO DE REGISTRO",
cast( substr( linha    ,9    ,5    ) as varchar ) as    "N�MERO DO REGISTRO",
cast( substr( linha    ,14    ,1    ) as varchar ) as    "SEGMENTO",
cast( substr( linha    ,15    ,3    ) as varchar ) as    "TIPO DE MOVIMENTO",
cast( substr( linha    ,18    ,3    ) as varchar ) as    "C�MARA",
cast( substr( linha    ,21    ,3    ) as varchar ) as    "BANCO FAVORECIDO",
cast( substr( linha    ,24    ,20    ) as varchar ) as    "AG�NCIA CONTA",
cast( substr( linha    ,44    ,30    ) as varchar ) as    "NOME DO FAVORECIDO",
cast( substr( linha    ,74    ,20    ) as varchar ) as    "SEU N�MERO",
cast( substr( linha    ,94    ,8    ) as varchar ) as    "DATA DE PAGTO",
cast( substr( linha    ,102    ,3    ) as varchar ) as    "MOEDA  TIPO",
cast( substr( linha    ,105    ,8    ) as varchar ) as    "C�DIGO ISPB",
cast( substr( linha    ,113    ,7    ) as varchar ) as    "ZEROS",
cast( substr( linha    ,120    ,15    ) as varchar ) as    "VALOR DO PAGTO",
cast( substr( linha    ,135    ,15    ) as varchar ) as    "NOSSO N�MERO",
cast( substr( linha    ,150    ,5    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,155    ,8    ) as varchar ) as    "DATA EFETIVA",
cast( substr( linha    ,163    ,15    ) as varchar ) as    "VALOR EFETIVO",
cast( substr( linha    ,178    ,18    ) as varchar ) as    "FINALIDADE DETALHE",
cast( substr( linha    ,196    ,2    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,198    ,6    ) as varchar ) as    "N DO DOCUMENTO",
cast( substr( linha    ,204    ,14    ) as varchar ) as    "N DE INSCRI��O",
cast( substr( linha    ,218    ,2    ) as varchar ) as    "FINALIDADE DOC E STATUS",
cast( substr( linha    ,220    ,5    ) as varchar ) as    "FUNCION�RIO",
cast( substr( linha    ,225    ,5    ) as varchar ) as    "FINALIDADE TED",
cast( substr( linha    ,230    ,1    ) as varchar ) as    "BRANCOS",
cast( substr( linha    ,231    ,10    ) as varchar ) as    "AVISO"

FROM linhas;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;