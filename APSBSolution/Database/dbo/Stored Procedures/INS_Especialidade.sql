
CREATE PROCEDURE INS_Especialidade(
 @UserName VARCHAR(20),
 @Especialidade VARCHAR(30))
AS BEGIN
	DECLARE  @Result BIT = 0; 
	BEGIN TRY
		INSERT INTO tbEspecialidade(Especialidade) VALUES(@Especialidade);
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