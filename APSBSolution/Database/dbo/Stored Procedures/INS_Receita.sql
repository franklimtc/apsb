
CREATE PROCEDURE INS_Receita            
(            
 @UserName VARCHAR(MAX)           
 , @IdClinica int            
 , @cvValor float            
 , @cvDesconto real = NULL            
 , @observacoes VARCHAR(MAX) = NULL 
 , @cbIssRetido BIT = 0
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
 INSERT INTO tbReceitas            
 (IdClinica, cvValor, cvDesconto, idObservacao, cbIssRetido)            
 VALUES            
 (@IdClinica, ROUND(@cvValor, 2), ROUND(@cvDesconto,2), @idObservacao, @cbIssRetido)           
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