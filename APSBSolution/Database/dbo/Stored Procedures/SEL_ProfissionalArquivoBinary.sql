CREATE PROCEDURE SEL_ProfissionalArquivoBinary  
(  
 @idArquivo INT  
)  
AS BEGIN  
  
 SELECT ccNomeArquivo, binaryFile  
 FROM tbProfissionalArquivo  
 WHERE idArquivo = @idArquivo  
  
END