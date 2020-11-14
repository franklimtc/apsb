
CREATE PROCEDURE EXC_Profissional  
(  
	@UserName VARCHAR(MAX)    
	, @idProfissional INT    
)  
AS BEGIN  
	SET NOCOUNT ON    
	DECLARE @Result BIT = 0;    
  
	BEGIN TRY    
		UPDATE tbProfissionais SET  cvStatus = 0, ccAlteradoPor = @UserName, cdDataAlteracao = GETDATE()  
		WHERE IdProfissional = @idProfissional;  
  
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
END;