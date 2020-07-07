CREATE PROCEDURE SEL_RepasseObs
(
	@idRepasse INT
) AS BEGIN
	SELECT o.observacao FROM tbProfissionalRepasse p
	INNER JOIN tbReceitas r on p.idReceita = r.idReceita
	INNER JOIN tbClinicaProfissional c on r.IdClinica = c.idClinica and p.IdProfissional = c.idProfissional
	INNER JOIN tbObservacoes o on c.idObservacao = o.IdObservacao
	WHERE p.idRepasse = @idRepasse
END;