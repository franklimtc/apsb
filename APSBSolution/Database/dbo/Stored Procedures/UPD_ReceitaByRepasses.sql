CREATE PROCEDURE UPD_ReceitaByRepasses
(@idReceita    INT, 
 @UserName     VARCHAR(100)
)
AS
    BEGIN
    SET NOCOUNT ON;
	   DECLARE @Result BIT= 0;
	   BEGIN TRY
		  UPDATE    tbReceitas
		    SET     
			   cvValor = rp.valor, 
			   cvValorPago = CAST(rp.valor - (rp.valor * (cvDesconto + cvDescontoISS) / 100) AS DECIMAL(20, 2))
		  FROM      tbReceitas r
				  INNER JOIN
		  (
			 SELECT idReceita, 
				   CAST(SUM(ISNULL(cvValor, 0)) AS DECIMAL(20, 2)) valor
			 FROM   tbProfissionalRepasse
			 WHERE  ccStatus <> 'C'
				   AND idReceita = @idReceita
			 GROUP BY idReceita
		  ) rp ON R.idReceita = RP.idReceita;
		  SET @Result = 1;
	   END TRY
	   BEGIN CATCH
		  INSERT INTO tbLogErro
			    SELECT ERROR_NUMBER() AS ErrorNumber, 
					 ERROR_SEVERITY() AS ErrorSeverity, 
					 ERROR_STATE() AS ErrorState, 
					 ERROR_PROCEDURE() AS ErrorProcedure, 
					 ERROR_LINE() AS ErrorLine, 
					 ERROR_MESSAGE() AS ErrorMessage, 
					 GETDATE() AS Data, 
					 @UserName AS ccCriadoPor;
	   END CATCH;
	   SELECT @Result;
    END;