
CREATE PROCEDURE INS_Repasse
(
	@idReceita INT
	, @IdProfissional INT
	, @cvValor FLOAT(2)
	, @observacoes VARCHAR(MAX)
	, @UserName VARCHAR(20)
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
	INSERT INTO tbProfissionalRepasse(idReceita, IdProfissional, cvValor, ccCriadoPor)
	VALUES(@idReceita, @IdProfissional, @cvValor, @UserName)
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