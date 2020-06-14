CREATE PROCEDURE SEL_Bancos
(
@cvStatus BIT = 1
)
AS BEGIN
	SELECT bc.IdBanco, bc.ccBanco, bc.cvCodBanco, bc.cvStatus FROM tbBancos bc;
END;