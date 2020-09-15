-- =============================================
-- Author:      Franklim Costa
-- Create Date: 13/09/2020
-- Description: Captura informações sobre os profissionais
-- =============================================

CREATE FUNCTION GetObservacoes
(
-- Add the parameters for the function here
@idProfissional INT
)
RETURNS VARCHAR(MAX)
AS
	BEGIN
	    -- Declare the return variable here
	    DECLARE @retorno VARCHAR(MAX);

	    -- Add the T-SQL statements to compute the return value here
	    SET @retorno =
	    (
		   SELECT r.idReceita [Receita], 
				c.ccApelido [Clinica], 
				CAST(tr.cvValor AS DECIMAL(20, 2)) [Valor], 
				SUM(CAST(tr.cvValor AS DECIMAL(20, 2))) OVER() [Valor_Total], 
				NULLIF(o.observacao, LAG(o.observacao, 1, 0) OVER(
				ORDER BY r.idreceita)) Observacao
		   FROM   tbProfissionalRepasse tr
				INNER JOIN tbReceitas r ON tr.idReceita = r.idReceita
									  AND r.cbStatus = 1
				INNER JOIN tbClinicas c ON r.IdClinica = c.IdClinica
				INNER JOIN tbClinicaProfissional cp ON tr.IdProfissional = cp.idProfissional
											    AND cp.cvStatus = 1
				LEFT JOIN tbObservacoes o ON cp.idObservacao = o.IdObservacao
		   WHERE  cp.IdProfissional = @idProfissional
				AND ccStatus = 'A' FOR JSON AUTO
	    );

	    -- Return the result of the function
	    RETURN @retorno;
	END;