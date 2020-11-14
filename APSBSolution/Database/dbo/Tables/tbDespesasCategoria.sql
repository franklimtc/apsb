CREATE TABLE [dbo].[tbDespesasCategoria] (
    [idCategoria] INT           IDENTITY (1, 1) NOT NULL,
    [ccCategoria] VARCHAR (100) NULL,
    [cdCriacao]   DATETIME      DEFAULT (getdate()) NULL,
    [ccUsuario]   VARCHAR (100) NULL,
    [cbStatus]    BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([idCategoria] ASC),
    CONSTRAINT [FK_UNIQ_ccCategoria] UNIQUE NONCLUSTERED ([ccCategoria] ASC)
);

