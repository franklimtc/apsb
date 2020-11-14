CREATE PROCEDURE SEL_ProfissionaisGrid2
(
    @Status BIT = 1
    , @offset INT = 0
    , @rows INT = 10
)
AS
    BEGIN
	   SELECT p.IdProfissional, 
			p.ccNome, 
			p.ccEmail, 
			o.observacao Observacoes
	   FROM   tbProfissionais p
			LEFT JOIN tbObservacoes o ON p.IdObservacao = o.IdObservacao
	   WHERE  P.cvStatus = @Status
	   ORDER BY p.ccNome
	   OFFSET @offset ROWS FETCH NEXT @rows ROWS ONLY;
    END;