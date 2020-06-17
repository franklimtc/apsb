CREATE TABLE [dbo].[tbClinicas] (
    [IdClinica]          INT           IDENTITY (1, 1) NOT NULL,
    [ccApelido]          VARCHAR (100) NULL,
    [ccRazaoSocial]      VARCHAR (MAX) NULL,
    [ccNomeFantasia]     VARCHAR (100) NULL,
    [ccEmail]            VARCHAR (100) NULL,
    [cvISS]              REAL          NULL,
    [cvDescontos]        REAL          NULL,
    [cbDescontoVariavel] BIT           NULL,
    [idObservacao]       INT           NULL,
    [idBanco]            INT           NULL,
    [cvPgtoDias]         SMALLINT      NULL,
    [cvStatus]           SMALLINT      DEFAULT ((1)) NOT NULL,
    [ccCriadoPor]        VARCHAR (20)  NULL,
    [cdDataCriacao]      DATETIME      DEFAULT (getdate()) NULL,
    [ccAlteradoPor]      VARCHAR (20)  NULL,
    [cdDataAlteracao]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([IdClinica] ASC),
    FOREIGN KEY ([idBanco]) REFERENCES [dbo].[tbBancos] ([IdBanco]),
    FOREIGN KEY ([idObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao]),
    UNIQUE NONCLUSTERED ([ccApelido] ASC)
);




