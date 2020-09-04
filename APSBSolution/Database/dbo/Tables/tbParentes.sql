CREATE TABLE [dbo].[tbParentes] (
    [IdParente]     INT           IDENTITY (1, 1) NOT NULL,
    [ccNome]        VARCHAR (100) NOT NULL,
    [ccTipoRelacao] CHAR (1)      NOT NULL,
    [cdDataCriacao] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdParente] ASC)
);


