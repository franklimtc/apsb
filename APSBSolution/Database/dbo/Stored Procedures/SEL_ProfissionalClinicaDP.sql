CREATE PROCEDURE SEL_ProfissionalClinicaDP     
(    
 @idOperacao INT    
)    
AS        
BEGIN     
 DECLARE @idClinica INT;    
    
 SELECT @idClinica = IdClinica FROM tbReceitas WHERE idReceita = @idOperacao;   
   
 select p.IdProfissional, p.ccNome, c.idClinica from tbProfissionais p    
 INNER JOIN tbClinicaProfissional c ON p.IdProfissional = c.idProfissional AND c.idClinica = @idClinica    
 where p.cvStatus = 1 AND c.cvStatus = 1     
 ORDER BY 2;      
END;