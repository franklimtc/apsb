CREATE TABLE [dbo].[tbObservacoes] (
    [IdObservacao]  INT            IDENTITY (1, 1) NOT NULL,
    [observacao]    NVARCHAR (MAX) NULL,
    [cdDataCriacao] DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdObservacao] ASC)
);


