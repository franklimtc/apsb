-- ==========================================================================================
-- Author:     Franklim Costa
-- Create Date: 12/09/2020
-- Description: Identifica os bancos dos profissionais e retorna em JSON.
-- ==========================================================================================

CREATE FUNCTION GetBancos
(
-- Add the parameters for the function here
@idProfissional INT
)
RETURNS VARCHAR(MAX)
AS
	BEGIN
	    DECLARE @json AS VARCHAR(MAX);
	    -- Declare the return variable here
	    SET @json =
	    (
		   SELECT b.cvCodBanco, 
				b.ccBanco
		   FROM   tbProfissionaisBancos pb
				INNER JOIN tbBancos b ON pb.idBanco = b.IdBanco
		   WHERE  idProfissional = @idProfissional
				AND pb.cvStatus = 1 FOR JSON AUTO
	    );
	    RETURN @json;
	END;