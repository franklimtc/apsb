CREATE PROCEDURE UPD_ProfissionaisDados
(@IdDadoProfissional INT          = NULL, 
 @idProfissional     INT, 
 @ccFormacao         VARCHAR(100), 
 @ccPosGraduacao     VARCHAR(100), 
 @ccEspecialidade    VARCHAR(50), 
 @ccConselho         VARCHAR(20), 
 @cvNumInscricao     BIGINT, 
 @cvTitulo           BIGINT, 
 @cvTituloZona       SMALLINT, 
 @cvTituloSecao      SMALLINT, 
 @cvReservista       BIGINT, 
 @cvPIS              BIGINT, 
 @UserName           VARCHAR(20)
)
AS
    BEGIN
	   DECLARE @qtdFormacao INT;
	   SELECT @qtdFormacao = COUNT(*)
	   FROM   tbFormacao
	   WHERE  ccFormacao = @ccFormacao;
	   IF @qtdFormacao = 0
		  BEGIN
			 INSERT INTO           tbFormacao(ccFormacao)
		  VALUES                (@ccFormacao);
		  END;
	   DECLARE @Result BIT= 0;
	   BEGIN TRY
		  IF @IdDadoProfissional IS NULL
			OR @IdDadoProfissional = ''
			 BEGIN
				PRINT 'INSERT';
				INSERT INTO tbProfissionaisDados
				(idProfissional, 
				 ccFormacao, 
				 ccPosGraduacao, 
				 ccEspecialidade, 
				 ccConselho, 
				 cvNumInscricao, 
				 cvTitulo, 
				 cvTituloZona, 
				 cvTituloSecao, 
				 cvReservista, 
				 cvPIS
				)
				VALUES
				(@idProfissional, 
				 @ccFormacao, 
				 @ccPosGraduacao, 
				 @ccEspecialidade, 
				 @ccConselho, 
				 @cvNumInscricao, 
				 @cvTitulo, 
				 @cvTituloZona, 
				 @cvTituloSecao, 
				 @cvReservista, 
				 @cvPIS
				);
				SET @Result = 1;
			 END;
			 ELSE
			 BEGIN
				PRINT 'UPDATE';
				UPDATE tbProfissionaisDados
				  SET  
					 idProfissional = @idProfissional, 
					 ccFormacao = @ccFormacao, 
					 ccPosGraduacao = @ccPosGraduacao, 
					 ccEspecialidade = @ccEspecialidade, 
					 ccConselho = @ccConselho, 
					 cvNumInscricao = @cvNumInscricao, 
					 cvTitulo = @cvTitulo, 
					 cvTituloZona = @cvTituloZona, 
					 cvTituloSecao = @cvTituloSecao, 
					 cvReservista = @cvReservista, 
					 cvPIS = @cvPIS
				WHERE  IdDadoProfissional = @IdDadoProfissional;
				SET @Result = 1;
			 END;
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