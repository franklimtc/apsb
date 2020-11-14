--SEL_Repasse @idReceita = 497
CREATE PROCEDURE SEL_Repasse
(@idReceita   INT      = NULL, 
 @cbArquivado BIT      = 0, 
 @cbStatus    BIT      = 1, 
 @dtInicio    DATETIME = NULL, 
 @dtFim       DATETIME = NULL
)
AS
    BEGIN
	   IF @dtInicio IS NULL
		 AND @dtFim IS NULL
		 AND @idReceita IS NULL
		  BEGIN
			 SELECT @dtInicio = MIN(cdEmissao), 
				   @dtFim = MAX(cdEmissao)
			 FROM   tbReceitas;
		  END;
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
				   --COALESCE(o.observacao, dbo.GetRepassesAtivos(p.IdProfissional)) observacao, 
				   NULLIF(CONCAT(o.observacao, dbo.GetRepassesAtivos(p.IdProfissional), o1.observacao),'') observacao, 
				   dbo.GetBancos(p.IdProfissional) Bancos
			 FROM   tbProfissionalRepasse r
				   INNER JOIN tbReceitas re ON r.idReceita = re.idReceita
				   INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional
				   INNER JOIN tbClinicaProfissional cp ON cp.idClinica = re.IdClinica
												  AND cp.idProfissional = p.IdProfissional
				   LEFT JOIN tbObservacoes O ON cp.IdObservacao = o.IdObservacao
				   LEFT JOIN tbObservacoes O1 on p.IdObservacao = o1.IdObservacao
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
				   pr.ccStatus, 
				   dbo.GetObservacoes(p.IdProfissional) observacao, 
				   dbo.GetBancos(p.IdProfissional) Bancos
			 FROM   tbReceitas r
				   INNER JOIN tbProfissionalRepasse pr ON r.idReceita = pr.idReceita
				   INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
				   INNER JOIN tbProfissionais p ON pr.IdProfissional = p.IdProfissional
			 WHERE  r.cbStatus = @cbStatus
				   AND r.cbArquivado = @cbArquivado
				   AND ISNULL(r.cdEmissao, @dtInicio + 1) BETWEEN @dtInicio AND @dtFim
				   AND pr.ccStatus <> 'C';
		  END;
    END;