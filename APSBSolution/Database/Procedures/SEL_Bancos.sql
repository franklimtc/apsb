  
CREATE PROCEDURE SEL_Bancos  
(  
   @cvStatus BIT = 1  
)  
AS  
  BEGIN  
 SELECT bc.IdBanco,   
    bc.ccBanco,   
     CONCAT(RIGHT(CONCAT('00',cvCodBanco),3), ' - ', ccBanco) [ccBancoCod],   
     bc.cvCodBanco,   
     bc.cvStatus  
   FROM tbBancos bc;  
  END;