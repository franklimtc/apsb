CREATE PROCEDURE SEL_ClinicaProfissional
(
	@idClinica INT
)
AS 
BEGIN

	SELECT IdClinicaProfissional, tbc.idProfissional, tbp.ccNome, tbc.cvTaxaProfissional, tbc.cvStatus, tbo.observacao FROM tbClinicaProfissional tbc
	INNER JOIN tbProfissionais tbp ON tbc.idProfissional = tbp.IdProfissional
	LEFT JOIN tbObservacoes tbo ON TBC.idObservacao = tbo.IdObservacao
	WHERE idClinica = @idClinica
END