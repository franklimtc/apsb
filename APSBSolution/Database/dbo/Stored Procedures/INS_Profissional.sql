CREATE PROCEDURE INS_Profissional
(
	@ccNome VARCHAR(100)
	,@ccSexo CHAR(1)
	,@ccNaturalUF CHAR(2)
	,@ccNaturalCidade VARCHAR(50)
	,@ccEstadoCivil CHAR(1)
	,@ccEmail VARCHAR(100)
	,@UserName VARCHAR(20)
	,@observacoes VARCHAR(MAX)
	,@RGNum VARCHAR(20)
	,@RGEmissor VARCHAR(5)
	,@RGdtEmissao DATETIME
	,@CPFNum VARCHAR(15)
	,@cvTelefone BIGINT
	,@cvCelular BIGINT
	,@nomePai VARCHAR(MAX)
	,@nomeMae VARCHAR(MAX)
	,@nomeConjuge VARCHAR(MAX)

)
AS BEGIN  
	SET NOCOUNT ON  
	DECLARE @idObservacao INT =  NULL, @Result BIT = 0;  
	IF ISNULL(@observacoes,'') <> ''  
	BEGIN  
		INSERT INTO tbObservacoes(observacao) VALUES(@observacoes);  
		SELECT @idObservacao = SCOPE_IDENTITY() ;  
	END  
  
	BEGIN TRY    
		INSERT INTO tbProfissionais(ccNome, ccSexo, ccNaturalUF, ccNaturalCidade, ccEstadoCivil, ccEmail
		, ccCriadoPor, IdObservacao, RGNum, RGEmissor, RGdtEmissao, CPFNum, cvTelefone, cvCelular, nomePai, nomeMae, nomeConjuge) 
		VALUES(@ccNome, @ccSexo, @ccNaturalUF, @ccNaturalCidade, @ccEstadoCivil, @ccEmail, @UserName, @IdObservacao, @RGNum
		, @RGEmissor, @RGdtEmissao, @CPFNum, @cvTelefone, @cvCelular, @nomePai, @nomeMae, @nomeConjuge);
		
		SET @Result = 1;  
	END TRY  
	BEGIN CATCH  
		INSERT INTO tbLogErro  
		SELECT    
		ERROR_NUMBER() AS ErrorNumber    
		,ERROR_SEVERITY() AS ErrorSeverity    
		,ERROR_STATE() AS ErrorState    
		,ERROR_PROCEDURE() AS ErrorProcedure    
		,ERROR_LINE() AS ErrorLine    
		,ERROR_MESSAGE() AS ErrorMessage  
		,GETDATE() AS Data   
		,@UserName AS ccCriadoPor;    
	END CATCH  
   
	SELECT @Result;  
END