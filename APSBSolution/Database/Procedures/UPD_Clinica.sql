
CREATE PROCEDURE UPD_Clinica
(@UserName           VARCHAR(MAX), 
 @ccApelido          VARCHAR(MAX), 
 @ccRazaoSocial      VARCHAR(MAX), 
 @ccNomeFantasia     VARCHAR(MAX), 
 @ccEmail            VARCHAR(MAX), 
 @cvISS              DECIMAL(10, 2), 
 @cvDescontos        DECIMAL(10, 2), 
 @idBanco            INT, 
 @cvPgtoDias         INT, 
 @cbDescontoVariavel BIT, 
 @observacoes        VARCHAR(MAX), 
 @idClinica          INT, 
 @cvCNPJ             BIGINT, 
 @cvValorCorte       DECIMAL(10, 2)  = NULL, 
 @cvValorMenor       DECIMAL(10, 2)  = NULL, 
 @cvValorMaior       DECIMAL(10, 2)  = NULL
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @idObservacao INT= NULL, @Result BIT= 0;
	   SELECT @idObservacao = ISNULL(idObservacao, 0)
	   FROM   tbClinicas
	   WHERE  IdClinica = @idClinica;
	   IF @idObservacao > 0
		  BEGIN
			 UPDATE tbObservacoes
			   SET  
				  observacao = @observacoes
			 WHERE  IdObservacao = @idObservacao;
		  END;
		  ELSE
		  BEGIN
			 IF @observacoes IS NOT NULL
			    AND @observacoes <> ''
				BEGIN
				    INSERT INTO              tbObservacoes(observacao)
				VALUES                   (@observacoes);
				    SET @idObservacao = SCOPE_IDENTITY();
				    PRINT CONCAT(@idObservacao, ' - ', @observacoes);
				END;
		  END;
	   BEGIN TRY
		  UPDATE tbClinicas
		    SET  
			   ccApelido = TRIM(@ccApelido), 
			   ccRazaoSocial = TRIM(@ccRazaoSocial), 
			   ccNomeFantasia = TRIM(@ccNomeFantasia), 
			   ccEmail = TRIM(@ccEmail), 
			   cvISS = @cvISS, 
			   cvDescontos = @cvDescontos, 
			   cbDescontoVariavel = @cbDescontoVariavel, 
			   idBanco = @idBanco, 
			   ccAlteradoPor = @UserName, 
			   cdDataAlteracao = GETDATE(), 
			   cvPgtoDias = @cvPgtoDias, 
			   idObservacao = NULLIF(@idObservacao, 0), 
			   cvCNPJ = @cvCNPJ
		  WHERE  IdClinica = @idClinica;
		  IF @cbDescontoVariavel = 1
			 BEGIN
				DECLARE @QTD INT= 0;
				SELECT @QTD = COUNT(*)
				FROM   tbDescontoVariavelClinicas
				WHERE  idClinica = @idClinica;
				IF @QTD = 0
				    BEGIN
					   INSERT INTO tbDescontoVariavelClinicas
					   (idClinica, 
					    cvValorCorte, 
					    cvValorMenor, 
					    cvValorMaior, 
					    cbStatus, 
					    ccAlteradoPor
					   )
					   VALUES
					   (@idClinica, 
					    @cvValorCorte, 
					    @cvValorMenor, 
					    @cvValorMaior, 
					    1, 
					    @UserName
					   );
				    END;
				    ELSE
				    BEGIN
					   UPDATE tbDescontoVariavelClinicas
						SET  
						    cbStatus = 1, 
						    cvValorCorte = @cvValorCorte, 
						    cvValorMenor = @cvValorMenor, 
						    cvValorMaior = @cvValorMaior, 
						    ccAlteradoPor = @UserName
					   WHERE  idClinica = @idClinica;
				    END;
			 END;
			 ELSE
			 BEGIN
				UPDATE tbDescontoVariavelClinicas
				  SET  
					 cbStatus = 0, 
					 cdDataDesativacao = GETDATE(), 
					 ccAlteradoPor = @UserName
				WHERE  idClinica = @idClinica;
			 END;
		  SET @Result = 1;
	   END TRY
	   BEGIN CATCH
		  INSERT INTO tbLogErro
			    SELECT ERROR_NUMBER() AS ErrorNumber, 
					 ERROR_SEVERITY() AS ErrorSeverity, 
					 ERROR_STATE() AS ErrorState, 
					 ERROR_PROCEDURE() AS ErrorProcedure, 
					 ERROR_LINE() AS ErrorLine, 
					 ERROR_MESSAGE() AS ErrorMessage, 
					 GETDATE() AS Data, 
					 @UserName AS ccCriadoPor;
	   END CATCH;
	   SELECT @Result;
    END;