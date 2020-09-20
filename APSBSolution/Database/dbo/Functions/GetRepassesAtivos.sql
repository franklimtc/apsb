CREATE FUNCTION GetRepassesAtivos
(    
-- Add the parameters for the function here    
@idProfissional INT
)
RETURNS VARCHAR(10)
AS
	BEGIN
	    DECLARE @qtd VARCHAR(10);
	    SELECT @qtd = CAST(COUNT(*) AS VARCHAR(MAX))
	    FROM   tbProfissionalRepasse
	    WHERE  IdProfissional = @idProfissional
			 AND ccStatus = 'A'
	    HAVING COUNT(*) > 1;
	    RETURN @qtd;
	END;