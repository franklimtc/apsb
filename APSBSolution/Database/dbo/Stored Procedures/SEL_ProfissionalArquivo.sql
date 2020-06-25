CREATE PROCEDURE SEL_ProfissionalArquivo
(
	@idProfissional INT
)
AS BEGIN

	SELECT idArquivo, ccNomeArquivo, cdDataCriacao 
	FROM tbProfissionalArquivo
	WHERE idProfissional = @idProfissional

END