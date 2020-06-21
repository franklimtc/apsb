CREATE PROCEDURE UPD_ProfissionaisDados(
 @IdDadoProfissional	int = NULL
, @idProfissional	int
, @ccFormacao	varchar(100)
, @ccPosGraduacao	varchar(100)
, @ccEspecialidade	varchar(50)
, @ccConselho	varchar(20)
, @cvNumInscricao	bigint
, @cvTitulo	bigint
, @cvTituloZona	smallint
, @cvTituloSecao	smallint
, @cvReservista	bigint
, @cvPIS	bigint
, @UserName VARCHAR(20))
AS BEGIN
	DECLARE  @Result BIT = 0; 
	BEGIN TRY
		IF @IdDadoProfissional IS NULL OR @IdDadoProfissional = ''
		BEGIN
			PRINT 'INSERT'
			INSERT INTO tbProfissionaisDados(idProfissional, ccFormacao, ccPosGraduacao, ccEspecialidade
			, ccConselho, cvNumInscricao, cvTitulo, cvTituloZona, cvTituloSecao, cvReservista, cvPIS)
			VALUES
			(@idProfissional, @ccFormacao, @ccPosGraduacao, @ccEspecialidade, @ccConselho
			, @cvNumInscricao, @cvTitulo, @cvTituloZona, @cvTituloSecao, @cvReservista, @cvPIS)
			SET @Result = 1;

		END
		ELSE
		BEGIN
			PRINT 'UPDATE'
			UPDATE tbProfissionaisDados
			SET idProfissional=@idProfissional,
			ccFormacao=@ccFormacao,
			ccPosGraduacao=@ccPosGraduacao,
			ccEspecialidade=@ccEspecialidade,
			ccConselho=@ccConselho,
			cvNumInscricao=@cvNumInscricao,
			cvTitulo=@cvTitulo,
			cvTituloZona=@cvTituloZona,
			cvTituloSecao=@cvTituloSecao,
			cvReservista=@cvReservista,
			cvPIS=@cvPIS WHERE IdDadoProfissional= @IdDadoProfissional;
			SET @Result = 1;
		END
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