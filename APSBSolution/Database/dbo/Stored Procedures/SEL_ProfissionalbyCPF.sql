CREATE PROCEDURE SEL_ProfissionalbyCPF
(
@CPF bigint
)
AS 
SELECT CONCAT('Profissional com ID ',idProfissional, ', de nome ',  
	  ccNome, ' e CPF ',  
	  CPFNum, ' já cadastrado com status ',  
	  CASE
		 WHEN cvStatus = 1
		 THEN 'Ativo.'
		 ELSE 'Inativo.'
	  END) msg
FROM   tbProfissionais
WHERE  CPFNum = @CPF;