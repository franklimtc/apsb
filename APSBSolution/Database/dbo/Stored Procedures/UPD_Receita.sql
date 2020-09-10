CREATE PROCEDURE UPD_Receita
(@UserName    VARCHAR(MAX), 
 @idReceita   INT, 
 @IdClinica   INT, 
 @cvValor     FLOAT, 
 @cvValorPago FLOAT, 
 @cdEmissao   DATETIME, 
 @cdPagamento DATETIME, 
 @cdRepasse   DATETIME, 
 @cvDesconto  REAL, 
 @observacoes VARCHAR(MAX), 
 @cvNF        INT, 
 @cbIssRetido BIT
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @idObservacao INT= NULL, @Result BIT= 0, @cvIss FLOAT(2)= 0;
	   IF ISNULL(@observacoes, '') <> ''
		  BEGIN
			 INSERT INTO              tbObservacoes(observacao)
		  VALUES                   (@observacoes);
			 SELECT @idObservacao = SCOPE_IDENTITY();
		  END;
	   IF @cbIssRetido = 1
		  SELECT @cvIss = c.cvISS
		  FROM   tbClinicas c
		  WHERE  c.IdClinica = @IdClinica;
	   IF(@cvDesconto IS NULL)
		  BEGIN      
			 --SET @cvDesconto =(1-(ISNULL(@cvValorPago,0)/ISNULL(@cvValor,1)))*100;       
			 SET @cvDesconto = (@cvValor - (@cvValor * @cvIss / 100) - @cvValorPago) / @cvValor * 100;
		  END;
		  ELSE
		  BEGIN
			 IF @cvValorPago IS NULL
				BEGIN
				    SET @cvValorPago = @cvValor - ((@cvValor * @cvDesconto / 100) + (@cvValor * @cvIss / 100));
				END;
		  END;
	   BEGIN TRY
		  UPDATE tbReceitas
		    SET  
			   IdClinica = @IdClinica, 
			   cvValor = @cvValor, 
			   cvValorPago = @cvValorPago, 
			   cdEmissao = @cdEmissao, 
			   cdPagamento = @cdPagamento, 
			   cdRepasse = @cdRepasse, 
			   cvDesconto = @cvDesconto, 
			   idObservacao = @idObservacao, 
			   cvNF = @cvNF, 
			   cbIssRetido = @cbIssRetido
		  WHERE  idReceita = @idReceita;
		  SET @Result = 1;
	   END TRY
	   BEGIN CATCH
		  INSERT INTO tbLogErro
			    SELECT ERROR_NUMBER() AS ErrorNumber, 
					 ERROR_SEVERITY() AS ErrorSeverity, 
					 ERROR_STATE() AS ErrorState, 
					 ERROR_PROCEDURE() AS ErrorProcedure, 
					 ERROR_LINE() AS ErrorLine, 
					 ERROR_MESSAGE() AS ErrorMessage, 
					 GETDATE() AS Data, 
					 @UserName AS ccCriadoPor;
	   END CATCH;
	   SELECT @Result;
    END;