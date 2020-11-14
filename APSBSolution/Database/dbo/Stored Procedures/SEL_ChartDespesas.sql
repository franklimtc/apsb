CREATE PROCEDURE SEL_ChartDespesas 
AS BEGIN    
	SELECT d.cdData cdEmissao, DAY(d.cdData) d, MONTH(d.cdData) m, SUM(CAST(d.cvValor AS INT)) cvValor 
	FROM tbDespesas d 
	WHERE d.cdData > DATEADD(DAY, -7, GETDATE())
	GROUP BY d.cdData
	ORDER BY d.cdData
END