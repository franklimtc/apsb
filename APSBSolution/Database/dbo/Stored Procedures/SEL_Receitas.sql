
 CREATE PROCEDURE SEL_Receitas           
(            
 @cbArquivado BIT = 0,            
 @cbStatus BIT = 1,            
 @dtInicial DATETIME = NULL,            
 @dtFinal DATETIME = NULL,           
 @idReceita INT = NULL          
)            
AS BEGIN            
 SET NOCOUNT ON            
 IF @idReceita IS NULL          
 BEGIN          
  SELECT r.idReceita           
  , CAST(r.cvValor AS DECIMAL(10,2)) cvValor        
  , CAST(ISNULL(r.cvValorPago,0) AS DECIMAL(10,2))  cvValorPago  
  , CAST(ISNULL(vwr.cvValorUsado,0) AS DECIMAL(10,2)) cvValorRepassado  
  , CAST((ISNULL(r.cvValorPago,0)-ISNULL(vwr.cvValorUsado,0)) AS DECIMAL(10,2)) cvValorDisponivel      
  , r.cdEmissao        
  , r.cdPagamento        
  , r.cdRepasse        
  , CAST(r.cvDesconto AS DECIMAL(10,2)) cvDesconto     
  , r.cvNF        
  , o.observacao        
  FROM tbReceitas r           
  INNER JOIN tbClinicas c ON c.IdClinica = r.IdClinica        
  LEFT JOIN tbObservacoes o ON r.IdObservacao = o.IdObservacao        
  LEFT JOIN vwReceitas vwr ON r.idReceita = vwr.idReceita      
  WHERE r.cbStatus = @cbStatus AND r.cbArquivado = @cbArquivado            
  AND r.cdEmissao BETWEEN ISNULL(@dtInicial, DATEADD(YEAR,-10, GETDATE())) AND ISNULL(@dtFinal, DATEADD(YEAR, 10, GETDATE()))            
 END          
 ELSE          
 BEGIN          
  SELECT r.idReceita           
  , CAST(r.cvValor AS DECIMAL(10,2)) cvValor        
  , CAST(ISNULL(r.cvValorPago,0) AS DECIMAL(10,2))  cvValorPago    
  , CAST(ISNULL(vwr.cvValorUsado,0) AS DECIMAL(10,2)) cvValorRepassado  
  , CAST((ISNULL(r.cvValorPago,0)-ISNULL(vwr.cvValorUsado,0)) AS DECIMAL(10,2)) cvValorDisponivel      
  , r.cdEmissao        
  , r.cdPagamento        
  , r.cdRepasse        
  , CAST(r.cvDesconto AS DECIMAL(10,2)) cvDesconto       
  , r.cvNF        
  , o.observacao        
  FROM tbReceitas r           
  INNER JOIN tbClinicas c ON c.IdClinica = r.IdClinica        
  LEFT JOIN tbObservacoes o ON r.IdObservacao = o.IdObservacao        
  LEFT JOIN vwReceitas vwr ON r.idReceita = vwr.idReceita      
  WHERE r.idReceita = @idReceita        
 END          
END;