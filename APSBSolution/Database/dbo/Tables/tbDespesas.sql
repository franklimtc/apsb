CREATE TABLE [dbo].[tbDespesas] (
    [idDespesas]    INT        IDENTITY (1, 1) NOT NULL,
    [idTipo]        INT        NOT NULL,
    [cvValor]       FLOAT (53) NOT NULL,
    [cdData]        DATETIME   NULL,
    [cbArquivado]   BIT        DEFAULT ((0)) NULL,
    [cbStatus]      BIT        DEFAULT ((1)) NULL,
    [IdObservacao]  INT        NULL,
    [cdDataCriacao] DATETIME   DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([idDespesas] ASC),
    FOREIGN KEY ([IdObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao]),
    FOREIGN KEY ([idTipo]) REFERENCES [dbo].[tbDespesaTipo] ([idTipo])
);



