CREATE TABLE [dbo].[tbDespesaTipo] (
    [idTipo]        INT          IDENTITY (1, 1) NOT NULL,
    [ccTipo]        VARCHAR (50) NOT NULL,
    [cdDataCriacao] DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([idTipo] ASC)
);



