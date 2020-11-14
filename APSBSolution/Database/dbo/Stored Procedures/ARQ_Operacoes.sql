
CREATE PROCEDURE ARQ_Operacoes
(
   @dtFim DATETIME = NULL
)
AS
  BEGIN
	SET NOCOUNT ON;
	BEGIN
	  DECLARE @cbArquivado BIT      = 0, 
			  @cbStatus    BIT      = 1, 
			  @dtInicio    DATETIME = NULL;


	  BEGIN
		SELECT r.idReceita                                             [ID], 
			   CAST(r.cvValor AS DECIMAL(10, 2))                       cvValor, 
			   CAST(ISNULL(r.cvValorPago, 0) AS DECIMAL(10, 2))        cvValorRecebido, 
			   CAST(ISNULL(vwR.cvValorRepassado, 0) AS DECIMAL(10, 2)) cvValorRepassado, 
			   c.ccApelido                                             [ccDescricao], 
			   COALESCE(r.UserName, c.ccOperador)                      ccOperador, 
			   o.observacao, 
			   r.cdEmissao, 
			   r.cdPagamento,
			   CASE
				 WHEN vwR.STATUS='R'
				 THEN vwR.dtRepasse
				 ELSE NULL
			   END                                                     [cdRepasse],
			   CASE
				 WHEN ISNULL(vwR.cvValorRepassado, 0)>ISNULL(r.cvValorPago, 0)
					  OR ISNULL(r.cvValorPago, 0)>ISNULL(r.cvValor, 0)
				 THEN 4
				 WHEN r.cdEmissao IS NULL
				 THEN 0
				 WHEN r.cdEmissao IS NOT NULL
					  AND r.cdPagamento IS NULL
				 THEN 1
				 WHEN r.cdEmissao IS NOT NULL
					  AND r.cdPagamento IS NOT NULL
					  AND (vwR.STATUS='A'
						   OR vwR.STATUS IS NULL)
				 THEN 2
				 WHEN r.cdEmissao IS NOT NULL
					  AND r.cdPagamento IS NOT NULL
					  AND vwR.STATUS='R'        
				   --AND CAST(ISNULL(r.cvValorPago, 0) AS DECIMAL(10, 2))=CAST(ISNULL(vwR.cvValorUsado, 0) AS DECIMAL(10, 2))        
				 THEN 3
				 ELSE 4
			   END                                                     [Status], 
			   'Receita'                                               [Tipo], 
			   r.cvNF
		INTO #tbReceitas
		  FROM tbReceitas r
		  INNER JOIN tbClinicas c ON r.IdClinica=c.IdClinica
			  LEFT JOIN tbObservacoes o ON r.idObservacao=o.IdObservacao
				  LEFT JOIN vwReceitas vwR ON r.idReceita=vwR.idReceita
		 WHERE r.cbStatus=@cbStatus
			   AND r.cbArquivado=@cbArquivado
			   AND (r.cdEmissao BETWEEN ISNULL(@dtInicio, DATEADD(year, -10, GETDATE())) AND ISNULL(@dtFim, DATEADD(year, +10, GETDATE()))
					OR cdEmissao IS NULL);
  
		--##############################
		--Arquiva Despesas
		--##############################

		UPDATE tbDespesas
		SET    
			cbArquivado = 1
		 WHERE cdData<@dtFim
			   AND cbArquivado=0
			   AND cbStatus=1;

		--##############################
		--Arquiva Receitas
		--##############################

		UPDATE tbReceitas
		SET    
			cbArquivado = 1
		  FROM tbReceitas r1
		  INNER JOIN #tbReceitas r2 ON r1.idReceita=r2.ID
		 WHERE r2.STATUS=3
			   AND r2.cdRepasse<@dtFim;

		DROP TABLE #tbReceitas;


	  END;
	END;
  END;