--SELECT TOP 10 *  FROM tbImport03  WHERE NF = 5169



--UPDATE tbImport03 SET TX_ASSOC = REPLACE(TX_ASSOC, ',', '.')
CREATE PROCEDURE SPImport03  AS 

DECLARE @IdClinica          INT, 
		@cvNF               INT, 
		@qtd                INT, 
		@cvValor            FLOAT, 
		@cvValorPago        FLOAT, 
		@cdEmissao          DATETIME, 
		@cdPagamento        DATETIME, 
		@cvDesconto         FLOAT, 
		@cbIssRetido        BIT, 
		@cvDescontoISS      FLOAT, 
		@idReceita          INT, 
		@IdProfissional     INT, 
		@cvTaxaProfissional FLOAT;

DECLARE cReceita CURSOR
FOR SELECT idClinica, 
		   idProfissional, 
		   NF, 
		   TRY_CONVERT( FLOAT, VALOR_DA_NF)       valor, 
		   TRY_CONVERT( FLOAT, VALOR_PAGO)        valorPago, 
		   TRY_CAST(DATA_NF AS    DATETIME2)      dtEmissao, 
		   TRY_CAST(DT_PAGAMENTO AS    DATETIME2) dtPagamento,
		   CASE
			 WHEN ISNULL(ISS, '0')     ='0'
			 THEN DESCONTO * 100
			 WHEN ISNULL(ISS, '0')<>'0'
				  AND TRY_CONVERT(        FLOAT, DESCONTO)>0
			 THEN (DESCONTO-0.02) * 100
			 ELSE 0
		   END                                    DESCONTO,
		   CASE
			 WHEN ISNULL(ISS, '0')='0'
			 THEN 0
			 ELSE 1
		   END                                    ISS, 
		   2                                      valorISS, 
		   CAST(TX_ASSOC AS FLOAT)*100            cvTaxaProfissional
	  FROM tbImport03
	 WHERE idClinica IS NOT NULL
		   AND idProfissional IS NOT NULL
		   AND NF IS NOT NULL
		   AND qtdRepasse>1
		   AND idOrdemNF=1;

OPEN cReceita;

FETCH NEXT FROM cReceita INTO @IdClinica, 
							  @IdProfissional, 
							  @cvNF, 
							  @cvValor, 
							  @cvValorPago, 
							  @cdEmissao, 
							  @cdPagamento, 
							  @cvDesconto, 
							  @cbIssRetido, 
							  @cvDescontoISS, 
							  @cvTaxaProfissional; 

WHILE @@FETCH_STATUS=0
  BEGIN
--INSERIR RECEITAS
	--SELECT @qtd = COUNT(*)
	--  FROM tbReceitas
	-- WHERE cvNF=@cvNF;
	--IF @qtd=0
	--  BEGIN
	--	INSERT INTO tbReceitas
	--	( IdClinica, 
	--	  cvValor, 
	--	  cvValorPago, 
	--	  cdEmissao, 
	--	  cdPagamento, 
	--	  cvDesconto, 
	--	  cvNF, 
	--	  cbIssRetido, 
	--	  cvDescontoISS
	--	)
	--	VALUES
	--	(@IdClinica, @cvValor, @cvValorPago, @cdEmissao, @cdPagamento, @cvDesconto, @cvNF, @cbIssRetido, @cvDescontoISS);

	--END;
	  
-- INSERIR REPASSES
	SELECT @idReceita = idReceita
	  FROM tbReceitas
	 WHERE cvNF=@cvNF;

	SELECT @qtd = COUNT(*)
	  FROM tbProfissionalRepasse
	 WHERE idReceita=@idReceita
		   AND IdProfissional=@IdProfissional;

	IF @qtd=0
	   AND @idReceita IS NOT NULL
	  BEGIN
		INSERT INTO tbProfissionalRepasse
		( idReceita, 
		  IdProfissional, 
		  cvValor, 
		  ccStatus, 
		  ccCriadoPor, 
		  cvTaxaProfissional, 
		  dataRepasse
		)
		VALUES
		(@idReceita, @IdProfissional, @cvValor, 'R', 'ETL', @cvTaxaProfissional, @cdPagamento);
	END;
	FETCH NEXT FROM cReceita INTO @IdClinica, 
								  @IdProfissional, 
								  @cvNF, 
								  @cvValor, 
								  @cvValorPago, 
								  @cdEmissao, 
								  @cdPagamento, 
								  @cvDesconto, 
								  @cbIssRetido, 
								  @cvDescontoISS, 
								  @cvTaxaProfissional;

  END;

CLOSE cReceita;

DEALLOCATE cReceita;