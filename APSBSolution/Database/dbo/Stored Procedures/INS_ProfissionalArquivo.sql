CREATE PROCEDURE INS_ProfissionalArquivo
(
	@UserName VARCHAR(MAX)      
	, @idProfissional INT
	, @ccNomeArquivo VARCHAR(50)
	, @binaryFile VARBINARY(MAX)
)
AS BEGIN
	DECLARE  @Result BIT = 0;   
	BEGIN TRY
		
		INSERT INTO tbProfissionalArquivo(idProfissional, ccNomeArquivo, binaryFile) VALUES(@idProfissional, @ccNomeArquivo, @binaryFile);
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