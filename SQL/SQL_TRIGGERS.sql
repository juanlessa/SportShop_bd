USE SPORT_SHOP;

--================
--===UTILIZADOR===
--================
GO
CREATE TRIGGER t_Delete_Utilizador ON SPORT_SHOP.[Utilizador] AFTER DELETE
AS
	DECLARE @num_ID AS int;
	SELECT @num_ID=num_ID FROM deleted;
	DELETE SPORT_SHOP.[Cliente] WHERE SPORT_SHOP.[Cliente].num_ID=@num_ID;
	DELETE SPORT_SHOP.[Funcionario] WHERE SPORT_SHOP.[Funcionario].num_ID=@num_ID;
GO

--=============
--===PRODUTO===
--=============
GO
CREATE TRIGGER t_Delete_Produto ON SPORT_SHOP.[Produto] AFTER DELETE
AS
	DECLARE @produto_ID AS int;
	SELECT @produto_ID=produto_ID FROM deleted;
GO
