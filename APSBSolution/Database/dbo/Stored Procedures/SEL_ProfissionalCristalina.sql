CREATE PROCEDURE SEL_ProfissionalCristalina
(
	@idProfissional INT
) AS BEGIN
	SELECT COUNT(*) qtd FROM tbClinicaProfissional cp 
	INNER JOIN tbClinicas c on cp.idClinica = c.IdClinica
	WHERE cp.idProfissional = @idProfissional
	AND 
	(
		c.ccApelido like '%cristalina%'
		or c.ccApelido like '%melhor em casa%'
		or c.ccApelido like '%esf%'
	)
END;