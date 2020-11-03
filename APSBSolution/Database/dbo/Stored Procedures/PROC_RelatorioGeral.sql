CREATE PROCEDURE PROC_RelatorioGeral
AS
	WITH cteMedico
		AS (SELECT  p.IdProfissional, 
					   p.ccNome, 
					   p.CPFNum, 
					   p.RGNum, 
					   d.cvPIS, 
					   p.cvCNH, 
					   d.cvNumInscricao, 
					   d.cvTitulo, 
					   p.cdFiliacao, 
					   d.ccEspecialidade, 
					   banco.ccBanco, 
					   banco.ccAgencia, 
					   banco.ccConta
		    FROM          tbProfissionais p
					   LEFT JOIN tbProfissionaisDados d ON p.idprofissional = d.idProfissional
					   LEFT JOIN
		    (
			   SELECT b.idProfissional, 
					bb.ccBanco, 
					bb.cvCodBanco, 
					b.ccAgencia, 
					b.ccConta, 
					b.ccOperacao
			   FROM   tbProfissionaisBancos b
					LEFT JOIN tbBancos bb ON b.idBanco = bb.IdBanco
			   WHERE      EXISTS
			   (
				  SELECT MIN(IdProfissionalBanco)
				  FROM   tbProfissionaisBancos c
				  WHERE  c.cvStatus = 1
					    AND C.IdProfissionalBanco = B.IdProfissionalBanco
				  GROUP BY c.idProfissional
			   )
		    ) banco ON p.IdProfissional = banco.idProfissional),
		cteClinica
		AS (SELECT cp.idClinica, 
				 c.ccApelido, 
				 c.cvDescontos, 
				 cp.idProfissional, 
				 cp.cvTaxaProfissional
		    FROM   tbClinicaProfissional cp
				 INNER JOIN tbClinicas c ON c.IdClinica = cp.idClinica
		    WHERE  cp.cvStatus = 1),
		cteFatProfissional
		AS (SELECT idProfissional, 
				 YEAR(dataRepasse) ano, 
				 MONTH(dataRepasse) mesNum, 
				 dbo.GetMonthName(MONTH(dataRepasse)) mesNome, 
				 SUM(cvValorRepasse) cvValorRepasse
		    FROM   tbProfissionalRepasse
		    WHERE  ccStatus = 'R'
		    GROUP BY idProfissional, 
				   YEAR(dataRepasse), 
				   MONTH(dataRepasse)),
		cteFatClinica
		AS (SELECT IdClinica, 
				 YEAR(cdPagamento) ano, 
				 MONTH(cdPagamento) mesNum, 
				 dbo.GetMonthName(MONTH(cdPagamento)) mesNome, 
				 SUM(ROUND(cvValor * cvDesconto / 100.0, 2)) cvValorClinica
		    FROM   tbReceitas
		    WHERE  cbStatus = 1
				 AND cdPagamento IS NOT NULL
		    GROUP BY IdClinica, 
				   YEAR(cdPagamento), 
				   MONTH(cdPagamento))
		SELECT cteMedico.*, 
				    cteClinica.cvTaxaProfissional, 
				    cteFatProfissional.ano, 
				    cteFatProfissional.mesNome, 
				    cteFatProfissional.cvValorRepasse, 
				    cteClinica.ccApelido, 
				    cteClinica.cvDescontos, 
				    cteFatClinica.cvValorClinica, 
				    cteFatClinica.ano anoClinica, 
				    cteFatClinica.mesNome mesNomeClinica
		FROM          cteMedico
				    INNER JOIN cteClinica ON cteMedico.IdProfissional = cteClinica.idProfissional
				    LEFT JOIN cteFatProfissional ON cteMedico.IdProfissional = cteFatProfissional.IdProfissional
				    LEFT JOIN cteFatClinica ON cteClinica.idClinica = cteFatClinica.IdClinica AND cteFatClinica.mesNum = cteFatProfissional.mesNum