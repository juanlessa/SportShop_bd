USE SPORT_SHOP
GO
-- =============
-- === STOCK ===
-- =============

CREATE TRIGGER t_Create_Stock ON SPORT_SHOP.[Produto] AFTER INSERT
AS
	DECLARE @produto_ID int
	DECLARE @loja_code int
	BEGIN TRY
		BEGIN TRANSACTION
			SET @produto_ID = @@IDENTITY
			SELECT @loja_code = loja_code FROM SPORT_SHOP.[Produto] WHERE produto_ID = @produto_ID
			INSERT INTO SPORT_SHOP.[Stock](produto_ID, loja_code, quantidade_Loja, quantidade_Armazem) VALUES (@produto_ID, @loja_code, 0, 0)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO