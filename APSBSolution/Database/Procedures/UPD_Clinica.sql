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
 @cvCNPJ             BIGINT
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