

CREATE PROCEDURE EXC_ProfissionalBanco
(
   @UserName            VARCHAR(20), 
   @IdProfissionalBanco INT
)
AS
  BEGIN

	SET NOCOUNT ON;

	DECLARE @Result BIT = 0;
	BEGIN TRY
	  UPDATE tbProfissionaisBancos
	  SET    
		  cvStatus = 0
	   WHERE IdProfissionalBanco=@IdProfissionalBanco;
	  SET @Result = 1;
	END TRY
	BEGIN CATCH
	  INSERT INTO tbLogErro
	  SELECT ERROR_NUMBER() AS    ErrorNumber, 
			 ERROR_SEVERITY() AS  ErrorSeverity, 
			 ERROR_STATE() AS     ErrorState, 
			 ERROR_PROCEDURE() AS ErrorProcedure, 
			 ERROR_LINE() AS      ErrorLine, 
			 ERROR_MESSAGE() AS   ErrorMessage, 
			 GETDATE() AS         Data, 
			 @UserName AS         ccCriadoPor;
	END CATCH;

	SELECT @Result;
  END;