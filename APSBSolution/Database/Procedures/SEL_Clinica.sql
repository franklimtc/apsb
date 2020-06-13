CREATE PROCEDURE SEL_Clinicas
(
	@Status BIT = 1
)
AS BEGIN
	SELECT 
	tbc.IdClinica
	, tbc.ccApelido
	, tbc.ccRazaoSocial
	, tbc.ccNomeFantasia
	, tbc.ccEmail
	, tbc.cvISS
	, tbc.cvDescontos
	, tbc.cbDescontoVariavel
	, tbb.ccBanco
	, tbObs.observacao
	FROM tbClinicas tbc
	LEFT JOIN tbBancos tbb ON tbc.idBanco = tbb.IdBanco
	LEFT JOIN tbObservacoes tbObs ON tbc.idObservacao = tbObs.IdObservacao
	WHERE tbc.cvStatus = @Status
END;