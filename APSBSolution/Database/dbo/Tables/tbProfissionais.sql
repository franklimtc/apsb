CREATE TABLE [dbo].[tbProfissionais]
(
	[IdProfissional] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, ccNome VARCHAR(100) NOT NULL
	, ccSexo CHAR(1)
	, ccNaturalUF CHAR(2)
	, ccNaturalCidade VARCHAR(50)
	, ccEstadoCivil CHAR(1)
	, ccEmail VARCHAR(100)
	, idTelefone INT REFERENCES tbTelefones(idTelefone)
	, idDocumento INT REFERENCES tbDocumentos(idDocumento)
	, idParente INT REFERENCES tbParentes(idParente)
	, cvStatus SMALLINT NOT NULL DEFAULT (1)
	, [ccCriadoPor]        VARCHAR (20)    NULL
    , [cdDataCriacao] DATETIME DEFAULT GETDATE()
    , [ccAlteradoPor]        VARCHAR (20)    NULL
    , [cdDataAlteracao] DATETIME
)
