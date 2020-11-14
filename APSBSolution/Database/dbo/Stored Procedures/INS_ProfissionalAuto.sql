
CREATE PROCEDURE INS_ProfissionalAuto    
(      
 @ccNome VARCHAR(100)      
 ,@ccEmail VARCHAR(100)   
 ,@UserName VARCHAR(30)  
)      
AS BEGIN        
 SET NOCOUNT ON        
 DECLARE @Result BIT = 0;  
 DECLARE @cpfTemp INT = NEXT VALUE FOR SQ_ProfissionalAuto ;
 
 BEGIN TRY          
  INSERT INTO tbProfissionais(ccNome, ccEmail, cvStatus, cbAutoCadastro, ccCriadoPor, CPFNum)       
  VALUES(@ccNome, @ccEmail, 0, 1, @UserName, @cpfTemp);      
        
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