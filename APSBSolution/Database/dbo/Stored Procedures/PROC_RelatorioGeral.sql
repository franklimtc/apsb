CREATE PROCEDURE PROC_RelatorioGeral
(  
--DECLARE  
@dtInicial DATETIME, 
@dtFinal   DATETIME
)
AS
    BEGIN
	   SET @dtInicial = ISNULL(@dtInicial, DATEADD(YEAR, -10, GETDATE()));
	   SET @dtFinal = ISNULL(@dtFinal, DATEADD(YEAR, 10, GETDATE()));
	   WITH cteMedico
		   AS (SELECT    p.IdProfissional, 
					  p.ccNome, 
					  p.CPFNum, 
					  p.RGNum, 
					  d.cvPIS, 
					  p.cvCNH, 
					  d.cvNumInscricao, 
					  d.cvTitulo, 
					  p.cdFiliacao, 
					  d.ccEspecialidade, 
					  banco.ccBanco, 
					  banco.ccAgencia, 
					  banco.ccConta, 
					  dbo.ConvertFirstLetterinCapital(COALESCE(p.ccAlteradoPor, p.ccCriadoPor)) ccCriadoPor, 
					  CONCAT('Fone: ', ISNULL(CAST(p.cvTelefone AS VARCHAR(MAX)), 'Não Informado'), ' Cel.: ', ISNULL(CAST(p.cvCelular AS VARCHAR(MAX)), 'Não Informado')) telefone, 
					  o.observacao
			  FROM      tbProfissionais p
					  LEFT JOIN tbProfissionaisDados d ON p.idprofissional = d.idProfissional
					  LEFT JOIN tbObservacoes o ON p.IdObservacao = o.IdObservacao
					  LEFT JOIN
			  (
				 SELECT b.idProfissional, 
					   bb.ccBanco, 
					   bb.cvCodBanco, 
					   b.ccAgencia, 
					   b.ccConta, 
					   b.ccOperacao
				 FROM   tbProfissionaisBancos b
					   LEFT JOIN tbBancos bb ON b.idBanco = bb.IdBanco
				 WHERE  EXISTS
				 (
					SELECT MIN(IdProfissionalBanco)
					FROM   tbProfissionaisBancos c
					WHERE  c.cvStatus = 1
						  AND C.IdProfissionalBanco = B.IdProfissionalBanco
					GROUP BY c.idProfissional
				 )
			  ) banco ON p.IdProfissional = banco.idProfissional),
		   cteClinica
		   AS (SELECT cp.idClinica, 
				    c.ccApelido, 
				    c.cvDescontos, 
				    cp.idProfissional, 
				    cp.cvTaxaProfissional
			  FROM   tbClinicaProfissional cp
				    INNER JOIN tbClinicas c ON c.IdClinica = cp.idClinica
			  WHERE  cp.cvStatus = 1),
		   cteFatProfissional
		   AS (SELECT tr.idProfissional, 
				    YEAR(tr.dataRepasse) ano, 
				    MONTH(tr.dataRepasse) mesNum, 
				    dbo.GetMonthName(MONTH(tr.dataRepasse)) mesNome, 
				    SUM(tr.cvValorRepasse) cvValorRepasse, 
				    ROUND(SUM(t.cvValorPago), 2) cvValorPagoClinica, 
				    COUNT(*) qtdNotas, 
				    t.IdClinica
			  FROM   tbProfissionalRepasse tr
				    INNER JOIN tbReceitas t ON tr.idReceita = t.idReceita
			  WHERE  ccStatus = 'R'
				    AND tr.dataRepasse BETWEEN @dtInicial AND @dtFinal      
			  --and IdProfissional = 1716      
			  GROUP BY idProfissional, 
					 t.IdClinica, 
					 YEAR(dataRepasse), 
					 MONTH(dataRepasse)),
		   cteFatClinica
		   AS (SELECT IdClinica, 
				    YEAR(cdPagamento) ano, 
				    MONTH(cdPagamento) mesNum, 
				    dbo.GetMonthName(MONTH(cdPagamento)) mesNome, 
				    SUM(ROUND(cvValor, 2)) cvValorClinica, 
				    COUNT(*) qtdNotas
			  FROM   tbReceitas
			  WHERE  cbStatus = 1
				    AND cdPagamento BETWEEN @dtInicial AND @dtFinal
			  GROUP BY IdClinica, 
					 YEAR(cdPagamento), 
					 MONTH(cdPagamento))
		   SELECT DISTINCT 
				cteMedico.*, 
				cteClinica.cvTaxaProfissional, 
				cteFatProfissional.ano, 
				cteFatProfissional.mesNome, 
				cteFatProfissional.cvValorRepasse, 
				cteClinica.ccApelido, 
				cteClinica.cvDescontos, 
				cteFatProfissional.cvValorPagoClinica cvValorClinica, --cteFatClinica.cvValorClinica,   
				cteFatProfissional.qtdNotas, 
				cteFatClinica.ano anoClinica, 
				cteFatClinica.mesNome mesNomeClinica 
		   FROM   cteMedico
				INNER JOIN cteClinica ON cteMedico.IdProfissional = cteClinica.idProfissional
				LEFT JOIN cteFatProfissional ON cteMedico.IdProfissional = cteFatProfissional.IdProfissional
										  AND cteClinica.idClinica = cteFatProfissional.IdClinica
				LEFT JOIN cteFatClinica ON cteClinica.idClinica = cteFatClinica.IdClinica
									  AND cteFatClinica.mesNum = cteFatProfissional.mesNum
		   WHERE  cvValorRepasse IS NOT NULL; --AND cteMedico.IdProfissional = 1750;  
    END;