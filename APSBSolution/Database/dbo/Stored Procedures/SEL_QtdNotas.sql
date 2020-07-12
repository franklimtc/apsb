CREATE PROCEDURE SEL_QtdNotas
AS BEGIN    
	SELECT r.cdEmissao, DAY(r.cdEmissao) d, MONTH(r.cdEmissao) m, COUNT(cvNF) cvValor 
	FROM tbReceitas r 
	WHERE r.cdEmissao > DATEADD(DAY, -7, GETDATE())
	GROUP BY r.cdEmissao
	ORDER BY r.cdEmissao
END