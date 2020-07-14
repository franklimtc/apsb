
CREATE PROCEDURE SEL_ProfissionalAuto      
AS      
BEGIN      
 SELECT       
 CASE WHEN ccSexo IS NULL OR ccNaturalUF IS NULL OR ccNaturalCidade IS NULL OR ccEstadoCivil IS NULL     
 OR RGNum IS NULL OR RGdtEmissao IS NULL OR CPFNum IS NULL OR cvTelefone IS NULL OR cvCelular IS NULL  THEN 'Incompleto'     
 ELSE 'Completo' END StatusCadastro    
 , IdProfissional      
 , DBO.FN_TokenAuto(IdProfissional, cdDataCriacao) Token      
 , ccNome      
 , ccSexo      
 , ccNaturalUF      
 , ccNaturalCidade      
 , ccEstadoCivil      
 , ccEmail      
 , cvStatus      
 , ccCriadoPor      
 , cdDataCriacao      
 , ccAlteradoPor      
 , cdDataAlteracao      
 , IdObservacao      
 , RGNum      
 , RGEmissor      
 , RGdtEmissao      
 , CPFNum      
 , cvTelefone      
 , cvCelular      
 , nomePai      
 , nomeMae      
 , nomeConjuge      
 , cdDataNascimento      
 , cbAutoCadastro      
 FROM tbProfissionais where cbAutoCadastro = 1 AND cvStatus = 0;      
      
END