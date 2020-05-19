USE SPORT_SHOP;
GO

-- marcar a opção de ao deletar um utilizador todas as suas vendas/ compra tenham seu num_ID a 0
-- criar trigger AFTER INSERT na tabela INCLUI para recalcular a quantidade e precoTotal na tabela VENDA

--================
--===UTILIZADOR===
--================

CREATE TRIGGER t_Delete_Utilizador ON SPORT_SHOP.[Utilizador] BEFORE DELETE
AS
	DECLARE @num_ID AS int;
	SELECT @num_ID=num_ID FROM deleted;
	-- BEGIN TRANSACTION
	DELETE SPORT_SHOP.[Cliente] WHERE SPORT_SHOP.[Cliente].num_ID=@num_ID;
	DELETE SPORT_SHOP.[Funcionario] WHERE SPORT_SHOP.[Funcionario].num_ID=@num_ID;
	-- COMMIT
	--- ROLLBACK
GO

--=============
--===PRODUTO===
--=============
GO
CREATE TRIGGER t_Delete_Produto ON SPORT_SHOP.[Produto] AFTER DELETE
AS
	DECLARE @produto_ID AS int;
	SELECT @produto_ID=produto_ID FROM deleted;
	-- apagar INCLUI desse produto ( e recalcular o valor e quantidades das vendas)
GO
