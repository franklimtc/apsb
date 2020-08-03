CREATE PROCEDURE SEL_ChartReceitaLiquida
AS
  BEGIN
	SELECT MONTH(dataRepasse)                                             MN, 
		   LEFT(FORMAT(dataRepasse, 'MMMM'), 1)                           d, 
		   SUM(CAST(r.cvValor*ISNULL(cvTaxaProfissional, 10)/100 AS INT)) cvValor
	  FROM tbProfissionalRepasse R
	 WHERE YEAR(dataRepasse)=YEAR(GETDATE())
		   AND ccStatus='R'
	 GROUP BY MONTH(dataRepasse), 
			  LEFT(FORMAT(dataRepasse, 'MMMM'), 1)
	ORDER BY MN;
  END;