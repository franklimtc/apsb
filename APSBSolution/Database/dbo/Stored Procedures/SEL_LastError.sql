
CREATE PROCEDURE SEL_LastError
AS
SELECT ErrorMessage, ccCriadoPor [User], ErrorProcedure FROM tbLogErro a WHERE idErro in 
(
SELECT MAX(idErro) FROM tbLogErro
)