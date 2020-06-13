CREATE TABLE [dbo].[tbProfissionaisDados]
(
	[IdDadoProfissional] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, idProfissional INT NOT NULL REFERENCES tbProfissionais(idProfissional)
	, ccFormacao VARCHAR(100) NOT NULL
	, ccPosGraduacao VARCHAR(100)
	, idDocumento INT REFERENCES tbDocumentos(idDocumento)
)
