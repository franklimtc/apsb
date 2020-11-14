CREATE TABLE [dbo].[tbEspecialidade] (
    [idEspecialidade] INT          IDENTITY (1, 1) NOT NULL,
    [Especialidade]   VARCHAR (30) NULL,
    [cdDataCriacao]   DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([idEspecialidade] ASC)
);



