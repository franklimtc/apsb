CREATE PROCEDURE SEL_ClinicasByApelido(@ccApelido VARCHAR(MAX))
AS
    BEGIN
	   SELECT tbc.IdClinica, 
			RTRIM(LTRIM(tbc.ccApelido)) ccApelido, 
			tbc.ccRazaoSocial, 
			tbc.ccNomeFantasia, 
			tbc.ccEmail, 
			tbc.cvISS, 
			CAST(tbc.cvDescontos AS DECIMAL(10, 2)) cvDescontos,
			CASE
			    WHEN tbc.cbDescontoVariavel = 1
			    THEN 'Sim'
			    ELSE 'Não'
			END cbDescontoVariavel, 
			CONCAT(RIGHT(CONCAT('00', cvCodBanco), 3), ' - ', ccBanco) [ccBanco], 
			ISNULL(tbc.cvPgtoDias, 0) cvPgtoDias, 
			tbObs.observacao, 
			tbc.cvCNPJ
	   FROM   tbClinicas tbc
			LEFT JOIN tbBancos tbb ON tbc.idBanco = tbb.IdBanco
			LEFT JOIN tbObservacoes tbObs ON tbc.idObservacao = tbObs.IdObservacao
	   WHERE  TBC.ccApelido = @ccApelido;
    END;