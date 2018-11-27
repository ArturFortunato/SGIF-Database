import time
from random import *
import datetime
import string

numCameras = 100
locais = ['Abrantes', 'Agueda', 'Aguiar da Beira', 'Alandroal', 'Albergaria-a-Velha', 'Albufeira', 'Alcacer do Sal', 'Alcanena', 'Alcobaca', 'Alcochete', 'Alcoutim', 'Alenquer', 'Alfandega da Fe', 'Alijo', 'Aljezur', 'Aljustrel', 'Almada', 'Almeida', 'Almeirim', 'Almodovar', 'Alpiarca', 'Alter do Chao', 'Alvaiazere', 'Alvito', 'Amadora', 'Amarante', 'Amares', 'Anadia', 'Angra do Heroismo', 'Ansiao', 'Arcos de Valdevez', 'Arganil', 'Armamar', 'Arouca', 'Arraiolos', 'Arronches', 'Arruda dos Vinhos', 'Aveiro', 'Avis', 'Azambuja', 'Baiao', 'Barcelos', 'Barrancos', 'Barreiro', 'Batalha', 'Beja', 'Belmonte', 'Benavente', 'Bombarral', 'Borba', 'Boticas', 'Braga', 'Braganca', 'Cadaval', 'Caldas da Rainha', 'Calheta', 'Camara de Lobos', 'Caminha', 'Campo Maior', 'Cantanhede', 'Carrazeda de Ansiaes', 'Carregal do Sal', 'Cartaxo', 'Cascais', 'Castanheira de Pera', 'Castelo Branco', 'Castelo de Paiva', 'Castelo de Vide', 'Castro Daire', 'Castro Marim', 'Castro Verde', 'Celorico da Beira', 'Celorico de Basto', 'Chamusca', 'Chaves', 'Cinfaes', 'Coimbra', 'Condeixa-a-Nova', 'Constancia', 'Coruche', 'Covilha', 'Crato', 'Cuba', 'Elvas', 'Entroncamento', 'Espinho', 'Esposende', 'Estarreja', 'Estremoz', 'Evora', 'Fafe', 'Faro', 'Felgueiras', 'Ferreira do Alentejo', 'Ferreira do Zezere', 'Figueira da Foz', 'Figueira de Castelo Rodrigo', 'Figueiro dos Vinhos', 'Fornos de Algodres', 'Freixo de Espada a Cinta', 'Fronteira', 'Funchal', 'Fundao', 'Gaviao', 'Gois', 'Golega', 'Gondomar', 'Guarda', 'Guimaraes', 'Horta', 'Idanha-a-Nova', 'Ilhavo', 'Lagoa', 'Lagos', 'Lajes das Flores', 'Lajes do Pico', 'Lamego', 'Leiria', 'Lisboa', 'Loule', 'Loures', 'Lourinha', 'Lousa', 'Lousada', 'Macao', 'Macedo de Cavaleiros', 'Machico', 'Madalena', 'Mafra', 'Maia', 'Mangualde', 'Manteigas', 'Marco de Canaveses', 'Marinha Grande', 'Marvao', 'Matosinhos', 'Mealhada', 'Meda', 'Melgaco', 'Mertola', 'Mesao Frio', 'Mira', 'Miranda do Corvo', 'Miranda do Douro', 'Mirandela', 'Mogadouro', 'Moimenta da Beira', 'Moita', 'Moncao', 'Monchique', 'Mondim de Basto', 'Monforte', 'Montalegre', 'Montemor o Novo', 'Montemor-o-Velho', 'Montijo', 'Mora', 'Mortagua', 'Moura', 'Mourao', 'Murca', 'Murtosa', 'Nazare', 'Nelas', 'Nisa', 'Nordeste', 'Obidos', 'Odemira', 'Odivelas', 'Oeiras', 'Oleiros', 'Olhao', 'Oliveira de Azemeis', 'Oliveira de Frades', 'Oliveira do Bairro', 'Oliveira do Hospital', 'Olivenca', 'Ourem', 'Ourique', 'Ovar', 'Pacos de Ferreira', 'Palmela', 'Pampilhosa da Serra', 'Paredes', 'Paredes de Coura', 'Pedrogao Grande', 'Penacova', 'Penafiel', 'Penalva do Castelo', 'Penamacor', 'Penedono', 'Penela', 'Peniche', 'Peso da Regua', 'Pinhel', 'Pombal', 'Ponta Delgada', 'Ponta do Sol', 'Ponte da Barca', 'Ponte de Lima', 'Ponte de Sor', 'Portalegre', 'Portel', 'Portimao', 'Porto', 'Porto de Mos', 'Porto Moniz', 'Porto Santo', 'Povoacao', 'Povoa de Lanhoso', 'Povoa de Varzim', 'Praia da Vitoria', 'Proenca-a-Nova', 'Redondo', 'Reguengos de Monsaraz', 'Resende', 'Ribeira Brava', 'Ribeira de Pena', 'Ribeira Grande', 'Rio Maior', 'Sabrosa', 'Sabugal', 'Salvaterra de Magos', 'Santa Comba Dao', 'Santa Cruz da Graciosa', 'Santa Cruz das Flores', 'Santa Cruz', 'Santa Maria da Feira', 'Santa Marta de Penaguiao', 'Santana', 'Santarem', 'Santiago do Cacem', 'Santo Tirso', 'Sao Bras de Alportel', 'Sao Joao da Madeira', 'Sao Joao da Pesqueira', 'Sao Pedro do Sul', 'Sao Roque do Pico', 'Sao Vicente', 'Sardoal', 'Satao', 'Seia', 'Seixal', 'Sernancelhe', 'Serpa', 'Serta', 'Sesimbra', 'Setubal']
entidades = ['Policia', 'Bombeiros', 'Forca aerea', 'Exercito']
numeroDeMeiosDaEntidade = [0, 0, 0, 0]
localDaCamara = []
nomes = ['Cremilde', 'Djalmo', 'Durbalino', 'Estanislau', 'Capitulino', 'Andrioleta', 'Hermenegildo', 'Xenocrates', 'Zardilaque', 'Silvandira']
apelidos = ['Chousa', 'Rocadas', 'Sacadura', 'Torquato', 'Ulhoa', 'Ximenes', 'Vidigal']
nomeMeio = ['Tinoni', 'Aviao', 'Quimboio tchutchu', 'Autocarlos']

