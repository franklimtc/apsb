
CREATE PROCEDURE SEL_ChartFatBruto
AS
  BEGIN
	SELECT MONTH(cdEmissao)                   MN, 
		   LEFT(FORMAT(cdEmissao, 'MMMM'), 1) d, 
		   SUM(CAST(r.cvValor AS INT))        cvValor
	  FROM tbReceitas R
	 WHERE YEAR(cdEmissao)=YEAR(GETDATE())
	 GROUP BY MONTH(cdEmissao), 
			  LEFT(FORMAT(cdEmissao, 'MMMM'), 1)
	ORDER BY MN;
  END;