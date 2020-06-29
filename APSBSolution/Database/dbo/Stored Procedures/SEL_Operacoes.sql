CREATE PROCEDURE SEL_Operacoes 
(
	@cbArquivado BIT = 0
	,@cbStatus BIT = 1
)
AS BEGIN  
  
	SELECT   
	r.idReceita [ID]  
	, r.cvValor  
	, c.ccApelido [ccDescricao]  
	, o.observacao  
	, r.cdEmissao  
	, r.cdPagamento  
	, r.cdRepasse   
	, CASE   
	WHEN r.cdEmissao IS NULL THEN 0  
	WHEN r.cdEmissao IS NOT NULL AND r.cdPagamento IS NULL THEN 1  
	WHEN r.cdEmissao IS NOT NULL AND r.cdPagamento IS NOT NULL AND r.cdRepasse IS NULL THEN 2  
	WHEN r.cdEmissao IS NOT NULL AND r.cdPagamento IS NOT NULL AND r.cdRepasse IS NOT NULL THEN 3  
	ELSE 4   
	END [Status]  
	, 'Receita' [Tipo]  
	, r.cvNF  
	FROM tbReceitas r  
	INNER JOIN tbClinicas c on r.IdClinica = c.IdClinica  
	LEFT JOIN tbObservacoes o on r.idObservacao = o.IdObservacao
	WHERE r.cbStatus = @cbStatus AND r.cbArquivado=@cbArquivado
  
	UNION  
  
	SELECT d.idDespesas      
	, d.cvValor      
	, t.ccTipo      
	, o.observacao  
	, d.cdData cdEmissao      
	, NULL cdPagamento  
	, NULL cdRepasse  
	, 3 [Status]  
	, 'Despesa' [Tipo]  
	, NULL cvNF  
	FROM tbDespesas d      
	INNER JOIN tbDespesaTipo t ON d.idTipo = t.idTipo      
	LEFT JOIN tbObservacoes o ON d.IdObservacao = o.IdObservacao 
	WHERE d.cbStatus = @cbStatus AND d.cbArquivado=@cbArquivado
  
  END