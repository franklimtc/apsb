CREATE PROCEDURE INS_DespesaTipo
(
	@tipo VARCHAR(50),
	@UserName VARCHAR(20)
)
AS BEGIN    
  SET NOCOUNT ON    
	DECLARE @Result AS BIT = 0;
  BEGIN TRY      
	INSERT INTO tbDespesaTipo(ccTipo) VALUES(@tipo);
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