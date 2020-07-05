CREATE VIEW vwReceitas    
AS    
 SELECT r1.idReceita, SUM(CAST(r1.cvValor AS DECIMAL(10,2))) cvValorUsado, MAX(r1.dataRepasse) dtRepasse, CASE WHEN ISNULL(r2.qtd,0) = 0 THEN 'R' ELSE 'A' END [status] 
 FROM tbProfissionalRepasse r1
 LEFT JOIN
 (
	SELECT idReceita, COUNT(*) qtd FROM tbProfissionalRepasse WHERE ccStatus NOT IN ('C','R') GROUP BY idReceita
 ) r2 ON R1.idReceita = r2.idReceita
 WHERE r1.ccStatus <> 'C' GROUP BY r1.idReceita , CASE WHEN ISNULL(r2.qtd,0) = 0 THEN 'R' ELSE 'A' END