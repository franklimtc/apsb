CREATE PROCEDURE UPD_Clinica  
(  
 @UserName VARCHAR(MAX)  
 , @ccApelido VARCHAR(MAX)  
 , @ccRazaoSocial VARCHAR(MAX)  
 , @ccNomeFantasia VARCHAR(MAX)  
 , @ccEmail VARCHAR(MAX)  
 , @cvISS DECIMAL(10,2)  
 , @cvDescontos DECIMAL(10,2)  
 , @idBanco INT  
 , @cbDescontoVariavel DECIMAL(10,2)  
 , @observacoes VARCHAR(MAX)  
 , @idClinica INT  

)  
AS BEGIN  
 SET NOCOUNT ON  
 DECLARE @idObservacao INT =  NULL, @Result BIT = 0;  

 SELECT @idObservacao = ISNULL(idObservacao,0) FROM tbClinicas WHERE IdClinica = @idClinica; 

 IF @idObservacao > 0  
 BEGIN  
  UPDATE tbObservacoes SET observacao = @observacoes WHERE IdObservacao = @idObservacao;  
 END  
  
 BEGIN TRY  
 
  --INSERT INTO tbClinicas(ccApelido, ccRazaoSocial, ccNomeFantasia, ccEmail, cvISS, cvDescontos, cbDescontoVariavel, idObservacao, idBanco, ccCriadoPor)  
  --VALUES(@ccApelido, @ccRazaoSocial, @ccNomeFantasia, @ccEmail, @cvISS, @cvDescontos, @cbDescontoVariavel, @idObservacao, @idBanco, @UserName); 
  
  UPDATE tbClinicas SET ccApelido = @ccApelido, ccRazaoSocial = @ccRazaoSocial, ccNomeFantasia = @ccNomeFantasia, ccEmail = @ccEmail, cvISS = @cvISS
  , cvDescontos = @cvDescontos, cbDescontoVariavel = @cbDescontoVariavel, idBanco = @idBanco, ccAlteradoPor = @UserName, cdDataAlteracao = GETDATE()
  WHERE IdClinica = @idClinica;

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