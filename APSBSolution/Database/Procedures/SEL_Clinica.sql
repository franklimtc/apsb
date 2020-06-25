
CREATE PROCEDURE SEL_Clinicas    
(    
	@Status BIT = 1,  
	@IdClinica INT = 0  
)    
AS BEGIN    
  
	IF @IdClinica = 0  
	BEGIN  
		 SELECT     
		 tbc.IdClinica    
		 , tbc.ccApelido    
		 , tbc.ccRazaoSocial    
		 , tbc.ccNomeFantasia    
		 , tbc.ccEmail    
		 , tbc.cvISS    
		 , tbc.cvDescontos    
		 , CASE WHEN tbc.cbDescontoVariavel = 1 THEN 'Sim' ELSE 'Não' END cbDescontoVariavel    
		 , tbb.ccBanco    
		 , ISNULL(tbc.cvPgtoDias,0) cvPgtoDias    
		 , tbObs.observacao 
		 , tbc.cvCNPJ
		 FROM tbClinicas tbc    
		 LEFT JOIN tbBancos tbb ON tbc.idBanco = tbb.IdBanco    
		 LEFT JOIN tbObservacoes tbObs ON tbc.idObservacao = tbObs.IdObservacao    
		 WHERE tbc.cvStatus = @Status    
	END  
	ELSE  
	BEGIN  
		 SELECT     
		 tbc.IdClinica    
		 , tbc.ccApelido    
		 , tbc.ccRazaoSocial    
		 , tbc.ccNomeFantasia    
		 , tbc.ccEmail    
		 , tbc.cvISS    
		 , tbc.cvDescontos    
		 , CASE WHEN tbc.cbDescontoVariavel = 1 THEN 'Sim' ELSE 'Não' END cbDescontoVariavel    
		 , tbb.ccBanco    
		 , ISNULL(tbc.cvPgtoDias,0) cvPgtoDias    
		 , tbObs.observacao    
		 , tbc.cvCNPJ
		 FROM tbClinicas tbc    
		 LEFT JOIN tbBancos tbb ON tbc.idBanco = tbb.IdBanco    
		 LEFT JOIN tbObservacoes tbObs ON tbc.idObservacao = tbObs.IdObservacao    
		 WHERE tbc.cvStatus = @Status AND tbc.IdClinica = @IdClinica   
	END  
END;