CREATE PROCEDURE SEL_Repasse10 
AS BEGIN
	SELECT TOP 10 p.ccNome nome, CAST(SUM(cvValor* cvTaxaProfissional / 100)  AS DECIMAL(10,2)) cvValor, MAX(pr.dataRepasse) UltimoRepasse 
	from tbProfissionalRepasse pr
	INNER JOIN tbProfissionais p ON p.IdProfissional = pr.IdProfissional
	where pr.ccStatus = 'R'
	GROUP BY p.ccNome
	ORDER BY 2 DESC
END