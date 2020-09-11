CREATE TABLE [dbo].[tbLogErro] (
    [ErrorNumber]    INT             NULL,
    [ErrorSeverity]  INT             NULL,
    [ErrorState]     INT             NULL,
    [ErrorProcedure] NVARCHAR (128)  NULL,
    [ErrorLine]      INT             NULL,
    [ErrorMessage]   NVARCHAR (4000) NULL,
    [Data]           DATETIME        DEFAULT (getdate()) NULL,
    [ccCriadoPor]    VARCHAR (20)    NULL,
    [idErro]         INT             IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([idErro] ASC)
);





