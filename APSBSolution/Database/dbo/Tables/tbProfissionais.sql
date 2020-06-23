﻿CREATE TABLE [dbo].[tbProfissionais] (
    [IdProfissional]   INT           IDENTITY (1, 1) NOT NULL,
    [ccNome]           VARCHAR (100) NOT NULL,
    [ccSexo]           CHAR (1)      NULL,
    [ccNaturalUF]      CHAR (2)      NULL,
    [ccNaturalCidade]  VARCHAR (50)  NULL,
    [ccEstadoCivil]    CHAR (1)      NULL,
    [ccEmail]          VARCHAR (100) NULL,
    [cvStatus]         SMALLINT      DEFAULT ((1)) NOT NULL,
    [ccCriadoPor]      VARCHAR (20)  NULL,
    [cdDataCriacao]    DATETIME      DEFAULT (getdate()) NULL,
    [ccAlteradoPor]    VARCHAR (20)  NULL,
    [cdDataAlteracao]  DATETIME      NULL,
    [IdObservacao]     INT           NULL,
    [RGNum]            VARCHAR (20)  NULL,
    [RGEmissor]        VARCHAR (5)   NULL,
    [RGdtEmissao]      DATETIME      NULL,
    [CPFNum]           VARCHAR (15)  NULL,
    [cvTelefone]       BIGINT        NULL,
    [cvCelular]        BIGINT        NULL,
    [nomePai]          VARCHAR (MAX) NULL,
    [nomeMae]          VARCHAR (MAX) NULL,
    [nomeConjuge]      VARCHAR (MAX) NULL,
    [cdDataNascimento] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([IdProfissional] ASC),
    FOREIGN KEY ([IdObservacao]) REFERENCES [dbo].[tbObservacoes] ([IdObservacao])
);






