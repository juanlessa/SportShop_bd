USE SPORT_SHOP
--doubts:
-- como ordenar a data por ordem contrária

-- ===============
-- === INDEXES ===
-- ===============

CREATE INDEX i_Utilizador_nome ON SPORT_SHOP.[Utilizador](nome);
CREATE INDEX i_Produto_tipoID_nome ON SPORT_SHOP.[Produto](tipo_ID, nome);
CREATE INDEX i_Loja_lojacode ON SPORT_SHOP.[Loja](loja_code);
CREATE INDEX i_Venda_dataVenda_IDvenda ON SPORT_SHOP.[Venda](data_venda, venda_ID);
