CREATE PROCEDURE SEL_ProfissionalIDByReceita
(
@idReceita int
, @ccNome VARCHAR(100) 
)
AS
SELECT 
	  --r.idReceita, 
	  --r.IdClinica, 
	  c.idProfissional 
	  --p.ccNome
FROM   tbReceitas r
	  INNER JOIN tbClinicaProfissional c ON r.IdClinica = c.idClinica
									AND c.cvStatus = 1
	  INNER JOIN tbProfissionais p ON c.idProfissional = p.IdProfissional
							    AND p.cvStatus = 1
WHERE  r.idReceita = @idReceita AND p.ccNome = @ccNome;