de1a100 = []

tipoDoMeioI = [[], [], []] #Combate apoio socorro
locais_usados = []

entidadesDoTipoDeMeio = [[], [], []] #String com nome da entidade que o meio i tem 
meios = []
dataHoraDoVideoI = []
camaraDoVideoI = []
dataHoraFimDoVideoI = []
numProcessoSocorroParaMeioI = []

#Incializar e dataHoraDoVideoI e camaraDoVideoI com 100 elementos
def init100Array():
    global dataHoraDoVideoI
    global camaraDoVideoI
    global dataHoraFimDoVideoI
    global numProcessoSocorroParaMeioI

    for i in range(100):
        dataHoraDoVideoI.append('')
        dataHoraFimDoVideoI.append('')
        camaraDoVideoI.append('')
        numProcessoSocorroParaMeioI.append(0)

init100Array()

#Encher o array com numeros de 1 a 100
for i in range(100):
    de1a100.append(i)

#Camara
print("--Camara")
for i in range(numCameras):
    print("insert into Camara values (", i, ");")
print()

#Video
print("--Video")
for i in range(100):
    startTime = str(randint(0, 23)).zfill(2) + ":" + str(randint(0, 59)).zfill(2)
    endTime = str(randint(0, 23)).zfill(2) + ":" + str(randint(0, 59)).zfill(2)

    startDate = datetime.date(randint(2000, 2018), randint(1, 12), randint(1,28))
    endDate = startDate + datetime.timedelta(randint(1,365))

    startStamp = str(startDate) + " " + str(startTime)
    endStamp = str(endDate) + " " + str(endTime)
    
    dataHoraDoVideoI[i] = startStamp
    dataHoraFimDoVideoI[i] = endStamp
    camaraDoVideoI[i] = randint(0, 99)

    print("insert into Video values ('" + startStamp + "','" + endStamp + "', ", camaraDoVideoI[i], ");")
print()

#SegmentoVideo
print("--SegmentoVideo")
for i in range(100):
    for j in range(5):
        print("insert into SegmentoVideo values (", j, ",", str(randint(10, 3600)) + ", '" + dataHoraDoVideoI[i] + "',", str(camaraDoVideoI[i]), ");" )
print()

#Local
print("--Local")
for i in range(100):
    local_index = randint(0, len(locais) - 1)
    print("insert into Locais values ('" + locais[local_index] + "');")
    locais_usados.append(locais[local_index])
    del locais[local_index]
print()

#Atribuir local a camara
for i in range(numCameras):
    localDaCamara.append(locais_usados[randint(0, len(locais_usados) - 1)])

#Vigia
print("--Vigia")
for i in range(numCameras):
    print("insert into Vigia values ('" + localDaCamara[i] + "', ", i, ");")
print()

#Processo de socorro
print("--Processos de socorro")
for i in range(100):
    print("insert into ProcessoSocorro values (", i, ");")
print()

#Evento de emergencia
print("--Evento de Emergencia")
for i in range(100):
    hora = randint(0, 23)
    minuto = randint(0, 59)
    segundo = randint(0, 59)

    startDate = datetime.date(randint(2000, 2018), randint(1, 12), randint(1,28))

    print("insert into EventoEmergencia values ('" + str(randint(960000000, 969999999)) + "', '" + str(startDate), str(hora) + ":" + str(minuto) + ":" + str(segundo) + "', '" + nomes[randint(0, len(nomes) - 1)], apelidos[randint(0, len(apelidos) - 1)] + "', '" + locais_usados[randint(0, len(locais_usados) - 1)] + "', " , randint(0, 99), ");")
