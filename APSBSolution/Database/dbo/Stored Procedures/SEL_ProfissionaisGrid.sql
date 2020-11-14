

CREATE PROCEDURE SEL_ProfissionaisGrid
(
   @Status           BIT          = 1, 
   @ultimosRegistros BIT          = 0, 
   @ccNome           VARCHAR(MAX) = NULL
)
AS
  BEGIN
	IF @ccNome IS NOT NULL
	  BEGIN
		SET @ultimosRegistros = 0;
	END;
	IF @ultimosRegistros=0
	  BEGIN
		SELECT p.IdProfissional, 
			   p.ccNome, 
			   p.ccEmail, 
			   o.observacao Observacoes
		  FROM tbProfissionais p
		  LEFT JOIN tbObservacoes o ON p.IdObservacao=o.IdObservacao
		 WHERE P.cvStatus=@Status
			   AND p.ccNome LIKE CONCAT('%', ISNULL(@ccNome, ''), '%');
	END;
	  ELSE
	  BEGIN
		SELECT p.IdProfissional, 
			   p.ccNome, 
			   p.ccEmail, 
			   o.observacao Observacoes
		  FROM tbProfissionais p
		  LEFT JOIN tbObservacoes o ON p.IdObservacao=o.IdObservacao
		 WHERE P.cvStatus=@Status
			   AND p.ccNome LIKE CONCAT('%', ISNULL(@ccNome, ''), '%')
			   AND p.cdDataCriacao>GETDATE()-7;
	END;
  END;