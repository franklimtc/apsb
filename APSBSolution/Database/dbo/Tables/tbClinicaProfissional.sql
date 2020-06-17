CREATE TABLE [dbo].[tbClinicaProfissional] (
    [IdClinicaProfissional] INT             IDENTITY (1, 1) NOT NULL,
    [idClinica]             INT             NOT NULL,
    [idProfissional]        INT             NOT NULL,
    [cvTaxaProfissional]    DECIMAL (10, 2) DEFAULT ((0.1)) NOT NULL,
    [idObservacao]          INT             NULL,
    [cvStatus]              SMALLINT        DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([IdClinicaProfissional] ASC),
    FOREIGN KEY ([idClinica]) REFERENCES [dbo].[tbClinicas] ([IdClinica]),
    FOREIGN KEY ([idObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao]),
    FOREIGN KEY ([idProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional])
);


