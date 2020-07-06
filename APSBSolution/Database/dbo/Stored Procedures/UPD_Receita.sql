CREATE PROCEDURE UPD_Receita        
(        
 @UserName VARCHAR(MAX)   
 , @idReceita int  
 , @IdClinica int        
 , @cvValor float        
 , @cvValorPago float        
 , @cdEmissao datetime        
 , @cdPagamento datetime        
 , @cdRepasse datetime        
 , @cvDesconto real        
 , @observacoes VARCHAR(MAX)        
 , @cvNF int        
)         
AS BEGIN        
	SET NOCOUNT ON          
	DECLARE @idObservacao INT =  NULL, @Result BIT = 0;          
	IF ISNULL(@observacoes,'') <> ''          
	BEGIN          
		INSERT INTO tbObservacoes(observacao) VALUES(@observacoes);          
		SELECT @idObservacao = SCOPE_IDENTITY() ;          
	END 
  
	IF( @cvDesconto IS NULL )
	BEGIN
		SET @cvDesconto =(1-(ISNULL(@cvValorPago,0)/ISNULL(@cvValor,1)))*100; 
	END
	ELSE
	BEGIN
		SET @cvValorPago = @cvValor-(@cvValor*@cvDesconto/100)
	END
       
  
  BEGIN TRY            
	UPDATE tbReceitas SET  
	IdClinica = @IdClinica  
	, cvValor = @cvValor  
	, cvValorPago = @cvValorPago  
	, cdEmissao = @cdEmissao  
	, cdPagamento = @cdPagamento  
	, cdRepasse = @cdRepasse  
	, cvDesconto = @cvDesconto  
	, idObservacao = @idObservacao  
	, cvNF = @cvNF  
	WHERE idReceita = @idReceita;        
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