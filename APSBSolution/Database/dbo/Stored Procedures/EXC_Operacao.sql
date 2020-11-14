CREATE PROCEDURE EXC_Operacao
(@UserName   VARCHAR(MAX), 
 @idOperacao INT, 
 @tipo       VARCHAR(20)
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @Result BIT= 0;
	   BEGIN TRY
		  IF @tipo = 'Despesa'
			 BEGIN
				UPDATE tbDespesas
				  SET  
					 cbStatus = 0, cbArquivado = 1
				WHERE  idDespesas = @idOperacao;
			 END;
			 ELSE
			 IF @tipo = 'Receita'
				BEGIN
				    UPDATE tbReceitas
					 SET  
						cbStatus = 0, cbArquivado = 1
				    WHERE  idReceita = @idOperacao;
				END;
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