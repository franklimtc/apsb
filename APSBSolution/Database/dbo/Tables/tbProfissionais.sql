CREATE TABLE [dbo].[tbProfissionais] (
    [IdProfissional]  INT           IDENTITY (1, 1) NOT NULL,
    [ccNome]          VARCHAR (100) NOT NULL,
    [ccSexo]          CHAR (1)      NULL,
    [ccNaturalUF]     CHAR (2)      NULL,
    [ccNaturalCidade] VARCHAR (50)  NULL,
    [ccEstadoCivil]   CHAR (1)      NULL,
    [ccEmail]         VARCHAR (100) NULL,
    [idTelefone]      INT           NULL,
    [idDocumento]     INT           NULL,
    [idParente]       INT           NULL,
    [cvStatus]        SMALLINT      DEFAULT ((1)) NOT NULL,
    [ccCriadoPor]     VARCHAR (20)  NULL,
    [cdDataCriacao]   DATETIME      DEFAULT (getdate()) NULL,
    [ccAlteradoPor]   VARCHAR (20)  NULL,
    [cdDataAlteracao] DATETIME      NULL,
    [IdObservacao]    INT           NULL,
    PRIMARY KEY CLUSTERED ([IdProfissional] ASC),
    FOREIGN KEY ([idDocumento]) REFERENCES [dbo].[tbDocumentos] ([IdDocumento]),
    FOREIGN KEY ([IdObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao]),
    FOREIGN KEY ([idParente]) REFERENCES [dbo].[tbParentes] ([IdParente]),
    FOREIGN KEY ([idTelefone]) REFERENCES [dbo].[tbTelefones] ([IdTelefone])
);


