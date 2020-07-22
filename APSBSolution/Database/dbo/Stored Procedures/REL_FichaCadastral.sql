CREATE PROCEDURE REL_FichaCadastral  
--(  
-- @idProfissional INT  
--)  
AS BEGIN  
 SELECT p.ccNome, p.ccSexo, p.cdDataNascimento, p.CPFNum, p.RGNum, p.RGEmissor   
 , pd.cvNumInscricao, pd.ccConselho, pd.ccEspecialidade, pd.cvPIS  
 , e.ccEndereco, e.cvCEP, e.ccBairro, e.ccCidade, e.ccUF  
 , p.cvCelular, p.ccEmail  
 , pd.cvTitulo, pd.cvReservista, null ctps, NULL cnh  
 , tbc.ccBanco, tbc.ccAgencia, tbc.ccConta  
 FROM tbProfissionais p   
 LEFT JOIN tbProfissionaisDados pd ON p.IdProfissional = PD.idProfissional  
 LEFT JOIN tbEndereco e ON p.IdProfissional = e.idProfissional  
 LEFT JOIN   
 (  
  SELECT TOP 1 A.idProfissional, b.ccBanco, ccAgencia, ccConta, ccOperacao   
  FROM tbProfissionaisBancos A  
  INNER JOIN tbBancos B on a.idBanco = b.IdBanco  
 )tbc ON p.IdProfissional = tbc.idProfissional  
 WHERE  p.IdProfissional = 1709  
END