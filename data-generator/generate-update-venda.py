import random
#produtos
aux = "1000000000,17.95,1000000003,5.00,1000000006,7.50,1000000009,3.99,1000000012,15.50,1000000015,5.00,1000000018,55.00,1000000021,29.99,1000000024,4.50,1000000027,29.99,1000000030,119.99,1000000033,89.99,1000000036,140.00,1000000039,19.99,1000000042,69.99,1000000045,15.00,1000000048,19.99,1000000051,25.00,1000000054,66.00,1000000057,39.99,1000000060,24.99,1000000063,7.00,1000000066,49.99,1000000069,15.99,1000000072,39.99,1000000075,59.99,1000000078,	6.00,1000000081,	58.99,1000000084,	49.99,1000000087,	35.99,1000000090,	19.99,1000000093,	49.99,1000000096,	39.99,1000000099,	38.99,1000000102,	5.99,1000000105,	59.99,1000000108,	34.99,1000000111,	19.99,1000000114,	4.00,1000000117,	14.99,1000000120,	29.99,1000000123,	24.99,1000000126,	69.99,1000000129,	9.99,1000000132,	14.99,1000000135,89.99,1000000138,	29.99,1000000141,	34.99,1000000144,	54.99,1000000147,	39.99,1000000150,	9.99,1000000153,	19.99,1000000156,	40.00,1000000159,	27.99,1000000162,	84.99,1000000165,	15.99,1000000168,	45.00,1000000171,	49.99,1000000174,	25.00,1000000177,	29.99,1000000180,	34.99,1000000183,	109.99,1000000186,	34.99,1000000189,	17.99,1000000192,	12.99,1000000195,	19.99,1000000198,	9.99,1000000201,	8.99,1000000204,	7.99,1000000207,	7.99,1000000210,	14.99,1000000213,	25.99,1000000216,	26.99,1000000219,	82.99,1000000222,	37.99,1000000225,	21.99,1000000228,	29.99,1000000231,	34.99,1000000234,	16.99,1000000237,	30.99,1000000240,	27.99,1000000243,	7.99,1000000246,	2.99,1000000249,	76.99,1000000252,	5.99,1000000255,	11.99,1000000258,	9.99,1000000261,	29.99,1000000264,	67.99,1000000267,	75.99,1000000270,27.99,1000000273,10.99,1000000276,	6.99,1000000279,	5.99,1000000282,	26.99,1000000285,	96.99,1000000288,	13.99,1000000291,	97.99,1000000294,	8.99,1000000297,	18.99,1000000300,	8.99,1000000303,	29.99,1000000306,	71.99,1000000309,	10.99,1000000312,	12.00,1000000315,	14.99,1000000318,	24.99,1000000321,	20.99,1000000324,	19.99,1000000327,	39.99,1000000330,	34.99,1000000333,	45.00,1000000336,	34.99,1000000339,	50.00,1000000342,	6.50,1000000345,	9.99,1000000348,	4.00,1000000351,	7.99,1000000354,	6.00,1000000357,	29.99,1000000360,	49.99,1000000363,	3.99,1000000366,	3.99,1000000369,	3.99,1000000372,	24.99,1000000375,	14.99"
aux = aux.split(",")
loja1_produtos = []
for i in range(0,len(aux)-1,2):
    loja1_produtos.append([ int(str(aux[i]).strip()), float(str(aux[i+1]).strip()) ])
loja2_produtos = []
loja3_produtos = []
for i, p in loja1_produtos:
    loja2_produtos.append([ i+1, p])
    loja3_produtos.append([ i+2, p])
#clientes
clientes = "15208428 12176552 15312303 10491988 14988942 15905420 16640869 19452731 18593718 11769137 17447686 18076783 14825962 18071908 10552344 11645825 12505291 13651412 12727951 17770398 18093333 17880704 14927762 13852279 19060481 19511695 10609422 19359971 15779662 14202762 18443231 16933652 10532028 19484298 10929079 11295867 17595671 18762889 19446914 10182109 10630263 12020799 10176924 11841118 17371425 11135420 14420369 13509096 12609491 17702370 13176638 12672454 17676222 17802983 15939048 19729784 16782187 16520257 11400459 19531058 12601052 16101490 16741818 19876652 19937575 16605959 18642467 16212112 12098117 14240553"
clientes = clientes.split()
#loja
loja = [1, 2, 3]
#funcionarios
loja1_funcionarios = []
loja2_funcionarios = []
loja3_funcionarios = []
for i in range(10000,10030,3):
    loja1_funcionarios.append(i)
    loja2_funcionarios.append(i+1)
    loja3_funcionarios.append(i+2)

#venda
dia = 10
mes = 1
ID_venda = 0
for i in range(133):
    loja_code = random.choice(loja)
    ID_venda += 1
    total_p = 0
    total_q = 0
    a = []
    escolhidos = []
    if loja_code == 1:
        work_ID = random.choice(loja1_funcionarios)
        for j in range(random.randint(1,10)):
            prod = random.choice(loja1_produtos)
            while prod[0] in escolhidos:
                prod = random.choice(loja1_produtos)
            escolhidos.append(prod[0])
            quant = random.randint(1,6)
            total_p += prod[1]*quant
            total_q +=quant
            a.append(f"INSERT INTO SPORT_SHOP.[Inclui](ID_venda, produto_ID, quantidadeProduto) VALUES ({ID_venda}, {prod[0]}, {quant})")

    elif loja_code == 2:
        work_ID = random.choice(loja2_funcionarios)
        for j in range(random.randint(1,10)):
            prod = random.choice(loja2_produtos)
            while prod[0] in escolhidos:
                prod = random.choice(loja2_produtos)
            escolhidos.append(prod[0])
            quant = random.randint(1,6)
            total_p += prod[1]*quant
            total_q +=quant
            a.append(f"INSERT INTO SPORT_SHOP.[Inclui](ID_venda, produto_ID, quantidadeProduto) VALUES ({ID_venda}, {prod[0]}, {quant})")

    elif loja_code == 3:
        work_ID = random.choice(loja3_funcionarios)
        for j in range(random.randint(1,10)):
            prod = random.choice(loja3_produtos)
            while prod[0] in escolhidos:
                prod = random.choice(loja3_produtos)
            escolhidos.append(prod[0])
            quant = random.randint(1,6)
            total_p += prod[1]*quant
            total_q +=quant
            a.append(f"INSERT INTO SPORT_SHOP.[Inclui](ID_venda, produto_ID, quantidadeProduto) VALUES ({ID_venda}, {prod[0]}, {quant})")
    
    num_ID = random.choice(clientes)
    total_p = "{:.2f}".format(total_p)
    print(f"INSERT INTO SPORT_SHOP.[Venda](data_venda,  loja_code,  work_ID,  num_ID, quantidade, precoTotal) VALUES ( '2020-0{mes}-{dia}', {loja_code}, {work_ID}, {num_ID}, {total_q}, {total_p})")
    for i in a:
        print(i)
    if dia < 28:
        dia += 1 
    else:
        dia = 10
        mes += 1
    print("")
