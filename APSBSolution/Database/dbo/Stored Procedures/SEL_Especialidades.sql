CREATE PROCEDURE SEL_Especialidades  
AS  
BEGIN  
 SELECT idEspecialidade, Especialidade ccEspecialidade FROM tbEspecialidade ORDER BY Especialidade 
END