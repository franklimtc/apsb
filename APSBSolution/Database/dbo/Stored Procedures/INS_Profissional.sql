CREATE PROCEDURE INS_Profissional
(@ccNome           VARCHAR(100), 
 @ccSexo           CHAR(1), 
 @ccNaturalUF      CHAR(2), 
 @ccNaturalCidade  VARCHAR(50), 
 @ccEstadoCivil    CHAR(1), 
 @ccEmail          VARCHAR(100), 
 @UserName         VARCHAR(20), 
 @observacoes      VARCHAR(MAX), 
 @RGNum            VARCHAR(20), 
 @RGEmissor        VARCHAR(5), 
 @RGdtEmissao      DATETIME     = NULL, 
 @CPFNum           VARCHAR(15), 
 @cvTelefone       BIGINT       = NULL, 
 @cvCelular        BIGINT       = NULL, 
 @nomePai          VARCHAR(MAX), 
 @nomeMae          VARCHAR(MAX), 
 @nomeConjuge      VARCHAR(MAX), 
 @cdDataNascimento DATETIME     = NULL, 
 @cdFiliacao       DATETIME     = NULL, 
 @cdPgtoTaxa       DATETIME     = NULL, 
 @cdRegCartorio    DATETIME     = NULL, 
 @cvCNH            BIGINT       = NULL
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
		  INSERT INTO tbProfissionais
		  (ccNome, 
		   ccSexo, 
		   ccNaturalUF, 
		   ccNaturalCidade, 
		   ccEstadoCivil, 
		   ccEmail, 
		   ccCriadoPor, 
		   IdObservacao, 
		   RGNum, 
		   RGEmissor, 
		   RGdtEmissao, 
		   CPFNum, 
		   cvTelefone, 
		   cvCelular, 
		   nomePai, 
		   nomeMae, 
		   nomeConjuge, 
		   cdDataNascimento, 
		   cdPgtoTaxa, 
		   cdFiliacao, 
		   cdRegCartorio, 
		   cvCNH
		  )
		  VALUES
		  (LTRIM(RTRIM(@ccNome)), 
		   @ccSexo, 
		   @ccNaturalUF, 
		   LTRIM(RTRIM(@ccNaturalCidade)), 
		   @ccEstadoCivil, 
		   LTRIM(RTRIM(@ccEmail)), 
		   @UserName, 
		   @IdObservacao, 
		   @RGNum, 
		   @RGEmissor, 
		   @RGdtEmissao, 
		   @CPFNum, 
		   @cvTelefone, 
		   @cvCelular, 
		   LTRIM(RTRIM(@nomePai)), 
		   LTRIM(RTRIM(@nomeMae)), 
		   LTRIM(RTRIM(@nomeConjuge)), 
		   @cdDataNascimento, 
		   @cdPgtoTaxa, 
		   @cdFiliacao, 
		   @cdRegCartorio, 
		   ISNULL(@cvCNH, 0)
		  );
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