CREATE PROCEDURE SEL_ChartFatEfetivo  
AS  
  BEGIN  
 SELECT MONTH(cdEmissao)                   MN,   
     LEFT(FORMAT(cdEmissao, 'MMMM'), 1) d,   
     SUM(CAST(r.cvValor AS INT))/1000        cvValor  
   FROM tbReceitas R  
  WHERE YEAR(cdEmissao)=YEAR(GETDATE())  
     AND cdPagamento IS NOT NULL  
  GROUP BY MONTH(cdEmissao),   
     LEFT(FORMAT(cdEmissao, 'MMMM'), 1)  
 ORDER BY MN;  
  END;