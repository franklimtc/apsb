CREATE PROCEDURE SEL_Repasse10(@cbAcumulado BIT = 1)
AS
    BEGIN
	   IF @cbAcumulado = 1
		  BEGIN
			 SELECT TOP 10 p.ccNome nome, 
						CAST(SUM(cvValor * cvTaxaProfissional / 100) AS DECIMAL(10, 2)) cvValor, 
						MAX(pr.dataRepasse) UltimoRepasse
			 FROM          tbProfissionalRepasse pr
						INNER JOIN tbProfissionais p ON p.IdProfissional = pr.IdProfissional
			 WHERE         pr.ccStatus = 'R' AND pr.ccStatus <> 'C'
			 GROUP BY p.ccNome
			 ORDER BY 2 DESC;
		  END;
		  ELSE
		  BEGIN
			 SELECT TOP 10 p.ccNome nome, 
						CAST(SUM(cvValor * cvTaxaProfissional / 100) AS DECIMAL(10, 2)) cvValor, 
						MAX(pr.dataRepasse) UltimoRepasse
			 FROM          tbProfissionalRepasse pr
						INNER JOIN tbProfissionais p ON p.IdProfissional = pr.IdProfissional
			 WHERE         pr.ccStatus = 'R' AND pr.ccStatus <> 'C' AND YEAR(dataRepasse) = YEAR(GETDATE()) AND MONTH(dataRepasse) = MONTH(GETDATE())
			 GROUP BY p.ccNome
			 ORDER BY 2 DESC;
		  END;
    END;