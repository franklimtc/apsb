CREATE TABLE [dbo].[tbReceitas] (
    [idReceita]     INT           IDENTITY (1, 1) NOT NULL,
    [IdClinica]     INT           NOT NULL,
    [cvValor]       FLOAT (53)    NOT NULL,
    [cvValorPago]   FLOAT (53)    NULL,
    [cdEmissao]     DATETIME      NULL,
    [cdPagamento]   DATETIME      NULL,
    [cdRepasse]     DATETIME      NULL,
    [cvDesconto]    REAL          NULL,
    [cbArquivado]   BIT           DEFAULT ((0)) NULL,
    [cbStatus]      BIT           DEFAULT ((1)) NULL,
    [idObservacao]  INT           NULL,
    [cvNF]          INT           NULL,
    [cbIssRetido]   BIT           DEFAULT ((0)) NULL,
    [cvDescontoISS] REAL          NULL,
    [cdDataCriacao] DATETIME      DEFAULT (getdate()) NULL,
    [UserName]      VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([idReceita] ASC),
    FOREIGN KEY ([IdClinica]) REFERENCES [dbo].[tbClinicas] ([IdClinica]),
    FOREIGN KEY ([idObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao])
);









