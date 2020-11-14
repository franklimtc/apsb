  
CREATE PROCEDURE SEL_ProfissionaisDP   
AS  
BEGIN  
 select IdProfissional, ccNome from tbProfissionais  
 where cvStatus = 1
 ORDER BY 2;
END;