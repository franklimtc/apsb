      
CREATE PROCEDURE SEL_ProfissionalAuto            
AS            
BEGIN            
	 SELECT DISTINCT            
	 CASE WHEN p.ccSexo IS NULL OR p.ccNaturalUF IS NULL OR p.ccNaturalCidade IS NULL OR p.ccEstadoCivil IS NULL           
	 OR p.RGNum IS NULL OR p.RGdtEmissao IS NULL OR p.CPFNum IS NULL OR p.cvTelefone IS NULL OR p.cvCelular IS NULL  THEN 'Incompleto'           
	 ELSE 'Completo' END StatusCadastro          
	 , p.IdProfissional            
	 , DBO.FN_TokenAuto(p.IdProfissional, p.cdDataCriacao) Token            
	 , p.ccNome            
	 , p.ccSexo            
	 , p.ccNaturalUF            
	 , p.ccNaturalCidade            
	 , p.ccEstadoCivil            
	 , p.ccEmail            
	 , p.cvStatus            
	 , p.ccCriadoPor            
	 , p.cdDataCriacao            
	 , p.ccAlteradoPor            
	 , p.cdDataAlteracao            
	 , p.IdObservacao            
	 , p.RGNum            
	 , p.RGEmissor            
	 , p.RGdtEmissao            
	 , p.CPFNum            
	 , p.cvTelefone            
	 , p.cvCelular            
	 , p.nomePai            
	 , p.nomeMae            
	 , p.nomeConjuge            
	 , p.cdDataNascimento            
	 , p.cbAutoCadastro     
	 , CASE WHEN pa.QTD > 0 THEN 'Sim' Else 'Não' end TaxaPaga    
	 FROM tbProfissionais p    
	 LEFT JOIN 
	 (
		SELECT idProfissional, COUNT(*) QTD  FROM tbProfissionalArquivo WHERE ccNomeArquivo like 'Comprovante_Taxa%'   GROUP BY idProfissional
	 ) pa ON pa.idProfissional = p.IdProfissional

	 where p.cbAutoCadastro = 1 AND p.cvStatus = 0; 
END