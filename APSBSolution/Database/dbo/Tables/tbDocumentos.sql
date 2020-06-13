CREATE TABLE [dbo].[tbDocumentos]
(
	[IdDocumento] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, cvNumero VARCHAR(MAX) NOT NULL
	, ccTipo VARCHAR(4) NOT NULL
	, ccOrgaoEmissor VARCHAR(20)
	, cdDataEmissao DATETIME
)
