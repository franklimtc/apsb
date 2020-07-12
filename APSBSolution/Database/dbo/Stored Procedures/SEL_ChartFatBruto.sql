CREATE PROCEDURE SEL_ChartFatBruto    
AS BEGIN    
	SELECT r.cdEmissao, DAY(r.cdEmissao) d, MONTH(r.cdEmissao) m, SUM(CAST(r.cvValor AS INT)) cvValor 
	FROM tbReceitas r 
	WHERE r.cdEmissao > DATEADD(DAY, -7, GETDATE())
	GROUP BY r.cdEmissao
	ORDER BY r.cdEmissao
END