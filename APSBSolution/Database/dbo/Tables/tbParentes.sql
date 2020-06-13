CREATE TABLE [dbo].[tbParentes]
(
	[IdParente] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, ccNome VARCHAR(100) NOT NULL
	, ccTipoRelacao CHAR(1) NOT NULL
)
