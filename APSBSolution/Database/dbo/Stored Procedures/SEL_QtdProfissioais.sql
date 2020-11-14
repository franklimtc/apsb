CREATE PROCEDURE SEL_QtdProfissioais(@Status BIT = 1)
AS
    BEGIN
	   SELECT COUNT(*) qtd
	   FROM   tbProfissionais
	   WHERE  cvStatus = @Status;
    END;