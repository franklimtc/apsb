CREATE PROCEDURE SEL_Despesas  
(  
 @cbArquivado BIT = 0,  
 @cbStatus BIT = 1,  
 @dtInicial DATETIME = NULL,  
 @dtFinal DATETIME = NULL, 
 @idDespesa INT = NULL
)  
AS BEGIN  
	SET NOCOUNT ON  
	IF @idDespesa IS NULL
	BEGIN
		SELECT d.idDespesas  
		, d.cvValor  
		, d.cdData  
		, t.ccTipo  
		, o.observacao   
		FROM tbDespesas d  
		INNER JOIN tbDespesaTipo t ON d.idTipo = t.idTipo  
		LEFT JOIN tbObservacoes o ON d.IdObservacao = o.IdObservacao  
		WHERE d.cbStatus = @cbStatus AND d.cbArquivado = @cbArquivado  
		AND d.cdData BETWEEN ISNULL(@dtInicial, DATEADD(YEAR,-10, GETDATE())) AND ISNULL(@dtFinal, DATEADD(YEAR, 10, GETDATE()))  
	END
	ELSE
	BEGIN
		SELECT d.idDespesas  
		, d.cvValor  
		, d.cdData  
		, t.ccTipo  
		, o.observacao   
		FROM tbDespesas d  
		INNER JOIN tbDespesaTipo t ON d.idTipo = t.idTipo  
		LEFT JOIN tbObservacoes o ON d.IdObservacao = o.IdObservacao  
		WHERE d.idDespesas =  @idDespesa 
	END
END;