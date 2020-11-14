CREATE TABLE [dbo].[tbDespesaTipo] (
    [idTipo]        INT           IDENTITY (1, 1) NOT NULL,
    [ccTipo]        VARCHAR (50)  NOT NULL,
    [cdDataCriacao] DATETIME      DEFAULT (getdate()) NULL,
    [idCategoria]   INT           NULL,
    [cbStatus]      BIT           DEFAULT ((1)) NULL,
    [ccUsuario]     VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([idTipo] ASC),
    FOREIGN KEY ([idCategoria]) REFERENCES [dbo].[tbDespesasCategoria] ([idCategoria]),
    CONSTRAINT [FK_UNIQ_ccTipo] UNIQUE NONCLUSTERED ([ccTipo] ASC)
);





