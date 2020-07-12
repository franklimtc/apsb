CREATE PROCEDURE SEL_Repasse            
(            
 @idReceita INT = NULL            
)            
AS BEGIN   
IF @idReceita IS NOT NULL   
 BEGIN  
  SELECT             
  r.idRepasse       
  , re.IdClinica      
  , r.idReceita            
  , r.IdProfissional            
  , p.ccNome      
  , CAST(ISNULL(r.cvTaxaProfissional, 0) AS DECIMAL(10,2)) cvTaxaProfissional      
  , CAST(r.cvValor AS DECIMAL(10,2)) [cvValor]            
  , CAST(r.cvValor - (r.cvValor* ISNULL(r.cvTaxaProfissional, 0) / 100) AS DECIMAL(10,2)) [cvValorLiquido]            
  , r.ccStatus            
  , r.dataRepasse            
  , r.ccCriadoPor            
  , o.observacao            
  FROM tbProfissionalRepasse r      
  INNER JOIN tbReceitas re ON r.idReceita = re.idReceita      
  INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional      
  LEFT JOIN tbObservacoes O on r.IdObservacao = o.IdObservacao            
  WHERE r.ccStatus <> 'C' AND r.idReceita = @idReceita        
 END  
 ELSE  
 BEGIN  
  SELECT  c.ccApelido, p.ccNome, r.cvNF, r.cdEmissao, CAST(r.cvValor AS DECIMAL(10,2)) ValorNF, CAST(r.cvValorPago AS DECIMAL(10,2)) ValorPago, pr.dataRepasse cdRepasse, CAST(pr.cvValor - (pr.cvValor * (ISNULL(pr.cvTaxaProfissional,0)/100)) AS DECIMAL(10,
2))  ValorRepasse    
  FROM tbReceitas r  
  inner join tbProfissionalRepasse pr on r.idReceita = pr.idReceita  
  inner join tbClinicas c on r.IdClinica = c.IdClinica  
  inner join tbProfissionais p on pr.IdProfissional = p.IdProfissional  
 END  
END