USE SPORT_SHOP;
GO

--duvidas:
--	como organizar por ordem decrescente
--	Stock - devemos declarar as quantidades com OUT?

--	devemos ter um metodo de para quando a loja recebe carregamento de roupa poder alterar o numero da quantidadade loja e armazem

-- ==================
-- === UTILIZADOR ===
-- ==================

CREATE PROC p_Create_Utilizador(@nome varchar(50), @num_ID int OUT)
AS
	INSERT INTO SPORT_SHOP.[Utilizador](nome, num_ID) VALUES (@nome, @num_ID);
GO

-- ===============
-- === CLIENTE ===
-- ===============
GO
CREATE PROC	p_Create_Cliente(@mail varchar(50), @nome varchar(50))
AS
	DECLARE @num_ID AS int;
	EXEC p_Create_Utilizador @nome=@nome, @num_ID=@num_ID OUT;
	INSERT INTO SPORT_SHOP.[Cliente](mail, num_ID) VALUES (@mail, @num_ID);
	RETURN 0;
GO

-- ===================
-- === FUNCIONARIO ===
-- ===================
GO
CREATE PROC	p_Create_Funcionario(@work_ID int, @[password] varchar(50), @nome varchar(50))
AS
	DECLARE @num_ID AS int;
	EXEC p_Create_Utilizador @nome=@nome, @num_ID=@num_ID OUT;
	INSERT INTO SPORT_SHOP.[Funcionario](work_ID, [password], num_ID) VALUES (@work_ID, @[password], @num_ID);
	RETURN 0;
GO

-- =============
-- === STOCK ===
-- =============
GO
CREATE PROC p_Create_Stock(@produto_ID int, @loja_code int, @quantidade_Loja int OUT, @quantidade_Armazem int OUT)
AS
	INSERT INTO SPORT_SHOP.[Stock](produto_ID, loja_code, quantidade_Loja, quantidade_Armazem) VALUES (@produto_ID, @loja_code, 0, 0);
GO

-- ===============
-- === PRODUTO ===
-- ===============
GO
CREATE PROC	p_Create_Produto(@produto_ID int OUT, @nome varchar(50), @preco real, @loja_code int, @tipo_ID int)
AS
	SET @produto_ID =	SCOPE_IDENTITY()
	INSERT INTO SPORT_SHOP.Produto(nome, preco, loja_code, tipo_ID) VALUES (@nome, @preco, @loja_code, @tipo_ID);
	EXEC p_Create_Stock @loja_code=@loja_code, @produto_ID=@produto_ID;
	RETURN 0;
GO

-- =============
-- === VENDA ===
-- =============
GO
CREATE PROC	p_Create_Venda(@ID_venda int OUT, @data_venda	date, @quantidade	int, @loja_code	int, @work_ID int, @num_ID int, @precoTotal real)
AS
	SET @ID_venda =	SCOPE_IDENTITY()
	INSERT INTO SPORT_SHOP.[Venda]
			    ( data_venda,  loja_code,  work_ID,  num_ID) 
		VALUES ( @data_venda, @loja_code, @work_ID, @num_ID);
GO

CREATE PROC	p_AddProduct_Venda(@ID_venda int, @produto_ID int, @quantidade int)
