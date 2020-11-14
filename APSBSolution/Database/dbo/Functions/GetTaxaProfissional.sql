

CREATE FUNCTION GetTaxaProfissional
(
   @idReceita      INT, 
   @cvValor        DECIMAL(20, 2), 
   @idProfissional INT
)
RETURNS DECIMAL(10, 2)
AS
  BEGIN

	DECLARE @idClinica    INT, 
			@descVariavel BIT, 
			@taxaFinal    DECIMAL(20, 2), 
			@cvCorte      DECIMAL(20, 2), 
			@txMenor      DECIMAL(20, 2), 
			@txMaior      DECIMAL(20, 2);

	SELECT @idClinica = idClinica
	  FROM tbReceitas
	 WHERE idReceita=@idReceita;

	SELECT @descVariavel = ISNULL(cbDescontoVariavel, 0)
	  FROM tbClinicas
	 WHERE IdClinica=@idClinica;

	IF @descVariavel=1
	  BEGIN
		SELECT @cvCorte = D.cvValorCorte, 
			   @txMenor = D.cvValorMenor, 
			   @txMaior = D.cvValorMaior
		  FROM tbClinicas C
		  INNER JOIN tbDescontoVariavelClinicas D ON C.IdClinica=D.idClinica
		 WHERE C.IdClinica=@idClinica
			   AND D.cbStatus=1;

		IF @cvValor<=@cvCorte
		   AND @txMaior IS NOT NULL
		   AND @txMenor IS NOT NULL
		  BEGIN
			SET @taxaFinal = @txMenor;
		END
		  ELSE
		  BEGIN
			SET @taxaFinal = @txMaior;
		END;

	END;

	IF @descVariavel=0
	   OR @taxaFinal IS NULL
	  BEGIN
		SELECT @taxaFinal = cvTaxaProfissional
		  FROM tbClinicaProfissional
		 WHERE idClinica=@idClinica
			   AND idProfissional=@idProfissional
			   AND cvStatus=1;
	END;

	RETURN @taxaFinal;
  END;