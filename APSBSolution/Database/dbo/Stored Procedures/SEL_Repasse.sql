CREATE PROCEDURE SEL_Repasse    
(    
 @idReceita INT    
)    
AS BEGIN    
 SELECT     
 r.idRepasse    
 , r.idReceita    
 , r.IdProfissional    
 , p.ccNome  
 , CAST(r.cvValor AS DECIMAL(10,2)) [cvValor]    
 , r.ccStatus    
 , r.dataRepasse    
 , r.ccCriadoPor    
 , o.observacao    
 FROM tbProfissionalRepasse r  
 INNER JOIN tbProfissionais p ON r.idProfissional = p.IdProfissional  
 LEFT JOIN tbObservacoes O on r.IdObservacao = o.IdObservacao    
 WHERE r.ccStatus <> 'C' AND r.idReceita = @idReceita    
END