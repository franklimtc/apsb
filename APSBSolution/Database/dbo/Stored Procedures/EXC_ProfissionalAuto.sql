   
CREATE PROCEDURE EXC_ProfissionalAuto        
(          
	@UserName VARCHAR(30)      
	,@Token VARCHAR(100)          
)          
AS BEGIN            
 SET NOCOUNT ON            
 DECLARE @Result BIT = 0;      
      
 BEGIN TRY              
	ALTER TABLE tbClinicaProfissional NOCHECK CONSTRAINT FK__tbClinica__idPro__01142BA1;
	ALTER TABLE tbEndereco  NOCHECK CONSTRAINT FK__tbEnderec__idPro__05D8E0BE;
	ALTER TABLE tbProfissionaisBancos  NOCHECK CONSTRAINT FK__tbProfiss__idPro__08B54D69;
	ALTER TABLE tbProfissionaisDados  NOCHECK CONSTRAINT FK__tbProfiss__idPro__09A971A2;
	ALTER TABLE tbProfissionalArquivo  NOCHECK CONSTRAINT FK__tbProfiss__idPro__0A9D95DB;
	ALTER TABLE tbProfissionalRepasse  NOCHECK CONSTRAINT FK__tbProfiss__IdPro__0C85DE4D;

	DELETE tbProfissionais  WHERE DBO.FN_TokenAuto(IdProfissional, cdDataCriacao) = @Token ;  

	ALTER TABLE tbClinicaProfissional CHECK CONSTRAINT FK__tbClinica__idPro__01142BA1;
	ALTER TABLE tbEndereco  CHECK CONSTRAINT FK__tbEnderec__idPro__05D8E0BE;
	ALTER TABLE tbProfissionaisBancos  CHECK CONSTRAINT FK__tbProfiss__idPro__08B54D69;
	ALTER TABLE tbProfissionaisDados  CHECK CONSTRAINT FK__tbProfiss__idPro__09A971A2;
	ALTER TABLE tbProfissionalArquivo  CHECK CONSTRAINT FK__tbProfiss__idPro__0A9D95DB;
	ALTER TABLE tbProfissionalRepasse  CHECK CONSTRAINT FK__tbProfiss__IdPro__0C85DE4D;         
            
  SET @Result = 1;            
 END TRY            
 BEGIN CATCH            
  INSERT INTO tbLogErro            
  SELECT              
  ERROR_NUMBER() AS ErrorNumber              
  ,ERROR_SEVERITY() AS ErrorSeverity              
  ,ERROR_STATE() AS ErrorState              
  ,ERROR_PROCEDURE() AS ErrorProcedure              
  ,ERROR_LINE() AS ErrorLine              
  ,ERROR_MESSAGE() AS ErrorMessage            
  ,GETDATE() AS Data             
  ,@UserName AS ccCriadoPor;              
 END CATCH            
             
 SELECT @Result;            
END