CREATE PROCEDURE EXC_ProfissionalDetinitivo(@idProfisional INT)  
AS  
    BEGIN  
    DELETE tbProfissionalRepasse  
    WHERE  IdProfissional IN(@idProfisional);  
    DELETE tbEndereco  
    WHERE  IdProfissional IN(@idProfisional);  
    DELETE tbClinicaProfissional  
    WHERE  IdProfissional IN(@idProfisional);  
    DELETE tbProfissionaisDados  
    WHERE  IdProfissional IN(@idProfisional);  
    DELETE tbProfissionaisBancos  
    WHERE  IdProfissional IN(@idProfisional);  
    DELETE tbProfissionais  
    WHERE  IdProfissional IN(@idProfisional);  
    END;