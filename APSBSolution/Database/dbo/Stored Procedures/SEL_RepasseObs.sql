
CREATE PROCEDURE SEL_RepasseObs
(
   @idRepasse INT
)
AS

BEGIN
  DECLARE @idProfissional INT, 
		  @Obs            VARCHAR(MAX), 
		  @Repasses       VARCHAR(MAX);
  SELECT @idProfissional = C.idProfissional, 
		 @Obs = o.observacao
	FROM tbProfissionalRepasse p
	INNER JOIN tbReceitas r ON p.idReceita=r.idReceita
		INNER JOIN tbClinicaProfissional c ON r.IdClinica=c.idClinica
											  AND p.IdProfissional=c.idProfissional
			LEFT JOIN tbObservacoes o ON c.idObservacao=o.IdObservacao
   WHERE p.idRepasse=@idRepasse;
  PRINT @idProfissional;
  DECLARE @qtdRepasses INT = 0;
  SELECT @qtdRepasses = COUNT(*)
	FROM tbProfissionalRepasse pr
	INNER JOIN tbReceitas r ON r.idReceita=pr.idReceita
							   AND r.cbStatus=1
   WHERE idprofissional=@idProfissional
		 AND ccStatus='A';
  IF @qtdRepasses>1
	BEGIN
	  DECLARE @ValorTotal DECIMAL(20, 2);
	  SET @Repasses =
	   (
		 SELECT ' | ID Receita: '+CAST(r.idReceita AS VARCHAR(MAX))+' - Valor Repasse: '+CAST(pr.cvValorRepasse AS VARCHAR(MAX)) -- + ' - ' + CAST(SUM(pr.cvValorRepasse) OVER() AS VARCHAR(MAX))   
		   FROM tbProfissionalRepasse pr
		   INNER JOIN tbReceitas r ON r.idReceita=pr.idReceita
									  AND r.cbStatus=1
		  WHERE idprofissional=@idProfissional
				AND ccStatus='A' FOR XML PATH('')
	   );
	  SELECT TOP 1 @ValorTotal = SUM(pr.cvValorRepasse)
		FROM       tbProfissionalRepasse pr
		INNER JOIN tbReceitas r ON r.idReceita=pr.idReceita
								   AND r.cbStatus=1
	   WHERE       idprofissional=@idProfissional
				   AND ccStatus='A';
	  SET @Repasses = CONCAT('Profissional possui ', @qtdRepasses-1, ' repasse além deste.  Detalhes: ', @Repasses, ' Valor Total: ', @ValorTotal);
  END;

  PRINT CONCAT('''', @Obs, '''');
  PRINT CONCAT('''', @Repasses, '''');
  IF ISNULL(@Obs,'') = '' AND ISNULL(@Repasses, '') =''
	BEGIN
SELECT NULL
  END;
	ELSE
	BEGIN
	  SELECT CONCAT(@Obs, ' || ', @Repasses) observacao;
  END;
END;