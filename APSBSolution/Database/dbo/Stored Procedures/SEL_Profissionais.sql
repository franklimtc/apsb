CREATE PROCEDURE SEL_Profissionais          
(          
 @Status BIT = 1,        
 @IdProfissional INT = 0        
)          
AS BEGIN          
 IF @IdProfissional = 0        
 BEGIN        
	SELECT           
	tbp.IdProfissional, tbp.ccNome, tbp.ccSexo, tbp.ccEmail, tbp.cvStatus, tbObs.observacao, tbp.cdDataNascimento      
	FROM tbProfissionais tbp          
	LEFT JOIN tbObservacoes tbObs ON tbp.idObservacao = tbObs.IdObservacao          
	WHERE tbp.cvStatus = @Status          
 END        
 ELSE        
 BEGIN        
  SELECT           
	tbp.IdProfissional, tbp.ccNome, tbp.ccSexo, tbp.ccEmail, tbp.cvStatus, tbObs.observacao, tbp.ccNaturalUF, tbp.ccNaturalCidade, tbp.cdDataNascimento   
	, tbp.ccEstadoCivil, tbp.RGNum, tbp.RGEmissor, tbp.RGdtEmissao, tbp.CPFNum, tbp.cvTelefone, tbp.cvCelular, tbp.nomePai, tbp.nomeMae, tbp.nomeConjuge      
	FROM tbProfissionais tbp          
	LEFT JOIN tbObservacoes tbObs ON tbp.idObservacao = tbObs.IdObservacao       
	WHERE  tbp.IdProfissional = @IdProfissional AND (tbp.cvStatus = @Status OR tbp.cbAutoCadastro = 1)        
 END        
END;