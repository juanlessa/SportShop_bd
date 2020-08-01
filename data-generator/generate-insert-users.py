

nome = "Macon Jason Denton Hamish Orli Bernard Acton Edward Dennis Nero Urielle Lysandra Galena Elliott Kelly Randall Iris Kaden Karyn Olympia Kyla Stacey Ginger Uma Burton Gay Hilel Jared Ainsley Brendan Jolie Quon Allegra Nissim Lewis Beverly Martha Bradley Kato Clayton Richard Marcia Flynn Lila Tara Harding Candace Uta Kaitlin Ciaran Virginia Burke Keaton Coby Francis Amos Noelle Leonard Lionel Russell Laurel Ivy Nita Alec Tanya Scarlett Deacon Alden Colton Sybill Francis Phoebe Hedy Walter Phoebe Gannon Emerson Daquan Fitzgerald Rebecca Flynn Cheyenne Christian Sawyer Dahlia Christian Kirby Norman Anne Ulla Salvador Buffy Gretchen Megan Rae Odette Libby Vivian Alfreda Stephanie"
sobrenome = "Newman Cooley Johnson Bray Clayton Workman Orr Barnes Herring Francis Barnes Ross Montoya Merritt Morris Sutton Huff Murphy Wilkins Knapp Finch Little Kennedy Robinson Miranda Puckett Heath Holmes Rodriguez Powell Dawson Chandler Pitts Woods Orr Pierce Norman Moon Rodriguez Pollard Mcmahon Rasmussen Greene Alston Andrews Macdonald Shaffer England Slater Kerr Matthews Guy Camacho Horne Dillon Daniels Hyde Diaz Hansen Randolph Cabrera Sullivan Villarreal Cantu Burch Murray Simpson Manning Freeman Casey Curtis Mayo Sharpe Pacheco Gray Lawson Garza English Frye Hickman Kemp Baird Benson Mckinney Goodwin Cooper Alvarado Leblanc Cooke Parks Garrett Lewis Simon Nolan Moore Nielsen Stark Todd Hendrix Bauer"
numid = "17023334 13597973 17812075 14591765 12363321 19491337 13150517 17264919 15858305 18749269 17639652 14437001 19558825 19201883 14292591 13816681 14564443 11115576 15983319 15984692 16383510 10135728 10120836 10412196 18677317 13441919 11083909 16645740 14802156 17350548 15208428 12176552 15312303 10491988 14988942 15905420 16640869 19452731 18593718 11769137 17447686 18076783 14825962 18071908 10552344 11645825 12505291 13651412 12727951 17770398 18093333 17880704 14927762 13852279 19060481 19511695 10609422 19359971 15779662 14202762 18443231 16933652 10532028 19484298 10929079 11295867 17595671 18762889 19446914 10182109 10630263 12020799 10176924 11841118 17371425 11135420 14420369 13509096 12609491 17702370 13176638 12672454 17676222 17802983 15939048 19729784 16782187 16520257 11400459 19531058 12601052 16101490 16741818 19876652 19937575 16605959 18642467 16212112 12098117 14240553"

nome = nome.split()
sobrenome = sobrenome.split()
numid = numid.split()

user = []
client = []
emp = []
email = []

for i in range(100):
    #funcionario
    if i <= 29:
        user.append([numid[i], nome[i], sobrenome[i]])
        emp.append([numid[i], str(numid[i][:5]+ nome[i])])
    else:
        user.append([numid[i], nome[i], sobrenome[i]])
        client.append([numid[i], str(nome[i][0].lower() + "." + sobrenome[i].lower() + "@testmail.com")])
    

for i in user:
    print("INSERT INTO SPORT_SHOP.Utilizador(nome, num_ID) VALUES('{}', {});".format(str(i[1]+" "+i[2]) ,i[0]))

for i in emp:
    print("INSERT INTO SPORT_SHOP.Funcionario(num_ID, [password], loja_code) VALUES({}, '{}', 1);".format(i[0], i[1]))

for i in client:
    print("INSERT INTO SPORT_SHOP.Cliente(num_ID, mail) VALUES({}, '{}');".format(i[0], i[1]))