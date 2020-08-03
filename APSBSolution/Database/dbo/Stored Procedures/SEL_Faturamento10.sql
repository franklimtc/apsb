CREATE PROCEDURE SEL_Faturamento10   
AS BEGIN  
 SELECT top 10 c.ccApelido nome, CAST(SUM(cvValor) AS DECIMAL(10,2)) cvValor, MAX(cdPagamento) UltimoPagamento   
 FROM tbReceitas r  
 INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica  
 WHERE cdPagamento IS NOT NULL  
 GROUP BY c.ccApelido  
 ORDER BY cvValor DESC  
END