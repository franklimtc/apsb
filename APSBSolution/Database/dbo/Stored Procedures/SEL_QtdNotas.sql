
CREATE PROCEDURE SEL_QtdNotas
AS
  BEGIN
	SELECT MONTH(cdEmissao)                   MN, 
		   LEFT(FORMAT(cdEmissao, 'MMMM'), 1) d, 
		   COUNT(1)     cvValor
	  FROM tbReceitas R
	 WHERE YEAR(cdEmissao)=YEAR(GETDATE())
		   AND cdPagamento IS NOT NULL
	 GROUP BY MONTH(cdEmissao), 
			  LEFT(FORMAT(cdEmissao, 'MMMM'), 1)
	ORDER BY MN;
  END;