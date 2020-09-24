CREATE PROCEDURE SEL_Operacoes
(@cbArquivado BIT      = 0, 
 @cbStatus    BIT      = 1, 
 @dtInicio    DATETIME = NULL, 
 @dtFim       DATETIME = NULL
)
AS
    BEGIN
	   SELECT r.idReceita [ID], 
			CAST(r.cvValor AS DECIMAL(10, 2)) cvValor, 
			CAST(ISNULL(r.cvValorPago, 0) AS DECIMAL(10, 2)) cvValorRecebido, 
			CAST(ISNULL(vwR.cvValorRepassado, 0) AS DECIMAL(10, 2)) cvValorRepassado, 
			c.ccApelido [ccDescricao], 
			c.ccOperador, 
			o.observacao, 
			r.cdEmissao, 
			r.cdPagamento,
			CASE
			    WHEN vwR.STATUS = 'R'
			    THEN vwR.dtRepasse
			    ELSE NULL
			END [cdRepasse],
			CASE
			    WHEN ISNULL(vwR.cvValorRepassado, 0) > ISNULL(r.cvValorPago, 0)
				    OR ISNULL(r.cvValorPago, 0) > ISNULL(r.cvValor, 0)
			    THEN 4
			    WHEN r.cdEmissao IS NULL
			    THEN 0
			    WHEN r.cdEmissao IS NOT NULL
				    AND r.cdPagamento IS NULL
			    THEN 1
			    WHEN r.cdEmissao IS NOT NULL
				    AND r.cdPagamento IS NOT NULL
				    AND (vwR.STATUS = 'A'
					    OR vwR.STATUS IS NULL)
			    THEN 2
			    WHEN r.cdEmissao IS NOT NULL
				    AND r.cdPagamento IS NOT NULL
				    AND vwR.STATUS = 'R'    
			    --AND CAST(ISNULL(r.cvValorPago, 0) AS DECIMAL(10, 2))=CAST(ISNULL(vwR.cvValorUsado, 0) AS DECIMAL(10, 2))    
			    THEN 3
			    ELSE 4
			END [Status], 
			'Receita' [Tipo], 
			r.cvNF
	   FROM     tbReceitas r
			  INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
			  LEFT JOIN tbObservacoes o ON r.idObservacao = o.IdObservacao
			  LEFT JOIN vwReceitas vwR ON r.idReceita = vwR.idReceita
	   WHERE   r.cbStatus = @cbStatus
			 AND r.cbArquivado = @cbArquivado
			 AND (r.cdEmissao BETWEEN ISNULL(@dtInicio, DATEADD(year, -10, GETDATE())) AND ISNULL(@dtFim, DATEADD(year, +10, GETDATE()))
				 OR cdEmissao IS NULL)
	   UNION
	   SELECT d.idDespesas, 
			CAST(d.cvValor AS DECIMAL(10, 2)) cvValor, 
			NULL cvValorRecebido, 
			NULL cvValorRepassado, 
			t.ccTipo, 
			NULL ccOperador, 
			o.observacao, 
			d.cdData cdEmissao, 
			NULL cdPagamento, 
			NULL cdRepasse, 
			3 [Status], 
			'Despesa' [Tipo], 
			NULL cvNF
	   FROM   tbDespesas d
			INNER JOIN tbDespesaTipo t ON d.idTipo = t.idTipo
			LEFT JOIN tbObservacoes o ON d.IdObservacao = o.IdObservacao
	   WHERE  d.cbStatus = @cbStatus
			AND d.cbArquivado = @cbArquivado
			AND d.cdData BETWEEN ISNULL(@dtInicio, DATEADD(year, -10, GETDATE())) AND ISNULL(@dtFim, DATEADD(year, +10, GETDATE()))
    END;