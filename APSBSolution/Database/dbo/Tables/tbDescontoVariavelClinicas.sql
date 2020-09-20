CREATE TABLE [dbo].[tbDescontoVariavelClinicas] (
    [idDesconto]        INT           IDENTITY (1, 1) NOT NULL,
    [idClinica]         INT           NULL,
    [cvValorCorte]      MONEY         NOT NULL,
    [cvValorMenor]      FLOAT (53)    NOT NULL,
    [cvValorMaior]      FLOAT (53)    NOT NULL,
    [cbStatus]          BIT           DEFAULT ((1)) NULL,
    [cdDataAtivacao]    DATETIME      DEFAULT (getdate()) NULL,
    [cdDataDesativacao] DATETIME      NULL,
    [ccAlteradoPor]     VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([idDesconto] ASC),
    FOREIGN KEY ([idClinica]) REFERENCES [dbo].[tbClinicas] ([IdClinica])
);

