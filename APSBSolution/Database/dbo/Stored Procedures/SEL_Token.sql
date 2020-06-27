CREATE PROCEDURE SEL_Token
(
	@Token VARCHAR(20)
)
AS    
BEGIN
	DECLARE @idProfissinal INT;
	SELECT  @idProfissinal = IdProfissional FROM tbProfissionais
	WHERE  CONCAT('APSB',RIGHT(CONCAT('000000', CONCAT(IdProfissional,DATEPART(MILLISECOND,cdDataCriacao))),6)) = @Token
	SELECT ISNULL(@idProfissinal, 0); 
END