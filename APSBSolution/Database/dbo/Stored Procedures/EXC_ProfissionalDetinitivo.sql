CREATE PROCEDURE EXC_ProfissionalDetinitivo(@idProfisional INT)
AS
    BEGIN
	   DELETE tbClinicaProfissional
	   WHERE  IdProfissional IN(@idProfisional);
	   DELETE tbProfissionaisBancos
	   WHERE  IdProfissional IN(@idProfisional);
	   DELETE tbProfissionais
	   WHERE  IdProfissional IN(@idProfisional);
    END;