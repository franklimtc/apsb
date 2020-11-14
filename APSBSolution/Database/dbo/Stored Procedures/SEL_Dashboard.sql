
CREATE PROCEDURE SEL_Dashboard
AS
  BEGIN
	DECLARE @fatPendente  INT, 
			@repPendente  INT, 
			@SfatPendente VARCHAR(10), 
			@SrepPendente VARCHAR(10);

	SELECT @fatPendente = CAST(SUM(cvValor) AS INT)
	  FROM vwResumoReceitas
	 WHERE cdEmissao IS NULL;
	SELECT @repPendente = CAST(SUM(cvValor) AS INT)
	  FROM vwResumoReceitas
	 WHERE cdEmissao IS NOT NULL
		   AND cdPagamento IS NOT NULL
		   AND cdRepasse IS NULL;

print @fatPendente
print @repPendente

	IF @fatPendente>1000000
	  BEGIN

		SET @SfatPendente = CONCAT(CAST(@fatPendente/1000000 AS VARCHAR(MAX)), ' M');
	END;

	IF @repPendente>1000000
	  BEGIN

		SET @SrepPendente = CONCAT(CAST(@repPendente/1000000 AS VARCHAR(MAX)), ' M');
	END;

	IF @fatPendente>1000
	   AND @fatPendente<1000000
	  BEGIN

		SET @SfatPendente = CONCAT(CAST(@fatPendente/1000 AS VARCHAR(MAX)), ' K');
	END;

	IF @repPendente>1000
	   AND @repPendente<1000000
	  BEGIN

		SET @SrepPendente = CONCAT(CAST(@repPendente/1000 AS VARCHAR(MAX)), ' K');
	END;

	SELECT @SfatPendente              fatPendente, 
		   ISNULL(@SrepPendente, 0.0) repPendente;
  END;