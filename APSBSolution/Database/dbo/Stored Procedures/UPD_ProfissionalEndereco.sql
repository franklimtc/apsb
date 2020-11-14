
CREATE PROCEDURE UPD_ProfissionalEndereco    
(    
   @UserName       VARCHAR(20),     
   @IdEndereco     INT          = NULL,     
   @ccEndereco     VARCHAR(MAX),     
   @ccBairro       VARCHAR(30),     
   @cvCEP          INT,     
   @ccUF           VARCHAR(2),     
   @ccCidade       VARCHAR(50),     
   @idProfissional INT    
)    
AS    
  BEGIN    
 DECLARE @Result BIT = 0;    
 BEGIN TRY    
   IF @IdEndereco IS NULL OR @IdEndereco = 0   
  BEGIN    
    PRINT 'INSERT';    
    
    INSERT INTO tbEndereco    
    ( ccEndereco,     
   ccBairro,     
   cvCEP,     
   ccUF,     
   ccCidade,     
   idProfissional    
    )    
    VALUES    
    (@ccEndereco, @ccBairro, @cvCEP, @ccUF, @ccCidade, @idProfissional);    
    
    SET @Result = 1;    
    
   END;    
  ELSE    
  BEGIN    
    PRINT 'UPDATE';    
    UPDATE tbEndereco    
    SET        
     ccEndereco = @ccEndereco,     
     ccBairro = @ccBairro,     
     cvCEP = @cvCEP,     
     ccUF = @ccUF,     
     ccCidade = @ccCidade    
     WHERE IdEndereco=@IdEndereco;    
    
    SET @Result = 1;    
   END;    
 END TRY    
 BEGIN CATCH    
   INSERT INTO tbLogErro    
   SELECT ERROR_NUMBER() AS    ErrorNumber,     
    ERROR_SEVERITY() AS  ErrorSeverity,     
    ERROR_STATE() AS     ErrorState,     
    ERROR_PROCEDURE() AS ErrorProcedure,     
    ERROR_LINE() AS      ErrorLine,     
    ERROR_MESSAGE() AS   ErrorMessage,     
    GETDATE() AS         Data,     
    @UserName AS         ccCriadoPor;    
 END CATCH;    
    
 SELECT @Result;    
  END;