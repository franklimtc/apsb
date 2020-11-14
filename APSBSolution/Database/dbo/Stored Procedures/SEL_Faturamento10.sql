CREATE PROCEDURE SEL_Faturamento10(@cbAcumulado BIT = 1)
AS
    BEGIN
	   IF @cbAcumulado = 1
		  BEGIN
			 SELECT TOP 10 c.ccApelido nome, 
						CAST(SUM(cvValor) AS DECIMAL(10, 2)) cvValor, 
						MAX(cdPagamento) UltimoPagamento
			 FROM          tbReceitas r
						INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
			 WHERE         cdPagamento IS NOT NULL AND r.cbStatus = 1
			 GROUP BY c.ccApelido
			 ORDER BY cvValor DESC;
		  END;
		  ELSE
		  BEGIN
			 SELECT TOP 10 c.ccApelido nome, 
						CAST(SUM(cvValor) AS DECIMAL(10, 2)) cvValor, 
						MAX(cdPagamento) UltimoPagamento
			 FROM          tbReceitas r
						INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
			 WHERE         cdPagamento IS NOT NULL  AND r.cbStatus = 1 AND YEAR(cdPagamento) = YEAR(GETDATE()) AND MONTH(cdPagamento) = MONTH(GETDATE())
			 GROUP BY c.ccApelido
			 ORDER BY cvValor DESC;
		  END;
    END;