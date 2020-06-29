﻿CREATE PROCEDURE SEL_DespesaTipo 
(
	@tipo VARCHAR(20) = 'Despesa'
)
AS BEGIN  
if @tipo = 'Despesa' OR @tipo IS NULL
	BEGIN
		SELECT idtipo, ccTipo FROM tbDespesaTipo ORDER BY 2
	END
	ELSE IF @tipo = 'Receita'
	BEGIN
		SELECT IdClinica idtipo, ccApelido ccTipo FROM tbClinicas WHERE cvStatus = 1  ORDER BY 2

	END
END