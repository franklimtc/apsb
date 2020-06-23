CREATE PROCEDURE SEL_ProfissionalBanco  
(  
   @idProfissional INT  
)  
AS  
  BEGIN  
 SELECT 
	tbp.IdProfissionalBanco,
	tbb.ccBanco,
	tbb.cvCodBanco,
	tbp.ccAgencia,   
	tbp.ccConta,   
	tbp.ccOperacao,   
	tbp.idProfissional,   
	tbp.idBanco,   
	tbp.cvStatus  
   FROM tbProfissionaisBancos  tbp
   INNER JOIN tbBancos tbb on tbp.idBanco = tbb.IdBanco
  WHERE idProfissional=@idProfissional  
     AND tbp.cvStatus=1;  
  END;