
CREATE PROCEDURE INS_Clinica
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
 @cvCNPJ             BIGINT, 
 @cvValorCorte       DECIMAL(10, 2)  = NULL, 
 @cvValorMenor       DECIMAL(10, 2)  = NULL, 
 @cvValorMaior       DECIMAL(10, 2)  = NULL
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @idObservacao INT= NULL, @Result BIT= 0;
	   IF ISNULL(@observacoes, '') <> ''
		  BEGIN
			 INSERT INTO              tbObservacoes(observacao)
		  VALUES                   (@observacoes);
			 SELECT @idObservacao = SCOPE_IDENTITY();
		  END;
	   BEGIN TRY
		  INSERT INTO tbClinicas
		  (ccApelido, 
		   ccRazaoSocial, 
		   ccNomeFantasia, 
		   ccEmail, 
		   cvISS, 
		   cvDescontos, 
		   cbDescontoVariavel, 
		   idObservacao, 
		   idBanco, 
		   ccCriadoPor, 
		   cvPgtoDias, 
		   cvCNPJ
		  )
		  VALUES
		  (LTRIM(RTRIM(@ccApelido)), 
		   LTRIM(RTRIM(@ccRazaoSocial)), 
		   LTRIM(RTRIM(@ccNomeFantasia)), 
		   LTRIM(RTRIM(@ccEmail)), 
		   @cvISS, 
		   @cvDescontos, 
		   @cbDescontoVariavel, 
		   @idObservacao, 
		   @idBanco, 
		   @UserName, 
		   @cvPgtoDias, 
		   @cvCNPJ
		  );
		  DECLARE @idClinica INT;
		  SELECT @idClinica = SCOPE_IDENTITY();
		  IF @cbDescontoVariavel = 1
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