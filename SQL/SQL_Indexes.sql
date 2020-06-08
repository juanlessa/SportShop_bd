USE SPORT_SHOP
GO

-- ===============
-- === INDEXES ===
-- ===============

CREATE INDEX i_produto_nome ON SPORT_SHOP.[Produto](tipo_ID, nome_Produto, marca, especificidade, loja_code)
