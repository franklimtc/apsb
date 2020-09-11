CREATE PROCEDURE SEL_ProfissionaisGrid(@Status BIT = 1)
AS
    BEGIN
	   SELECT p.IdProfissional, 
			p.ccNome, 
			p.ccEmail, 
			o.observacao Observacoes
	   FROM   tbProfissionais p
			LEFT JOIN tbObservacoes o ON p.IdObservacao = o.IdObservacao
	   WHERE  P.cvStatus = @Status;
    END;