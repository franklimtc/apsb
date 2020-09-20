

CREATE FUNCTION GetTaxaProfissional
(
@idReceita INT
, @cvValor DECIMAL(20,2)
, @idProfissional INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    DECLARE @idClinica INT, @descVariavel BIT, @taxaFinal DECIMAL(20, 2), @cvCorte DECIMAL(20, 2), @txMenor DECIMAL(20, 2), @txMaior DECIMAL(20, 2);

    SELECT @idClinica = idClinica FROM tbReceitas where idReceita = @idReceita;

    SELECT @descVariavel = ISNULL(cbDescontoVariavel,0 ) FROM tbClinicas WHERE IdClinica = @idClinica;

    IF @descVariavel =1
    BEGIN
	   SELECT
			 @cvCorte = D.cvValorCorte, 
			 @txMenor = D.cvValorMenor, 
			 @txMaior = D.cvValorMaior
	   FROM   tbClinicas C
			 INNER JOIN tbDescontoVariavelClinicas D ON C.IdClinica = D.idClinica
	   WHERE  C.IdClinica = @idClinica
			 AND D.cbStatus = 1;

			 IF @cvValor <= @cvCorte AND @txMaior IS NOT NULL AND @txMenor IS NOT NULL
			 SET @taxaFinal = @txMenor
			 ELSE
			 SET @taxaFinal = @txMaior

    END

    IF @descVariavel = 0 or @taxaFinal IS NULL
    BEGIN
	   SELECT @taxaFinal = cvTaxaProfissional FROM tbClinicaProfissional WHERE idClinica = @idClinica AND idProfissional = @idClinica AND cvStatus = 1;
    END

    RETURN @taxaFinal
END