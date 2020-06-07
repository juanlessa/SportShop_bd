GO
CREATE DATABASE [SPORT_SHOP]
GO

USE SPORT_SHOP
GO

CREATE SCHEMA SPORT_SHOP
GO

CREATE TYPE string FROM varchar(50);
GO

--#################
--### ENTIDADES ###
--#################


CREATE TABLE SPORT_SHOP.[Utilizador](
	nome		string NOT NULL,
	num_ID		int NOT NULL, --cartao cidadao
	CONSTRAINT UTILIZADOR_PK PRIMARY KEY (num_ID)
);

CREATE TABLE SPORT_SHOP.[Cliente](
	mail		string NOT NULL,
	num_ID		int,
	CONSTRAINT CLIENTE_PK PRIMARY KEY (num_ID)
);

CREATE TABLE SPORT_SHOP.[Funcionario](
	work_ID			int IDENTITY(10000, 1),
    loja_code		int,
	num_ID 			int,
	[password]		string NOT NULL,		
	CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (work_ID)
);


CREATE TABLE SPORT_SHOP.[Loja](
	nomeLoja		string NOT NULL,
	endereco		string NOT NULL,
	codigo_postal	string NOT NULL,
	loja_code		int	IDENTITY(1, 1),
	CONSTRAINT LOJA_PK PRIMARY KEY (loja_code)
);

CREATE TABLE SPORT_SHOP.[Stock](
	quantidade_Loja		int,
	quantidade_Armazem	int,
	produto_ID 			int,
	loja_code			int,
	CONSTRAINT STOCK_PK PRIMARY KEY (loja_code, produto_ID)
);


CREATE TABLE SPORT_SHOP.[Venda](
	ID_venda	int IDENTITY(1, 1),
	data_venda	date,
	quantidade	int, --total de itens
	loja_code	int,
	work_ID		int default(0),
	num_ID		int default(0), 
	precoTotal	money,
	CONSTRAINT	VENDA_PK PRIMARY KEY (ID_venda)
);



CREATE TABLE SPORT_SHOP.[Produto](
	produto_ID		int IDENTITY(1000000000, 1),
	nome_Produto	string NOT NULL,
	marca			string NOT NULL,
	especificidade	string NOT NULL,
	preco			money,
	loja_code		int,
	tipo_ID			int,
	CONSTRAINT PRODUTO_PK PRIMARY KEY (produto_ID)
);

--######################
--### RELAÇÕES N - M ###
--######################

CREATE TABLE SPORT_SHOP.[Inclui](
	ID_venda			int,
	produto_ID			int,
	quantidadeProduto	int,
	CONSTRAINT INCLUI_PK PRIMARY KEY (ID_venda, produto_ID)
);

--###################
--### FOREIGN KEY ###
--###################

ALTER TABLE SPORT_SHOP.[Cliente]					ADD FOREIGN KEY (num_ID)			REFERENCES SPORT_SHOP.[Utilizador](num_ID);
ALTER TABLE SPORT_SHOP.[Funcionario]				ADD FOREIGN KEY (num_ID)			REFERENCES SPORT_SHOP.[Utilizador](num_ID);
ALTER TABLE SPORT_SHOP.[Funcionario]				ADD FOREIGN KEY (loja_code)			REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Produto]					ADD FOREIGN KEY (loja_code)			REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Stock]						ADD FOREIGN KEY (loja_code)			REFERENCES SPORT_SHOP.[Loja](loja_code);
ALTER TABLE SPORT_SHOP.[Stock]						ADD FOREIGN KEY (produto_ID)		REFERENCES SPORT_SHOP.[Produto](produto_ID);

ALTER TABLE SPORT_SHOP.[Venda]						ADD FOREIGN KEY (num_ID)			REFERENCES SPORT_SHOP.[Cliente](num_ID) 			ON DELETE SET DEFAULT; 
ALTER TABLE SPORT_SHOP.[Venda]						ADD FOREIGN KEY (work_ID)			REFERENCES SPORT_SHOP.[Funcionario](work_ID) 		ON DELETE SET DEFAULT;
ALTER TABLE SPORT_SHOP.[Venda]						ADD FOREIGN KEY (loja_code)			REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Inclui] 					ADD FOREIGN KEY (ID_venda) 			REFERENCES SPORT_SHOP.[Venda](ID_venda);
ALTER TABLE SPORT_SHOP.[Inclui] 					ADD FOREIGN KEY (produto_ID)		REFERENCES SPORT_SHOP.[Produto](produto_ID);