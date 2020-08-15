CREATE PROCEDURE EXC_ProfissionalAuto
(@UserName VARCHAR(30), 
 @Token    VARCHAR(100)
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @Result BIT= 0;
	   BEGIN TRY
		  ALTER TABLE tbClinicaProfissional NOCHECK CONSTRAINT ALL;
		  ALTER TABLE tbEndereco NOCHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionaisBancos NOCHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionaisDados NOCHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionalArquivo NOCHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionalRepasse NOCHECK CONSTRAINT ALL;
		  DELETE tbProfissionais WHERE  DBO.FN_TokenAuto(IdProfissional, cdDataCriacao) = @Token;
		  ALTER TABLE tbClinicaProfissional CHECK CONSTRAINT ALL;
		  ALTER TABLE tbEndereco CHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionaisBancos CHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionaisDados CHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionalArquivo CHECK CONSTRAINT ALL;
		  ALTER TABLE tbProfissionalRepasse CHECK CONSTRAINT ALL;
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