print()

#Entidade do meio
print("--Entidade do meio")
for i in range(len(entidades)):
    print("insert into EntidadeMeio values ('" + entidades[i] + "');")
print()

#Meio
print("--Meio")
for i in range(100):
    entidade = randint(0, len(entidades) - 1) #entidade para o meio novo
    tipoDeMeio = randint(0, 2) #Combate, apoio ou socorro
    entidadesDoTipoDeMeio[tipoDeMeio].append(entidade) #Dentro do mini array de combate/apoio/socorro põe a entidade
    tipoDoMeioI[tipoDeMeio].append(numeroDeMeiosDaEntidade[entidade]) #guarda no mini array combate/apoio/socorro o id do meio
    meios.append((numeroDeMeiosDaEntidade[entidade], entidade))
    print("insert into Meio values (", numeroDeMeiosDaEntidade[entidade], ", '" + nomeMeio[randint(0, len(nomeMeio) - 1)] + "', '" + entidades[entidade] + "');")
    numeroDeMeiosDaEntidade[entidade] += 1
print()

#Meio de combate
print("--Meio de combate")
for i in range(len(tipoDoMeioI[0])):
    print("insert into MeioCombate values (", tipoDoMeioI[0][i], ", '" + entidades[entidadesDoTipoDeMeio[0][i]] + "');")
print()

#Meio de apoio
print("--Meio de apoio")
for i in range(len(tipoDoMeioI[1])):
    print("insert into MeioApoio values (", tipoDoMeioI[1][i], ", '" + entidades[entidadesDoTipoDeMeio[1][i]] + "');")
print()

#Meio de socorro
print("--Meio de socorro")
for i in range(len(tipoDoMeioI[2])):
    print("insert into MeioSocorro values (", tipoDoMeioI[2][i], ", '" + entidades[entidadesDoTipoDeMeio[2][i]] + "');")
print()

#Recria o array de 0-100
init100Array()

#Transporta
print("--Transporta")
for i in range(len(tipoDoMeioI[2])):
    print("insert into Transporta values (", tipoDoMeioI[2][i], ", '" + entidades[entidadesDoTipoDeMeio[2][i]] + "', ", randint(1, 30), ",", str(randint(0, 99)), ");")
print()

#Alocado
print("--Alocado")
for i in range(len(tipoDoMeioI[1])):
    print("insert into Alocado values (", tipoDoMeioI[1][i], ", '" + entidades[entidadesDoTipoDeMeio[1][i]] + "', ", randint(1, 24), ",", str(randint(0, 99)), ");")
print()

#Aciona
print("--Aciona")
for i in range(100):
    numProcessoSocorroParaMeioI[i] = randint(1, 99)
    print("insert into Aciona values (", meios[i][0], ", '" + entidades[meios[i][1]] + "', ", numProcessoSocorroParaMeioI[i], ");")
print()

#Coordenador
print("--Coordenador")
for i in range(100):
    print("insert into Coordenador values (", i, ");")    
print()

#Audita
print("--Audita")
for i in range(100):
    startTime = str(randint(0, 23)).zfill(2) + ":" + str(randint(0, 59)).zfill(2)
    endTime = str(randint(0, 23)).zfill(2) + ":" + str(randint(0, 59)).zfill(2)
    auditTime = str(randint(0, 23)).zfill(2) + ":" + str(randint(0, 59)).zfill(2)

    startDate = datetime.date(randint(2000, 2018), randint(1, 12), randint(1,28))
    endDate = startDate + datetime.timedelta(randint(1,365))
    auditDate = datetime.date(randint(2018, 2022), randint(1, 12), randint(1,28))

    startStamp = str(startDate) + " " + str(startTime)
    endStamp = str(endDate) + " " + str(endTime)
    auditStamp = str(auditDate) + " " + str(auditTime)

    text = ''
    alphabet = string.ascii_lowercase
    for j in range(20):
        text += alphabet[randint(0, len(alphabet) - 1)]

    print("insert into Audita values (", str(randint(0, 99)), ",", meios[i][0], ",'" + entidades[meios[i][1]]+ "',", numProcessoSocorroParaMeioI[i], ",'" + startStamp + "', '" + endStamp + "', '" + auditStamp + "', '" + text + "');")
print()

def horaDeInicioEFim(horaDeInicioDoVideo):
    data = datetime.datetime.strptime(horaDeInicioDoVideo, '%Y-%m-%d %H:%M')
    return data + datetime.timedelta(randint(1,2)), data + datetime.timedelta(randint(3,5))

#Solicita
print("--Solicita")
for i in range(100):
    video = randint(0, 99)
    TSDoVideoInicio, TSDoVideoFim = horaDeInicioEFim(dataHoraDoVideoI[video])
    print("insert into Solicita values (", randint(0, 99), ",'" + dataHoraDoVideoI[video] + "', ", str(camaraDoVideoI[video]), ", '" + str(TSDoVideoInicio) + "', '" + str(TSDoVideoFim) +"');" )
print()