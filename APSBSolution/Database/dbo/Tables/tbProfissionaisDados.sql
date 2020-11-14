CREATE TABLE [dbo].[tbProfissionaisDados] (
    [IdDadoProfissional] INT           IDENTITY (1, 1) NOT NULL,
    [idProfissional]     INT           NOT NULL,
    [ccFormacao]         VARCHAR (100) NOT NULL,
    [ccPosGraduacao]     VARCHAR (100) NULL,
    [ccEspecialidade]    VARCHAR (50)  NULL,
    [ccConselho]         VARCHAR (20)  NULL,
    [cvNumInscricao]     BIGINT        NULL,
    [cvTitulo]           BIGINT        NULL,
    [cvTituloZona]       SMALLINT      NULL,
    [cvTituloSecao]      SMALLINT      NULL,
    [cvReservista]       BIGINT        NULL,
    [cvPIS]              BIGINT        NULL,
    [cdDataCriacao]      DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([IdDadoProfissional] ASC),
    FOREIGN KEY ([idProfissional]) REFERENCES [dbo].[tbProfissionais] ([IdProfissional])
);




