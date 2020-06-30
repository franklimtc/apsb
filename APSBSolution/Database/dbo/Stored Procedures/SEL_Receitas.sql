CREATE PROCEDURE SEL_Receitas   
(    
	@cbArquivado BIT = 0,    
	@cbStatus BIT = 1,    
	@dtInicial DATETIME = NULL,    
	@dtFinal DATETIME = NULL,   
	@idReceita INT = NULL  
)    
AS BEGIN    
	SET NOCOUNT ON    
	IF @idReceita IS NULL  
	BEGIN  
		SELECT r.idReceita   
		, r.cvValor
		, r.cvValorPago
		, r.cdEmissao
		, r.cdPagamento
		, r.cdRepasse
		, r.cvDesconto
		, r.cvNF
		, o.observacao
		FROM tbReceitas r   
		INNER JOIN tbClinicas c ON c.IdClinica = r.IdClinica
		LEFT JOIN tbObservacoes o ON r.IdObservacao = o.IdObservacao    
		WHERE r.cbStatus = @cbStatus AND r.cbArquivado = @cbArquivado    
		AND r.cdEmissao BETWEEN ISNULL(@dtInicial, DATEADD(YEAR,-10, GETDATE())) AND ISNULL(@dtFinal, DATEADD(YEAR, 10, GETDATE()))    
	END  
	ELSE  
	BEGIN  
		SELECT r.idReceita   
		, r.cvValor
		, r.cvValorPago
		, r.cdEmissao
		, r.cdPagamento
		, r.cdRepasse
		, r.cvDesconto
		, r.cvNF
		, o.observacao
		FROM tbReceitas r   
		INNER JOIN tbClinicas c ON c.IdClinica = r.IdClinica
		LEFT JOIN tbObservacoes o ON r.IdObservacao = o.IdObservacao    
		WHERE r.idReceita = @idReceita
	END  
END;