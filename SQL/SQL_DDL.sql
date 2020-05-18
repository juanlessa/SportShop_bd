GO
CREATE DATABASE [SPORT_SHOP]
GO

USE SPORT_SHOP

GO
CREATE SCHEMA SPORT_SHOP
GO

CREATE TYPE string FROM varchar(50);

--#################
--### ENTIDADES ###
--#################

--COMO GERAR UM ATRIBUTO/CHAVE COM VALOR RANDOM MAS TAMANHO PRÉ-DEFINIDO?

CREATE TABLE SPORT_SHOP.[Utilizador](
	nome	string NOT NULL,
	num_ID	int IDENTITY(10000000, 1),
	CONSTRAINT UTILIZADOR_PK PRIMARY KEY (num_ID)
);

CREATE TABLE SPORT_SHOP.[Cliente](
	mail	string NOT NULL,
	num_ID	int,
	CONSTRAINT CLIENTE_PK PRIMARY KEY (num_ID)
);

CREATE TABLE SPORT_SHOP.[Funcionario](
	work_ID	int IDENTITY(1, 1),
	num_ID int,
	[password]	string NOT NULL,		--falta limitador de minimo de carateres
	CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (work_ID)
);

CREATE TABLE SPORT_SHOP.[Produto](
	produto_ID	int IDENTITY(1000000000, 1),
	nome_Produto string NOT NULL,
	preco		real,
	loja_code	int,
	tipo_ID		int,
	CONSTRAINT PRODUTO_PK PRIMARY KEY (produto_ID)
);

CREATE TABLE SPORT_SHOP.[Tipo_Produto](
	tipo_ID		int,
	CONSTRAINT TIPO_PRODUTO_PK PRIMARY KEY (tipo_ID)
);

CREATE TABLE SPORT_SHOP.[Roupas_e_Sapatilhas](
	tamanho		string NOT NULL,
	tipo_ID		int,
	CONSTRAINT ROUPAS_SAP_PK PRIMARY KEY (tipo_ID)
);

CREATE TABLE SPORT_SHOP.[Halteres](
	peso		real,
	tipo_ID		int,
	CONSTRAINT HALTERES_PK PRIMARY KEY (tipo_ID)
);

CREATE TABLE SPORT_SHOP.[Acessorios_de_Desporto](
	nome_desporto	string,
	tipo_ID		int,
	CONSTRAINT ACESS_DESP_PK PRIMARY KEY (tipo_ID)
);	

CREATE TABLE SPORT_SHOP.[Loja](
	nomeLoja	string NOT NULL,
	endereco	string NOT NULL,
	codigo_postal	int,
	loja_code	int	IDENTITY(1, 1),
	CONSTRAINT LOJA_PK PRIMARY KEY (loja_code)
);

CREATE TABLE SPORT_SHOP.[Stock](
	quantidade_Loja	int,
	quantidade_Armazem	int,
	produto_ID int,
	loja_code	int,
	CONSTRAINT STOCK_PK PRIMARY KEY (loja_code)
);

CREATE TABLE SPORT_SHOP.[Venda](
	ID_venda	int IDENTITY(1, 1),
	data_venda	date,
	quantidade	int,
	loja_code	int,
	work_ID		int,
	num_ID		int,
	precoTotal	real,
	CONSTRAINT	VENDA_PK PRIMARY KEY (ID_venda)
);

--######################
--### RELAÇÕES N - M ###
--######################

CREATE TABLE SPORT_SHOP.[Inclui](
	ID_venda			int,
	produto_ID			int,
	quantidadeProduto	int,
	quantidadeTotal		int,
	CONSTRAINT INCLUI_PK PRIMARY KEY (ID_venda)
);

--##################
--### ALTERAÇÕES ###
--##################

ALTER TABLE SPORT_SHOP.[Cliente]	ADD FOREIGN KEY (num_ID)	REFERENCES SPORT_SHOP.[Utilizador](num_ID);
ALTER TABLE SPORT_SHOP.[Funcionario]	ADD FOREIGN KEY (num_ID)	REFERENCES SPORT_SHOP.[Utilizador](num_ID);
ALTER TABLE SPORT_SHOP.[Funcionario]	ADD loja_code	int;
ALTER TABLE SPORT_SHOP.[Funcionario]	ADD FOREIGN KEY (loja_code)	REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Produto]	ADD FOREIGN KEY (tipo_ID)	REFERENCES SPORT_SHOP.[Tipo_Produto](tipo_ID);
ALTER TABLE SPORT_SHOP.[Produto]	ADD FOREIGN KEY (loja_code)	REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Roupas_e_Sapatilhas]	ADD FOREIGN KEY (tipo_ID)	REFERENCES SPORT_SHOP.[Tipo_Produto](tipo_ID);
ALTER TABLE SPORT_SHOP.[Halteres]				ADD FOREIGN KEY (tipo_ID)	REFERENCES SPORT_SHOP.[Tipo_Produto](tipo_ID);
ALTER TABLE SPORT_SHOP.[Acessorios_de_Desporto]	ADD FOREIGN KEY (tipo_ID)	REFERENCES SPORT_SHOP.[Tipo_Produto](tipo_ID);

ALTER TABLE SPORT_SHOP.[Stock]	ADD FOREIGN KEY (loja_code)	REFERENCES SPORT_SHOP.[Loja](loja_code);
ALTER TABLE SPORT_SHOP.[Stock]	ADD FOREIGN KEY (produto_ID)	REFERENCES SPORT_SHOP.[Produto](produto_ID);
ALTER TABLE SPORT_SHOP.[Venda]	ADD FOREIGN KEY (num_ID)	REFERENCES SPORT_SHOP.[Cliente](num_ID);
ALTER TABLE SPORT_SHOP.[Venda]	ADD FOREIGN KEY (work_ID)	REFERENCES SPORT_SHOP.[Funcionario](work_ID);
ALTER TABLE SPORT_SHOP.[Venda]	ADD FOREIGN KEY (loja_code)	REFERENCES SPORT_SHOP.[Loja](loja_code);

ALTER TABLE SPORT_SHOP.[Inclui] ADD FOREIGN KEY (ID_venda) REFERENCES SPORT_SHOP.[Venda](ID_venda);
ALTER TABLE SPORT_SHOP.[Inclui] ADD FOREIGN KEY (produto_ID) REFERENCES SPORT_SHOP.[Produto](produto_ID);