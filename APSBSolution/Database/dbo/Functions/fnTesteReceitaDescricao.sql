CREATE FUNCTION fnTesteReceitaDescricao
(@cvValor          FLOAT, 
 @cvValorPago      FLOAT, 
 @cvValorRepassado FLOAT, 
 @dtEmissao        DATETIME, 
 @dtPgto           DATETIME, 
 @dtRepasse        DATETIME,
 @idReceita INT
)
RETURNS VARCHAR(20)
AS
	BEGIN
	    DECLARE @result VARCHAR(20);
	    DECLARE @cbStatus BIT, @cbArquivado BIT;

	    SELECT @cbStatus = cbStatus, @cbArquivado = cbArquivado FROM tbReceitas WHERE idReceita = @idReceita;

	    IF @cbStatus = 0
	    BEGIN
		  SET @result = '5 - Cancelada'
	    END
	    ELSE
	    BEGIN
		   IF @cbArquivado = 1
		   BEGIN
			 SET @result = '4 - Arquivada'
		   END
	    END
	    IF @cbStatus = 1 AND @cbArquivado = 0
	    BEGIN
		  IF @dtEmissao IS NOT NULL AND @dtPgto IS NOT NULL AND @dtRepasse IS NOT NULL
		  BEGIN
			 --Validar valores
			 IF @cvValor >= @cvValorPago and @cvValorPago >= @cvValorRepassado
			 SET @result = '3 - Repassada'
			 ELSE
			 SET @result = '6 - Erro' 
		  END
		  ELSE
		  BEGIN
			  IF @dtEmissao IS NOT NULL AND @dtPgto IS NOT NULL 
				BEGIN
				    --Validar valores
				    IF @cvValor >= @cvValorPago 
				    SET @result = '2 - Paga'
				    ELSE
				    SET @result = '6 - Erro' 
				END
				ELSE
				BEGIN
				    IF @dtEmissao IS NOT NULL
				    
					   SET @result = '1 - Emitida'
					   ELSE
					   SET @result = '0 - Lançada'
				    
				END

		  END
	    END


	    RETURN @result;
	END;