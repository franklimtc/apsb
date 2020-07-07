
CREATE PROCEDURE SEL_Repasse      
(      
 @idReceita INT      
)      
AS BEGIN      
	SELECT       
	r.idRepasse 
	, re.IdClinica
	, r.idReceita      
	, r.IdProfissional      
	, p.ccNome
	, tcp.cvTaxaProfissional
	, CAST(r.cvValor AS DECIMAL(10,2)) [cvValor]      
	, CAST(r.cvValor - (r.cvValor* tcp.cvTaxaProfissional / 100) AS DECIMAL(10,2)) [cvValorLiquido]      
	, r.ccStatus      
	, r.dataRepasse      
	, r.ccCriadoPor      
	, o.observacao      
	FROM tbProfissionalRepasse r
	INNER JOIN tbReceitas re ON r.idReceita = re.idReceita
	INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional
	LEFT JOIN tbClinicaProfissional tcp ON tcp.idClinica = re.IdClinica AND tcp.idProfissional = r.IdProfissional
	LEFT JOIN tbObservacoes O on r.IdObservacao = o.IdObservacao      
	WHERE r.ccStatus <> 'C' AND r.idReceita = @idReceita      
END