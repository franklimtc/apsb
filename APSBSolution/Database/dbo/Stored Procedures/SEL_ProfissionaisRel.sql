CREATE PROCEDURE SEL_ProfissionaisRel AS
BEGIN
SELECT *
FROM   tbProfissionais p
	  LEFT JOIN tbProfissionaisDados d ON p.IdProfissional = d.idProfissional
	  LEFT JOIN tbEndereco e on p.IdProfissional = e.idProfissional
	  LEFT JOIN tbProfissionaisBancos b on p.IdProfissional = b.idProfissional
	  LEFT JOIN tbBancos bb on b.idBanco = bb.IdBanco
WHERE  p.cvStatus = 1;
END;