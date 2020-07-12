CREATE PROCEDURE SEL_Dashboard
AS BEGIN
	DECLARE @fatPendente INT,@repPendente INT, @SfatPendente VARCHAR(10), @SrepPendente VARCHAR(10)

	select @fatPendente = CAST(SUM(cvValor) AS INT) from vwResumoReceitas where cdEmissao IS NULL
	select @repPendente = CAST(SUM(cvValor) AS INT) from vwResumoReceitas where cdEmissao IS NOT NULL AND cdPagamento IS NOT NULL AND cdRepasse IS NULL

	IF @fatPendente > 1000000
	BEGIN

		SET @SfatPendente = CONCAT(CAST(@fatPendente / 1000000 AS VARCHAR(MAX)),' M')
	END

	IF @repPendente > 1000000
	BEGIN

		SET @SrepPendente = CONCAT(CAST(@repPendente / 1000000 AS VARCHAR(MAX)),' M')
	END

	IF @fatPendente > 1000 AND @fatPendente < 1000000
	BEGIN

		SET @SfatPendente = CONCAT(CAST(@fatPendente / 1000 AS VARCHAR(MAX)),' K')
	END

	IF @repPendente > 1000000 AND @repPendente < 1000000
	BEGIN

		SET @SrepPendente = CONCAT(CAST(@repPendente / 1000 AS VARCHAR(MAX)),' K')
	END
	 
	SELECT @SfatPendente fatPendente, ISNULL(@SrepPendente, 0.0) repPendente
END