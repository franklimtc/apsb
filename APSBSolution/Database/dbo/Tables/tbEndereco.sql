CREATE TABLE [dbo].[tbEndereco] (
    [IdEndereco]     INT           IDENTITY (1, 1) NOT NULL,
    [ccEndereco]     VARCHAR (MAX) NOT NULL,
    [ccBairro]       VARCHAR (30)  NULL,
    [cvCEP]          INT           NULL,
    [ccUF]           VARCHAR (2)   NULL,
    [ccCidade]       VARCHAR (50)  NULL,
    [idProfissional] INT           NOT NULL,
    [cdDataCriacao]  DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdEndereco] ASC),
    FOREIGN KEY ([idProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional])
);


