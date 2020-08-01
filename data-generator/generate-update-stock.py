import random

inicio = 1000000000     #first produto_ID
fim =    1000000378     #last produto_ID + 1

for i in range(inicio, fim):
    produto_ID = i
    sloja = random.randint(3, 10)   #quantidade_loja
    sarm = random.randint(10, 50)   #quantidade_armazem

    print("UPDATE SPORT_SHOP.[Stock] SET quantidade_Loja = {}, quantidade_Armazem = {} WHERE produto_ID = {}".format(sloja, sarm, produto_ID))

    
