--SEL_RepasseObs 
-- @idRepasse = 1166;
--SP_HELPTEXT 
-- SEL_RepasseObs;

CREATE PROCEDURE SEL_RepasseObs(@idRepasse INT)
AS
    BEGIN
	   DECLARE @idProfissional INT, @Repasses VARCHAR(MAX);
	   DECLARE @idReceita INT, @observacoes VARCHAR(MAX);
	   SELECT @idReceita = idReceita
	   FROM   tbProfissionalRepasse
	   WHERE  idRepasse = @idRepasse;
	   SELECT @observacoes = NULLIF(CONCAT(o.observacao, o1.observacao), ''), 
			@idProfissional = r.idProfissional
	   FROM   tbProfissionalRepasse r
			INNER JOIN tbReceitas re ON r.idReceita = re.idReceita
			INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional
			INNER JOIN tbClinicaProfissional cp ON cp.idClinica = re.IdClinica
										    AND cp.idProfissional = p.IdProfissional
			LEFT JOIN tbObservacoes O ON cp.IdObservacao = o.IdObservacao
			LEFT JOIN tbObservacoes O1 ON p.IdObservacao = o1.IdObservacao
	   WHERE  r.ccStatus <> 'C'
			AND r.idReceita = @idReceita;
	   DECLARE @qtdRepasses INT= 0;
	   SELECT @qtdRepasses = COUNT(*)
	   FROM   tbProfissionalRepasse pr
			INNER JOIN tbReceitas r ON r.idReceita = pr.idReceita
								  AND r.cbStatus = 1
	   WHERE  idprofissional = @idProfissional
			AND ccStatus = 'A';
	   IF @qtdRepasses > 1
		  BEGIN
			 DECLARE @ValorTotal DECIMAL(20, 2);
			 SET @Repasses =
			 (
				SELECT ' | ID Receita: ' + CAST(r.idReceita AS VARCHAR(MAX)) + ' - Valor Repasse: ' + CAST(pr.cvValorRepasse AS VARCHAR(MAX)) -- + ' - ' + CAST(SUM(pr.cvValorRepasse) OVER() AS VARCHAR(MAX))     
				FROM   tbProfissionalRepasse pr
					  INNER JOIN tbReceitas r ON r.idReceita = pr.idReceita
										    AND r.cbStatus = 1
				WHERE  idprofissional = @idProfissional
					  AND ccStatus = 'A' FOR XML PATH('')
			 );
			 SELECT TOP 1 @ValorTotal = SUM(pr.cvValorRepasse)
			 FROM         tbProfissionalRepasse pr
					    INNER JOIN tbReceitas r ON r.idReceita = pr.idReceita
											 AND r.cbStatus = 1
			 WHERE        idprofissional = @idProfissional
					    AND ccStatus = 'A';
			 SET @Repasses = CONCAT('Profissional possui ', @qtdRepasses - 1, ' repasse além deste.  Detalhes: ', @Repasses, ' Valor Total: ', @ValorTotal);
		  END;
	   IF ISNULL(@observacoes, '') = ''
		 AND ISNULL(@Repasses, '') = ''
		  BEGIN
			 SELECT NULL;
		  END;
		  ELSE
		  BEGIN
			 SELECT CONCAT(@observacoes, ' || ', @Repasses) observacao;
		  END;
    END;