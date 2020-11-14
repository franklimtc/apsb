CREATE PROCEDURE SEL_ClinicaProfissional      
(      
 @idClinica INT  
 , @idProfissional INT = NULL  
)      
AS       
BEGIN      
IF @idProfissional IS NULL  
 BEGIN  
  SELECT tbc.idClinica, c.ccRazaoSocial, c.ccApelido, c.ccNomeFantasia, IdClinicaProfissional, tbc.idProfissional, tbp.ccNome, tbc.cvTaxaProfissional, tbc.cvStatus, tbo.observacao     
  FROM tbClinicaProfissional tbc   
  INNER JOIN tbClinicas c on tbc.idClinica = c.IdClinica
  INNER JOIN tbProfissionais tbp ON tbc.idProfissional = tbp.IdProfissional      
  LEFT JOIN tbObservacoes tbo ON TBC.idObservacao = tbo.IdObservacao      
  WHERE tbc.idClinica = @idClinica   AND tbc.cvStatus = 1   
 END  
 ELSE  
 BEGIN  
  SELECT tbc.idClinica, c.ccRazaoSocial, c.ccApelido, c.ccNomeFantasia, IdClinicaProfissional, tbc.idProfissional, tbp.ccNome, tbc.cvTaxaProfissional, tbc.cvStatus, tbo.observacao     
  FROM tbClinicaProfissional tbc      
  INNER JOIN tbClinicas c on tbc.idClinica = c.IdClinica
  INNER JOIN tbProfissionais tbp ON tbc.idProfissional = tbp.IdProfissional      
  LEFT JOIN tbObservacoes tbo ON TBC.idObservacao = tbo.IdObservacao      
  WHERE tbc.idProfissional = @idProfissional    
 END  
END