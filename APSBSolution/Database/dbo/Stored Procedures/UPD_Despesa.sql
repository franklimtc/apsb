
CREATE PROCEDURE UPD_Despesa  
( 
	@idDespesa INT
	, @idTipo INT  
	, @cvValor FLOAT  
	, @cdData DATETIME  
	, @observacoes VARCHAR(MAX) = NULL  
	, @UserName VARCHAR(20)  
)     
AS BEGIN      
  SET NOCOUNT ON      
  DECLARE @idObservacao INT =  NULL, @Result BIT = 0;  
  SELECT @idObservacao = IdObservacao FROM tbDespesas where idDespesas = @idDespesa

  IF ISNULL(@observacoes,'') <> ''      
  BEGIN 
	IF @idObservacao IS NULL
	BEGIN
		INSERT INTO tbObservacoes(observacao) VALUES(@observacoes); 
		SELECT @idObservacao = SCOPE_IDENTITY() ;      
	END
	ELSE
	BEGIN
		UPDATE tbObservacoes SET observacao = @observacoes WHERE IdObservacao = @idObservacao;
	END
  END      
      
  BEGIN TRY        
	UPDATE tbDespesas SET idTipo = @idTipo, cvValor = @cvValor, cdData = @cdData, IdObservacao = @idObservacao WHERE idDespesas = @idDespesa;  
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