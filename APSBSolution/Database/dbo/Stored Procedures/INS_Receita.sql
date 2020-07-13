
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
  DECLARE @idObservacao INT =  NULL, @Result BIT = 0, @cvIss FLOAT(2) = 0;                
  IF ISNULL(@observacoes,'') <> ''                
  BEGIN                
    INSERT INTO tbObservacoes(observacao) VALUES(@observacoes);                
    SELECT @idObservacao = SCOPE_IDENTITY() ;                
  END   
  
  IF @cbIssRetido = 1
  SELECT @cvIss = c.cvISS FROM tbClinicas c where c.IdClinica = @IdClinica
                
  BEGIN TRY                  
 INSERT INTO tbReceitas              
 (IdClinica, cvValor, cvDesconto, idObservacao, cbIssRetido, cvDescontoISS, cvValorPago)              
 VALUES              
 (@IdClinica, ROUND(@cvValor, 2), ROUND(@cvDesconto,2), @idObservacao, @cbIssRetido, @cvIss, @cvValor - (@cvValor * (ISNULL(@cvIss, 0) + ISNULL(@cvDesconto, 0))/100))             
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