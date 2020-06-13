CREATE TABLE [dbo].[tbEndereco]
(
	[IdEndereco] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, ccEndereco VARCHAR(MAX) NOT NULL
	, ccBairro VARCHAR(30)
	, cvCEP INT
	, ccUF VARCHAR(2)
	, ccCidade VARCHAR(50)
	, idProfissional INT NOT NULL REFERENCES tbProfissionais(idProfissional)
)
