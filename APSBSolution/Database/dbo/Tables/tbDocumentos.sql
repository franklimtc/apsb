CREATE TABLE [dbo].[tbDocumentos] (
    [IdDocumento]    INT           IDENTITY (1, 1) NOT NULL,
    [cvNumero]       VARCHAR (MAX) NOT NULL,
    [ccTipo]         VARCHAR (4)   NOT NULL,
    [ccOrgaoEmissor] VARCHAR (20)  NULL,
    [cdDataEmissao]  DATETIME      NULL,
    [cdDataCriacao]  DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdDocumento] ASC)
);


