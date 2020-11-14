CREATE PROCEDURE EXC_ProfissionalAuto
(@UserName VARCHAR(30), 
 @Token    VARCHAR(100)
)
AS
    BEGIN
	   SET NOCOUNT ON;
	   DECLARE @Result BIT= 0;
	   DECLARE @idProfissional INT= 0;
	   SELECT @idProfissional = idProfissional
	   FROM   tbProfissionais
	   WHERE  DBO.FN_TokenAuto(IdProfissional, cdDataCriacao) = @Token;
	   BEGIN TRY
		  IF @idProfissional IS NOT NULL
			 BEGIN
				ALTER TABLE tbClinicaProfissional NOCHECK CONSTRAINT ALL;
				ALTER TABLE tbEndereco NOCHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionaisBancos NOCHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionaisDados NOCHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionalArquivo NOCHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionalRepasse NOCHECK CONSTRAINT ALL;
				DELETE tbProfissionais
				WHERE  IdProfissional = @idProfissional;
				DELETE tbClinicaProfissional
				WHERE  idProfissional = @idProfissional;
				DELETE tbEndereco
				WHERE  idProfissional = @idProfissional;
				DELETE tbProfissionaisBancos
				WHERE  idProfissional = @idProfissional;
				DELETE tbProfissionaisDados
				WHERE  idProfissional = @idProfissional;
				DELETE tbProfissionalArquivo
				WHERE  idProfissional = @idProfissional;
				DELETE tbProfissionalRepasse
				WHERE  idProfissional = @idProfissional;
				ALTER TABLE tbClinicaProfissional CHECK CONSTRAINT ALL;
				ALTER TABLE tbEndereco CHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionaisBancos CHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionaisDados CHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionalArquivo CHECK CONSTRAINT ALL;
				ALTER TABLE tbProfissionalRepasse CHECK CONSTRAINT ALL;
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