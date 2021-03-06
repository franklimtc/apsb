CREATE PROCEDURE INS_ClinicaProfissional          
(          
 @UserName VARCHAR(MAX) = NULL , @idClinica INT, @idProfissional INT, @cvTaxaProfissional DECIMAL(10,2), @observacoes VARCHAR(MAX) = NULL      
)          
AS BEGIN          
 SET NOCOUNT ON          
 DECLARE @idObservacao INT =  NULL, @Result BIT = 0, @IdClinicaProfissional INT;          
 IF ISNULL(@observacoes,'') <> ''          
 BEGIN          
  INSERT INTO tbObservacoes(observacao) VALUES(@observacoes);          
  SELECT @idObservacao = SCOPE_IDENTITY() ;          
 END      
     
 SELECT @IdClinicaProfissional = ISNULL(IdClinicaProfissional,0) FROM tbClinicaProfissional WHERE idClinica = @idClinica AND idProfissional = @idProfissional;    
          
 BEGIN TRY       
 IF ISNULL(@IdClinicaProfissional,0) = 0     
 BEGIN    
  INSERT INTO tbClinicaProfissional(idClinica, idProfissional, cvTaxaProfissional, idObservacao)      
  VALUES(@idClinica, @idProfissional, @cvTaxaProfissional, @idObservacao);   
  PRINT CONCAT (@IdClinicaProfissional,' - INSERT')  
 END    
 ELSE    
 BEGIN    
  UPDATE tbClinicaProfissional SET cvStatus = 1, cvTaxaProfissional = @cvTaxaProfissional, idObservacao = @idObservacao  WHERE IdClinicaProfissional = @IdClinicaProfissional;    
  PRINT CONCAT (@IdClinicaProfissional,' - UPDATE')  
 END    
    
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