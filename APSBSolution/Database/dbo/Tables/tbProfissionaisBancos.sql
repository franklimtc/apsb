CREATE TABLE [dbo].[tbProfissionaisBancos]
(
	[IdProfissionalBanco] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, ccAgencia VARCHAR(10) NOT NULL
	, ccConta VARCHAR(20) NOT NULL
	, ccOperacao VARCHAR(5) 
	, idProfissional INT NOT NULL REFERENCES tbProfissionais(idProfissional)
	, idBanco INT NOT NULL REFERENCES tbBancos(idBanco)
)
