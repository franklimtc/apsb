CREATE PROCEDURE SEL_ChartReceitaLiquida
AS
    BEGIN
	   SELECT MONTH(dataRepasse) MN, 
			LEFT(FORMAT(dataRepasse, 'MMMM'), 1) d, 
			SUM(CAST(r.cvValor * ISNULL(cvTaxaProfissional, 10) / 100 AS INT)) - SUM(CAST(r.cvValor * ISNULL(rec.cvDescontoISS, 10) / 100 AS INT)) cvValor
	   FROM   tbProfissionalRepasse R
			INNER JOIN tbReceitas rec ON R.idReceita = REC.idReceita
	   WHERE  YEAR(dataRepasse) = YEAR(GETDATE())
			AND ccStatus = 'R'
	   GROUP BY MONTH(dataRepasse), 
			  LEFT(FORMAT(dataRepasse, 'MMMM'), 1)
	   ORDER BY MN;
    END;