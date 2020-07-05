CREATE TABLE [dbo].[tbProfissionalRepasse] (
    [idRepasse]      INT          IDENTITY (1, 1) NOT NULL,
    [idReceita]      INT          NOT NULL,
    [IdProfissional] INT          NOT NULL,
    [IdObservacao]   INT          NULL,
    [cvValor]        REAL         NOT NULL,
    [ccStatus]       CHAR (1)     DEFAULT ('A') NULL,
    [dataRepasse]    DATETIME     DEFAULT (getdate()) NULL,
    [ccCriadoPor]    VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([idRepasse] ASC),
    CONSTRAINT [CH_STATUS] CHECK ([ccStatus]='A' OR [ccStatus]='R' OR [ccStatus]='C'),
    FOREIGN KEY ([IdObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao]),
    FOREIGN KEY ([IdProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional]),
    FOREIGN KEY ([idReceita]) REFERENCES [dbo].[tbReceitas] ([idReceita])
);

