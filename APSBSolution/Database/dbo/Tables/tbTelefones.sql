CREATE TABLE [dbo].[tbTelefones] (
    [IdTelefone]    INT      IDENTITY (1, 1) NOT NULL,
    [cvTelefone]    INT      NOT NULL,
    [ccTipo]        CHAR (1) NULL,
    [cdDataCriacao] DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdTelefone] ASC)
);


