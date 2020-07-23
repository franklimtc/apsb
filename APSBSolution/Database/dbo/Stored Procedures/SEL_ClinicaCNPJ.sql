CREATE PROCEDURE SEL_ClinicaCNPJ
(
@cnpj bigint
) AS 
BEGIN
	SELECT * FROM tbClinicas c
	where cvCNPJ = @cnpj
END