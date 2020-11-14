CREATE PROCEDURE UPD_ProfissionalBanco  
(  
   @UserName            VARCHAR(20),   
   @IdProfissionalBanco INT,   
   @ccAgencia           VARCHAR(10),   
   @ccConta             VARCHAR(20),   
   @ccOperacao          VARCHAR(5),   
   @idProfissional      INT,   
   @idBanco             INT  
)  
AS  
  BEGIN  
 DECLARE @Result BIT = 0;  
 BEGIN TRY  
   IF @IdProfissionalBanco IS NULL OR @IdProfissionalBanco = 0   
  BEGIN  
    PRINT 'INSERT';  
    INSERT INTO tbProfissionaisBancos  
    ( ccAgencia,   
   ccConta,   
   ccOperacao,   
   idProfissional,   
   idBanco  
    )  
    VALUES  
    (@ccAgencia, @ccConta, @ccOperacao, @idProfissional, @idBanco);  
  
    SET @Result = 1;  
  
   END;  
  ELSE  
  BEGIN  
    PRINT 'UPDATE';  
    UPDATE tbProfissionaisBancos  
    SET      
     ccAgencia = @ccAgencia,   
     ccConta = @ccConta,   
     ccOperacao = @ccOperacao,   
     idProfissional = @idProfissional,   
     idBanco = @idBanco  
     WHERE IdProfissionalBanco=@IdProfissionalBanco;  
  
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