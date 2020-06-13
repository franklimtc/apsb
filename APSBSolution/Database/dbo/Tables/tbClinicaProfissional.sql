CREATE TABLE [dbo].[tbClinicaProfissional]
(
	[IdClinicaProfissional] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idClinica INT NOT NULL REFERENCES tbClinicas(IdClinica), 
	idProfissional INT NOT NULL REFERENCES tbProfissionais(idProfissional),
	cvTaxaProfissional DECIMAL(10,2) NOT NULL DEFAULT(0.1),
	idObservacao INT REFERENCES tbObservacoes(idObservacao)
)
