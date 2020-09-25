
CREATE PROCEDURE SEL_ProfissionalRepasses
(@year      INT      = NULL, 
 @dtInicial DATETIME = NULL, 
 @dtFinal   DATETIME = NULL
)
AS
    BEGIN
	   IF @year IS NULL
		 
		  BEGIN
			 SET @year = YEAR(GETDATE());
		  END;
	   SELECT    p.IdProfissional, 
			   p.ccNome, 
			   p.nomeMae, 
			   p.CPFNum, 
			   p.RGNum, 
			   pd.cvTitulo titulo, 
			   p.cvCNH, 
			   pd.cvPIS pis, 
			   pd.ccConselho conselho, 
			   pd.cvNumInscricao regConselho, 
	   (
		  SELECT CONCAT(b.ccBanco, ' AG - ', tb.ccAgencia, ' Conta - ', tb.ccConta, ' OP - ', tb.ccOperacao, ' | ')
		  FROM    tbProfissionaisBancos tb
				INNER JOIN tbBancos b ON tb.idBanco = b.IdBanco
		  WHERE  P.IdProfissional = TB.idProfissional FOR XML PATH('')
	   ) Banco, 
			   r.Valor faturamento, 
			   @year periodo
	   FROM tbProfissionais p
		   LEFT JOIN tbProfissionaisDados pd ON p.IdProfissional = pd.idProfissional
		   INNER JOIN
	   (
		  SELECT IdProfissional, 
			    CAST(SUM(cvValorRepasse) AS DECIMAL(20, 2)) Valor
		  FROM   tbProfissionalRepasse
		  WHERE  ccStatus = 'R'
			    AND (YEAR(dataRepasse) = @year
				    OR dataRepasse BETWEEN @dtInicial AND @dtFinal)
		  GROUP BY IdProfissional
	   ) r ON p.IdProfissional = r.IdProfissional;
    END;