USE SPORT_SHOP;
GO

-- ================
-- ===  CLIENTE ===
-- ================

CREATE PROC	p_Create_Cliente(@num_ID int, @mail varchar(50), @nome varchar(50))
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORT_SHOP.[Utilizador](nome, num_ID) VALUES (@nome, @num_ID)
			INSERT INTO SPORT_SHOP.[Cliente](mail, num_ID) VALUES (@mail, @num_ID)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO


CREATE PROC	p_Delete_Cliente(@num_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE SPORT_SHOP.[Cliente] WHERE num_ID = @num_ID
			DELETE SPORT_SHOP.[Utilizador] WHERE num_ID = @num_ID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO


-- ===================
-- === FUNCIONARIO ===
-- ===================

CREATE PROC	p_Create_Funcionario(@num_ID int, @password varchar(50), @nome varchar(50))
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORT_SHOP.[Utilizador](nome, num_ID) VALUES (@nome, @num_ID)
			INSERT INTO SPORT_SHOP.[Funcionario]([password], num_ID) VALUES (@password, @num_ID)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO

CREATE PROC	p_Delete_Funcionario(@work_ID int)
AS
	DECLARE @num_ID int
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT @num_ID = num_ID FROM SPORT_SHOP.[Funcionario] WHERE work_ID = @work_ID
			DELETE SPORT_SHOP.[Funcionario] WHERE work_ID = @work_ID
			DELETE SPORT_SHOP.[Utilizador] WHERE num_ID = @num_ID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO

-- =============
-- === STOCK ===
-- =============

CREATE PROC P_Update_Stock(@produto_ID int, @loja_code int, @quantidade_Loja int, @quantidade_Armazem int)
AS
    BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @existe_Loja int
			DECLARE @existe_Armazem int
			SELECT @existe_Loja = quantidade_Loja, @existe_Armazem = quantidade_Armazem FROM SPORT_SHOP.[Stock] WHERE produto_ID = @produto_ID AND loja_code = loja_code
			UPDATE SPORT_SHOP.[Stock] SET quantidade_Loja = @existe_Loja + @quantidade_Loja, quantidade_Armazem = @existe_Armazem + @quantidade_Armazem WHERE produto_ID = @produto_ID AND loja_code = loja_code
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO

-- ===============
-- === PRODUTO ===
-- ===============

CREATE PROC	p_Create_Produto(@nome varchar(50), @marca varchar(50), @especificidade varchar(50), @preco money, @loja_code int, @tipo_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES (@nome, @marca, @especificidade, @preco, @loja_code, @tipo_ID)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO


-- =============
-- === VENDA ===
-- =============

CREATE PROC	p_Create_Venda(@data_venda date, @loja_code	int, @work_ID int, @num_ID int)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO SPORT_SHOP.[Venda](data_venda,  loja_code,  work_ID,  num_ID, quantidade, precoTotal) VALUES (@data_venda, @loja_code, @work_ID, @num_ID, 0, 0.00)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
GO



