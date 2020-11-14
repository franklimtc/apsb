CREATE PROCEDURE SEL_Endereco
(
   @idProfissional INT
)
AS
  BEGIN
	SELECT IdEndereco, 
		   ccEndereco, 
		   ccBairro, 
		   cvCEP, 
		   ccUF, 
		   ccCidade
	  FROM tbEndereco
	 WHERE idProfissional=@idProfissional;

  END;