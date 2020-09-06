CREATE PROCEDURE GetIDProfissionalByName(@ccNome VARCHAR(MAX))
AS
    BEGIN
	   DECLARE @idProfissional INT;
	   SELECT @idProfissional = ISNULL(IdProfissional, 0)
	   FROM   tbProfissionais
	   WHERE  ccNome = @ccNome;
	   SELECT ISNULL(@idProfissional, 0) IdProfissional;
    END;