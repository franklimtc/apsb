CREATE PROCEDURE INS_Despesa
(
	@idTipo INT
	, @cvValor FLOAT
	, @cdData DATETIME
	, @observacoes VARCHAR(MAX) = NULL
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
	INSERT INTO tbDespesas(idTipo, cvValor, cdData, IdObservacao)
	VALUES(@idTipo, @cvValor, @cdData, @idObservacao);
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