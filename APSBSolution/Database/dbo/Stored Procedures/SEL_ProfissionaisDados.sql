
CREATE PROCEDURE SEL_ProfissionaisDados
(@IdProfissional INT)
AS BEGIN
SELECT
IdDadoProfissional
, idProfissional
, ccFormacao
, ccPosGraduacao
, ccEspecialidade
, ccConselho
, ISNULL(cvNumInscricao,0) cvNumInscricao
, ISNULL(cvTitulo,0) cvTitulo
, ISNULL(cvTituloZona,0) cvTituloZona
, ISNULL(cvTituloSecao,0)cvTituloSecao
, ISNULL(cvReservista,0) cvReservista
, ISNULL(cvPIS,0) cvPIS
FROM tbProfissionaisDados 
WHERE idProfissional = @IdProfissional
END