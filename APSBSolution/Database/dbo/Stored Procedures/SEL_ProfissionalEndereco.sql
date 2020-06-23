CREATE PROCEDURE SEL_ProfissionalEndereco  
(  
   @idProfissional INT  
)  
AS  
  BEGIN  
 SELECT IdEndereco,   
     ccEndereco,   
     ccBairro,   
     cvCEP,   
     ccUF,   
     ccCidade  
   FROM tbEndereco  
  WHERE idProfissional=@idProfissional;  
  
  END;