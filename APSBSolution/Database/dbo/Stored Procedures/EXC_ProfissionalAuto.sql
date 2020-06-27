

CREATE PROCEDURE EXC_ProfissionalAuto  
(    
	@UserName VARCHAR(30)
	,@Token VARCHAR(100)    

)    
AS BEGIN      
	SET NOCOUNT ON      
	DECLARE @Result BIT = 0;

	BEGIN TRY        
		DELETE tbProfissionais WHERE CONCAT('APSB',RIGHT(CONCAT('000000', CONCAT(IdProfissional,DATEPART(MILLISECOND,cdDataCriacao))),6)) = @Token ;     
      
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