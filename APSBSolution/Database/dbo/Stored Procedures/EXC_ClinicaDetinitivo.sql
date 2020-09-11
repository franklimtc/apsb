
CREATE PROCEDURE EXC_ClinicaDetinitivo
(
   @idClinica INT
)
AS
  BEGIN
	DELETE tbClinicaProfissional
	 WHERE idClinica=@idClinica;
	DELETE tbClinicas
	 WHERE IdClinica=@idClinica;
  END;