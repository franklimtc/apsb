CREATE TABLE [dbo].[tbBancos] (
    [IdBanco]       INT           IDENTITY (1, 1) NOT NULL,
    [ccBanco]       VARCHAR (100) NOT NULL,
    [cvCodBanco]    SMALLINT      NOT NULL,
    [cvStatus]      SMALLINT      DEFAULT ((1)) NOT NULL,
    [cdDataCriacao] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdBanco] ASC)
);


