import random
nome = [["T-Shirt", "Calções", "Fato de Treino", 'Meias', "Boxers", "Calças", "Sweatshirt"],
        ["Sapatilhas Casual", "Sapatilhas Fitness", "Sapatilhas Running", "Sapatilhas Trail", "Sapatilhas Ciclismo"],
        ["Halteres", "Kettlebell", "Disco Borracha", "Power Bag"],
        ["Bola"]]
marca = ["Nike", "Adidas", "Puma", "ASICS", "Champion", "FILA", "Jordan Brand", "Lacoste", "New Balance", "Under Armour"]
especificidade = [[ "XS", "S", "M", "L", "XL"],
                  ["35","36","37","38","39","40","41","42","43","44"],
                  ["1kg","2kg","5kg","7.5kg","10kg","12.5kg","15kg","17.5kg","20kg","25kg","27.5kg","30kg"],
                  ["Futebol", "Basquetebol", "Voleibol", "Andebol", "Golfe", "Ténis", "Basebol", "Ping-Pong"]]



for i in range(33):
    tipo = random.randint(0,3)
        
    rnome = random.choice(nome[tipo])
    rmarca = random.choice(marca)
    respecificidade = random.choice(especificidade[tipo])

    if tipo == 0:
        if rnome == "T-Shirt":
            preco = random.randint(10, 35)
        elif rnome == "Calções":
            preco = random.randint(5, 25)
        elif rnome == "Fato de Treino":
            preco = random.randint(15, 35)
        elif rnome == 'Meias':
                preco = random.randint(1, 7)
        elif rnome == "Boxers":
            preco = random.randint(4, 25)
        elif rnome == "Calças":
                preco = random.randint(5, 25)
        elif rnome == "Sweatshirt":
                preco = random.randint(10, 35)
    elif tipo == 1:
        if rnome == "Sapatilhas Casual":
            preco = random.randint(35, 75)
        elif rnome == "Sapatilhas Fitness":
            preco = random.randint(55, 110)
        elif rnome == "Sapatilhas Running":
            preco = random.randint(65, 129)
        elif rnome == "Sapatilhas Trail":
            preco = random.randint(60, 95)
        elif rnome =="Sapatilhas Ciclismo":
            preco = random.randint(40, 80)
    elif tipo == 2:
        if rnome == "Halteres":
            preco = random.randint(9, 30)
        elif rnome == "Kettlebell":
            preco = random.randint(9, 30)
        elif rnome == "Disco Borracha":
            preco = random.randint(9, 30)
        elif rnome == "Power Bag":
            preco = random.randint(5, 30)
    elif tipo == 3:
        if rnome == "Bola":
            preco = random.randint(5, 30)



    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', {}.99, 1, {});".format(rnome, rmarca, respecificidade, preco, tipo+1))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', {}.99, 2, {});".format(rnome, rmarca, respecificidade, preco, tipo+1))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', {}.99, 3, {});".format(rnome, rmarca, respecificidade, preco, tipo+1))


for i in range(5):
    tipo = 4
    rnome = "Luvas"
    rmarca = random.choice(marca)
    respecificidade = random.choice(["Golfe", "Futebol", "Basebol", "Boxe", "Ping-Pong"])

    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 1, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 2, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 3, {});".format(rnome, rmarca, respecificidade, tipo))

print("")
print("")
for i in range(5):
    tipo = 4
    rnome = "Taco"
    rmarca = random.choice(marca)
    respecificidade = random.choice(["Golfe", "Basebol"])

    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 1, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 2, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 3, {});".format(rnome, rmarca, respecificidade, tipo))


print("")
print("")
for i in range(5):
    tipo = 4
    rnome = "Raquete"
    rmarca = random.choice(marca)
    respecificidade = random.choice(["Tenis", "Ping-Pong"])

    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 1, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 2, {});".format(rnome, rmarca, respecificidade, tipo))
    print("INSERT INTO SPORT_SHOP.[Produto](nome_Produto, marca, especificidade, preco, loja_code, tipo_ID) VALUES ('{}', '{}', '{}', , 3, {});".format(rnome, rmarca, respecificidade, tipo))

