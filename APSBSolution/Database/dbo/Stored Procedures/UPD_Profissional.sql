CREATE PROCEDURE UPD_Profissional
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
 @RGdtEmissao      DATETIME, 
 @CPFNum           VARCHAR(15), 
 @cvTelefone       BIGINT, 
 @cvCelular        BIGINT, 
 @nomePai          VARCHAR(MAX), 
 @nomeMae          VARCHAR(MAX), 
 @nomeConjuge      VARCHAR(MAX), 
 @IdProfissional   INT, 
 @cdDataNascimento DATETIME, 
 @cdFiliacao       DATETIME, 
 @cdPgtoTaxa       DATETIME, 
 @cdRegCartorio    DATETIME, 
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
		  UPDATE tbProfissionais
		    SET  
			   ccNome = TRIM(@ccNome), 
			   ccSexo = @ccSexo, 
			   ccNaturalUF = @ccNaturalUF, 
			   ccNaturalCidade = @ccNaturalCidade, 
			   ccEstadoCivil = @ccEstadoCivil, 
			   ccEmail = TRIM(@ccEmail), 
			   ccAlteradoPor = @UserName, 
			   cdDataAlteracao = GETDATE(), 
			   IdObservacao = @idObservacao, 
			   RGNum = @RGNum, 
			   RGEmissor = @RGEmissor, 
			   RGdtEmissao = @RGdtEmissao, 
			   CPFNum = @CPFNum, 
			   cvTelefone = @cvTelefone, 
			   cvCelular = @cvCelular, 
			   nomePai = TRIM(@nomePai), 
			   nomeMae = TRIM(@nomeMae), 
			   nomeConjuge = TRIM(@nomeConjuge), 
			   cdDataNascimento = @cdDataNascimento, 
			   cdFiliacao = @cdFiliacao, 
			   cdPgtoTaxa = @cdPgtoTaxa, 
			   cdRegCartorio = @cdRegCartorio, 
			   cvCNH = ISNULL(@cvCNH, 0)
		  WHERE  IdProfissional = @IdProfissional;
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