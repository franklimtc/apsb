CREATE PROCEDURE SEL_DespesaByName(@ccTipo VARCHAR(MAX))
AS
    BEGIN
	   DECLARE @qtd INT;
	   SELECT @qtd = COUNT(*)
	   FROM   tbDespesaTipo
	   WHERE  ccTipo = @ccTipo;
	   IF(@qtd > 0)
		  BEGIN
			 SELECT idtipo, 
				   ccTipo
			 FROM   tbDespesaTipo
			 WHERE  ccTipo = @ccTipo;
		  END;
		  ELSE
		  BEGIN
			 INSERT INTO tbDespesaTipo
			 (ccTipo, 
			  cdDataCriacao
			 )
			 VALUES
			 (@ccTipo, 
			  GETDATE()
			 );
			 SELECT SCOPE_IDENTITY() idtipo, 
				   @ccTipo ccTipo;
		  END;
    END;