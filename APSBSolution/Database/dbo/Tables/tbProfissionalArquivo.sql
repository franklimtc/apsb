CREATE TABLE [dbo].[tbProfissionalArquivo] (
    [idArquivo]      INT             IDENTITY (1, 1) NOT NULL,
    [idProfissional] INT             NOT NULL,
    [ccNomeArquivo]  VARCHAR (50)    NOT NULL,
    [binaryFile]     VARBINARY (MAX) NOT NULL,
    [cdDataCriacao]  DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([idArquivo] ASC),
    FOREIGN KEY ([idProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional])
);

