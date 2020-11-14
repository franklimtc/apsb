
CREATE PROCEDURE SEL_Token  
(  
 @Token VARCHAR(20)  
)  
AS      
BEGIN  
	DECLARE @idProfissinal INT = 0;  
	IF LEN(@Token) = 14
	BEGIN
		IF (DATEPART(DAY, GETDATE()) -  CAST(LEFT(RIGHT(@Token, 5),2) AS INT)) <= 1
		BEGIN
			SELECT  @idProfissinal = IdProfissional FROM tbProfissionais  
			WHERE  CONCAT('APSB',RIGHT(CONCAT('000000', CONCAT(IdProfissional,RIGHT(CONCAT('00',DATEPART(DAY,cdDataCriacao)),2),RIGHT(CONCAT('00',DATEPART(MILLISECOND,cdDataCriacao)),3))),10)) = @Token
		END
	END
	SELECT ISNULL(@idProfissinal, 0);   
END