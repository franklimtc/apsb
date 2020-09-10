CREATE PROCEDURE SEL_Repasse(@idReceita INT = NULL)
AS
    BEGIN
	   IF @idReceita IS NOT NULL
		  BEGIN
			 SELECT r.idRepasse, 
				   re.IdClinica, 
				   r.idReceita, 
				   r.IdProfissional, 
				   p.ccNome, 
				   CAST(ISNULL(r.cvTaxaProfissional, 0) AS DECIMAL(10, 2)) cvTaxaProfissional, 
				   CAST(r.cvValor AS DECIMAL(10, 2)) [cvValor], 
				   CAST(r.cvValor - (r.cvValor * ISNULL(r.cvTaxaProfissional, 0) / 100) AS DECIMAL(10, 2)) [cvValorLiquido], 
				   r.ccStatus, 
				   r.dataRepasse, 
				   r.ccCriadoPor, 
				   o.observacao
			 FROM   tbProfissionalRepasse r
				   INNER JOIN tbReceitas re ON r.idReceita = re.idReceita
				   INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional
				   INNER JOIN tbClinicaProfissional cp ON cp.idClinica = re.IdClinica
												  AND cp.idProfissional = p.IdProfissional
				   LEFT JOIN tbObservacoes O ON cp.IdObservacao = o.IdObservacao
			 WHERE  r.ccStatus <> 'C'
				   AND r.idReceita = @idReceita;
		  END;
		  ELSE
		  BEGIN
			 SELECT c.ccApelido, 
				   p.ccNome,
				   r.idReceita,
				   r.cvNF, 
				   r.cdEmissao, 
				   CAST(r.cvValor AS DECIMAL(10, 2)) ValorNF, 
				   CAST(r.cvValorPago AS DECIMAL(10, 2)) ValorPago, 
				   pr.dataRepasse cdRepasse, 
				   CAST(pr.cvValor - (pr.cvValor * (ISNULL(pr.cvTaxaProfissional, 0) / 100)) AS DECIMAL(10, 2)) ValorRepasse,
				   pr.ccStatus
			 FROM   tbReceitas r
				   INNER JOIN tbProfissionalRepasse pr ON r.idReceita = pr.idReceita
				   INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
				   INNER JOIN tbProfissionais p ON pr.IdProfissional = p.IdProfissional
				   WHERE r.cbStatus = 1 and pr.ccStatus <> 'C'
		  END;
    END;