CREATE FUNCTION fnTesteReceita
(@cvValor          FLOAT, 
 @cvValorPago      FLOAT, 
 @cvValorRepassado FLOAT, 
 @dtEmissao        DATETIME, 
 @dtPgto           DATETIME, 
 @dtRepasse        DATETIME,
 @idReceita INT
)
RETURNS INT
AS
	BEGIN
	    DECLARE @result INT = 0;
	    DECLARE @cbStatus BIT, @cbArquivado BIT;

	    SELECT @cbStatus = cbStatus, @cbArquivado = cbArquivado FROM tbReceitas WHERE idReceita = @idReceita;

	    IF @cbStatus = 0
	    BEGIN
		  SET @result = 5
	    END
	    ELSE
	    BEGIN
		   IF @cbArquivado = 1
		   BEGIN
			 SET @result = 4
		   END
	    END
	    IF @cbStatus = 1 AND @cbArquivado = 0
	    BEGIN
		  IF @dtEmissao IS NOT NULL AND @dtPgto IS NOT NULL AND @dtRepasse IS NOT NULL
		  BEGIN
			 --Validar valores
			 IF @cvValor >= @cvValorPago and @cvValorPago >= @cvValorRepassado
			 SET @result = 3
			 ELSE
			 SET @result = 6
		  END
		  ELSE
		  BEGIN
			  IF @dtEmissao IS NOT NULL AND @dtPgto IS NOT NULL 
				BEGIN
				    --Validar valores
				    IF @cvValor >= @cvValorPago 
				    SET @result = 2
				    ELSE
				    SET @result = 6
				END
				ELSE
				BEGIN
				    IF @dtEmissao IS NOT NULL
				    
					   SET @result = 1
					   ELSE
					   SET @result = 0
				    
				END

		  END
	    END


	    RETURN @result;
	END;