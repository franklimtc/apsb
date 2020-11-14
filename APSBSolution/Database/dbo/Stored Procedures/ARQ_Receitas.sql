

CREATE PROCEDURE ARQ_Receitas
(
   @dtFim DATETIME
)
AS
  BEGIN
	DECLARE @cbArquivado BIT = 0, 
			@cbStatus    BIT = 1;
	SELECT *
	  FROM tbReceitas r
	 WHERE r.cbStatus=@cbStatus
		   AND r.cbArquivado=@cbArquivado
		   AND r.cdDataCriacao<@dtFim;
  END;