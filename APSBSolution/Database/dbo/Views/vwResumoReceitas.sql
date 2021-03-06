CREATE VIEW vwResumoReceitas
AS
	SELECT r.idReceita, 
		  CAST(r.cvValor AS DECIMAL(10, 2)) cvValor, 
		  CAST(ISNULL(NULLIF(r.cvValorPago, 0), r.cvValor - (r.cvValor * (ISNULL(c.cvDescontos, 0) + ISNULL(c.cvISS, 0)) / 100)) AS DECIMAL(10, 2)) cvValorPago, 
		  CAST(ISNULL(vwr.cvValorRepassado, 0) AS DECIMAL(10, 2)) cvValorRepassado, 
		  CAST((ISNULL(r.cvValorPago, 0) - ISNULL(vwr.cvValorUsado, 0)) AS DECIMAL(10, 2)) cvValorDisponivel, 
		  r.cdEmissao, 
		  r.cdPagamento, 
		  vwr.dtRepasse cdRepasse, 
		  CAST(r.cvDesconto AS DECIMAL(10, 2)) cvDesconto, 
		  r.cvNF, 
		  o.observacao, 
		  r.cbIssRetido, 
		  c.ccApelido, 
		  c.cvCNPJ, 
		  DATEADD(day, ISNULL(c.cvPgtoDias, 5), r.cdEmissao) cdPrevistaPgto, 
		  CAST(ISNULL((r.cvDesconto / 100) * r.cvValor, 0) AS DECIMAL(10, 2)) cvDescontoValor,
		  CASE
			 WHEN R.cbIssRetido = 1
			 THEN C.cvISS
			 ELSE 0
		  END cvISS,
		  CASE
			 WHEN R.cbIssRetido = 1
			 THEN CAST(ISNULL((C.cvISS / 100) * r.cvValor, 0) AS DECIMAL(10, 2))
			 ELSE 0.00
		  END cvISSValor,
		  CASE
			 WHEN ISNULL(vwR.cvValorUsado, 0) > ISNULL(r.cvValorPago, 0)
				 OR ISNULL(r.cvValorPago, 0) > ISNULL(r.cvValor, 0)
			 THEN '0 - Erro'
			 WHEN r.cdEmissao IS NULL
			 THEN '1 - Cadastro'
			 WHEN r.cdEmissao IS NOT NULL
				 AND r.cdPagamento IS NULL
			 THEN '2 - NF Emitida'
			 WHEN r.cdEmissao IS NOT NULL
				 AND r.cdPagamento IS NOT NULL
				 AND (vwR.STATUS = 'A'
					 OR vwR.STATUS IS NULL)
			 THEN '3 - Recebido'
			 WHEN r.cdEmissao IS NOT NULL
				 AND r.cdPagamento IS NOT NULL
				 AND vwR.STATUS = 'R'
				 AND CAST(ISNULL(r.cvValorPago, 0) AS DECIMAL(10, 2)) = CAST(ISNULL(vwR.cvValorUsado, 0) AS DECIMAL(10, 2))
			 THEN '4 - Repassado'
			 ELSE '0 - Não Identificado'
		  END [Status]
	FROM   tbReceitas r
		  INNER JOIN tbClinicas c ON c.IdClinica = r.IdClinica
		  LEFT JOIN tbObservacoes o ON r.IdObservacao = o.IdObservacao
		  LEFT JOIN vwReceitas vwr ON r.idReceita = vwr.idReceita AND vwr.status = 'R'
	WHERE  r.cbStatus = 1;