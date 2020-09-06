CREATE PROCEDURE SEL_DespesaByName(@ccTipo VARCHAR(MAX))
AS
    BEGIN
	   SELECT idtipo, 
			ccTipo
	   FROM   tbDespesaTipo
	   WHERE  ccTipo = @ccTipo;
    END;