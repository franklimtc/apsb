CREATE VIEW vw_ChartFatBruto AS     
SELECT     
DATEPART(weekday, cdEmissao)    label,    
DATEPART(weekday, cdEmissao)    dw,    
CAST(SUM(cvValor) AS INT) data    
FROM tbReceitas    
WHERE cdEmissao IS NOT NULL    
AND cdEmissao >= GETDATE() - 7    
group by  DATEPART(weekday, cdEmissao)