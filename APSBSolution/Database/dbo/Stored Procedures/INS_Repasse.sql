CREATE PROCEDURE INS_Repasse    
(    
	@idReceita INT    
	, @IdProfissional INT    
	, @cvValor FLOAT(2)    
	, @observacoes VARCHAR(MAX)    
	, @UserName VARCHAR(20) 
	, @dataRepasse DATETIME
)    
AS BEGIN        
	SET NOCOUNT ON        
	DECLARE @idObservacao INT =  NULL, @Result BIT = 0, @cvTaxa FLOAT(2);    
   
	IF ISNULL(@observacoes,'') <> ''        
	BEGIN        
		INSERT INTO tbObservacoes(observacao) VALUES(@observacoes);        
		SELECT @idObservacao = SCOPE_IDENTITY() ;        
	END    
   
		SELECT @cvTaxa = a.cvTaxaProfissional  
		FROM tbClinicaProfissional a  
		INNER JOIN tbReceitas b ON A.idClinica = b.IdClinica AND b.idReceita = @idReceita  
		WHERE a.idProfissional = @IdProfissional;  
        
	BEGIN TRY          
		INSERT INTO tbProfissionalRepasse(idReceita, IdProfissional, cvValor, ccCriadoPor, cvTaxaProfissional, dataRepasse)    
		VALUES(@idReceita, @IdProfissional, @cvValor, @UserName, @cvTaxa, @dataRepasse)    
		SET @Result = 1;        
		END TRY        
	BEGIN CATCH  
		IF ERROR_NUMBER() = 2627  
		BEGIN  
		UPDATE tbProfissionalRepasse SET cvValor = @cvValor, IdObservacao = @idObservacao, ccStatus = 'A'  
		WHERE idReceita = @idReceita AND IdProfissional = @IdProfissional  
		SET @Result = 1;    
	END  
	ELSE  
		BEGIN   
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
	END  
	END CATCH        
         
	SELECT @Result;        
END