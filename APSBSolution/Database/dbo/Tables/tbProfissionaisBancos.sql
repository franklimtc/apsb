CREATE TABLE [dbo].[tbProfissionaisBancos] (
    [IdProfissionalBanco] INT          IDENTITY (1, 1) NOT NULL,
    [ccAgencia]           VARCHAR (10) NOT NULL,
    [ccConta]             VARCHAR (20) NOT NULL,
    [ccOperacao]          VARCHAR (5)  NULL,
    [idProfissional]      INT          NOT NULL,
    [idBanco]             INT          NOT NULL,
    [cvStatus]            BIT          DEFAULT ((1)) NULL,
    [cdDataCriacao]       DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdProfissionalBanco] ASC),
    FOREIGN KEY ([idBanco]) REFERENCES [dbo].[tbBancos] ([IdBanco]),
    FOREIGN KEY ([idProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional])
);







GO
CREATE NONCLUSTERED INDEX [IX_Status_ProfissionalBanco]
    ON [dbo].[tbProfissionaisBancos]([cvStatus] ASC, [idProfissional] ASC);

