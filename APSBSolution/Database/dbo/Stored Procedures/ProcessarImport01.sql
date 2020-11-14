

-- Identificar ID's Profissionais

CREATE PROCEDURE ProcessarImport01
AS
  BEGIN
	SET NOCOUNT ON;

	--ALTER TABLE tbImport01
	--ADD idProfissional INT;

	UPDATE tbImport01
	SET    
		idProfissional = b.idProfissional
	  FROM tbImport01 a
	  INNER JOIN tbProfissionais b ON a.Profissional=b.ccNome;


	--ALTER TABLE tbImport01
	--ADD idClinica INT;

	UPDATE tbImport01
	SET    
		idClinica = b.idClinica
	  FROM tbImport01 a
	  INNER JOIN tbClinicas b ON a.CL_NICA_OU_HOSPITAL=b.ccApelido;

	-- Substituir virgulas
	UPDATE tbImport01
	SET    
		TAXA = REPLACE(TAXA, ',', '.');

	DECLARE @idProfissional     INT, 
			@idClinica          INT, 
			@cvTaxaProfissional NVARCHAR(100), 
			@codBanco           NVARCHAR(100), 
			@ag                 NVARCHAR(100), 
			@cc                 NVARCHAR(100), 
			@qtd                INT;

	DECLARE cProfissional CURSOR
	FOR SELECT idProfissional, 
			   idClinica, 
			   Taxa, 
			   c_d_banco, 
			   ag_ncia, 
			   cc
		  FROM tbImport01
		 WHERE idProfissional IS NOT NULL
			   AND idClinica IS NOT NULL;

	OPEN cProfissional;

	FETCH NEXT FROM cProfissional INTO @idProfissional, 
									   @idClinica, 
									   @cvTaxaProfissional, 
									   @codBanco, 
									   @ag, 
									   @cc;

	WHILE @@FETCH_STATUS=0
	  BEGIN

		SELECT @qtd = COUNT(*)
		  FROM tbClinicaProfissional
		 WHERE idClinica=@idClinica
			   AND idProfissional=@idProfissional;
		IF @qtd=0
		   AND @cvTaxaProfissional IS NOT NULL
		  BEGIN	 --INSERE OS RELACIONAMENTOS CLINICA/PROFISSIONAL
			INSERT INTO tbClinicaProfissional
			( idClinica, 
			  idProfissional, 
			  cvTaxaProfissional
			)
			VALUES
			(@idClinica, @idProfissional, CAST(@cvTaxaProfissional AS DECIMAL(10, 2)));
		END;

		SELECT @qtd = COUNT(*)
		  FROM tbProfissionaisBancos a
		 WHERE a.idProfissional=@idProfissional
			   AND a.ccAgencia=@ag
			   AND a.ccConta=@cc;
		IF @qtd=0
		   AND @codBanco<>'#N/A'
		  BEGIN
			INSERT INTO tbProfissionaisBancos
			( ccAgencia, 
			  ccConta, 
			  idProfissional, 
			  idBanco
			)
			 (
			   SELECT @ag, 
					  @cc, 
					  @idProfissional, 
					  b.IdBanco
				 FROM tbBancos b
				WHERE b.cvCodBanco=CAST(@codBanco AS INT)
			 );
		END;

		FETCH NEXT FROM cProfissional INTO @idProfissional, 
										   @idClinica, 
										   @cvTaxaProfissional, 
										   @codBanco, 
										   @ag, 
										   @cc;

	  END;

	CLOSE cProfissional;

	DEALLOCATE cProfissional;

	TRUNCATE TABLE tbImport01;
  END;