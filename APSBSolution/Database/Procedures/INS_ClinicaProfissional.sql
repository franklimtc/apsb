CREATE PROCEDURE INS_ClinicaProfissional    
(    
	@UserName VARCHAR(MAX) = NULL , @idClinica INT, @idProfissional INT, @cvTaxaProfissional DECIMAL(10,2), @observacoes VARCHAR(MAX) = NULL
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
	INSERT INTO tbClinicaProfissional(idClinica, idProfissional, cvTaxaProfissional, idObservacao)
	VALUES(@idClinica, @idProfissional, @cvTaxaProfissional, @idObservacao);
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