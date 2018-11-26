import time
from random import *
import datetime
import string

numCameras = 100
locais = ['Abrantes', 'Agueda', 'Aguiar da Beira', 'Alandroal', 'Albergaria-a-Velha', 'Albufeira', 'Alcacer do Sal', 'Alcanena', 'Alcobaca', 'Alcochete', 'Alcoutim', 'Alenquer', 'Alfandega da Fe', 'Alijo', 'Aljezur', 'Aljustrel', 'Almada', 'Almeida', 'Almeirim', 'Almodovar', 'Alpiarca', 'Alter do Chao', 'Alvaiazere', 'Alvito', 'Amadora', 'Amarante', 'Amares', 'Anadia', 'Angra do Heroismo', 'Ansiao', 'Arcos de Valdevez', 'Arganil', 'Armamar', 'Arouca', 'Arraiolos', 'Arronches', 'Arruda dos Vinhos', 'Aveiro', 'Avis', 'Azambuja', 'Baiao', 'Barcelos', 'Barrancos', 'Barreiro', 'Batalha', 'Beja', 'Belmonte', 'Benavente', 'Bombarral', 'Borba', 'Boticas', 'Braga', 'Braganca', 'Cadaval', 'Caldas da Rainha', 'Calheta', 'Camara de Lobos', 'Caminha', 'Campo Maior', 'Cantanhede', 'Carrazeda de Ansiaes', 'Carregal do Sal', 'Cartaxo', 'Cascais', 'Castanheira de Pera', 'Castelo Branco', 'Castelo de Paiva', 'Castelo de Vide', 'Castro Daire', 'Castro Marim', 'Castro Verde', 'Celorico da Beira', 'Celorico de Basto', 'Chamusca', 'Chaves', 'Cinfaes', 'Coimbra', 'Condeixa-a-Nova', 'Constancia', 'Coruche', 'Covilha', 'Crato', 'Cuba', 'Elvas', 'Entroncamento', 'Espinho', 'Esposende', 'Estarreja', 'Estremoz', 'Evora', 'Fafe', 'Faro', 'Felgueiras', 'Ferreira do Alentejo', 'Ferreira do Zezere', 'Figueira da Foz', 'Figueira de Castelo Rodrigo', 'Figueiro dos Vinhos', 'Fornos de Algodres', 'Freixo de Espada a Cinta', 'Fronteira', 'Funchal', 'Fundao', 'Gaviao', 'Gois', 'Golega', 'Gondomar', 'Guarda', 'Guimaraes', 'Horta', 'Idanha-a-Nova', 'Ilhavo', 'Lagoa', 'Lagos', 'Lajes das Flores', 'Lajes do Pico', 'Lamego', 'Leiria', 'Lisboa', 'Loule', 'Loures', 'Lourinha', 'Lousa', 'Lousada', 'Macao', 'Macedo de Cavaleiros', 'Machico', 'Madalena', 'Mafra', 'Maia', 'Mangualde', 'Manteigas', 'Marco de Canaveses', 'Marinha Grande', 'Marvao', 'Matosinhos', 'Mealhada', 'Meda', 'Melgaco', 'Mertola', 'Mesao Frio', 'Mira', 'Miranda do Corvo', 'Miranda do Douro', 'Mirandela', 'Mogadouro', 'Moimenta da Beira', 'Moita', 'Moncao', 'Monchique', 'Mondim de Basto', 'Monforte', 'Montalegre', 'Montemor o Novo', 'Montemor-o-Velho', 'Montijo', 'Mora', 'Mortagua', 'Moura', 'Mourao', 'Murca', 'Murtosa', 'Nazare', 'Nelas', 'Nisa', 'Nordeste', 'Obidos', 'Odemira', 'Odivelas', 'Oeiras', 'Oleiros', 'Olhao', 'Oliveira de Azemeis', 'Oliveira de Frades', 'Oliveira do Bairro', 'Oliveira do Hospital', 'Olivenca', 'Ourem', 'Ourique', 'Ovar', 'Pacos de Ferreira', 'Palmela', 'Pampilhosa da Serra', 'Paredes', 'Paredes de Coura', 'Pedrogao Grande', 'Penacova', 'Penafiel', 'Penalva do Castelo', 'Penamacor', 'Penedono', 'Penela', 'Peniche', 'Peso da Regua', 'Pinhel', 'Pombal', 'Ponta Delgada', 'Ponta do Sol', 'Ponte da Barca', 'Ponte de Lima', 'Ponte de Sor', 'Portalegre', 'Portel', 'Portimao', 'Porto', 'Porto de Mos', 'Porto Moniz', 'Porto Santo', 'Povoacao', 'Povoa de Lanhoso', 'Povoa de Varzim', 'Praia da Vitoria', 'Proenca-a-Nova', 'Redondo', 'Reguengos de Monsaraz', 'Resende', 'Ribeira Brava', 'Ribeira de Pena', 'Ribeira Grande', 'Rio Maior', 'Sabrosa', 'Sabugal', 'Salvaterra de Magos', 'Santa Comba Dao', 'Santa Cruz da Graciosa', 'Santa Cruz das Flores', 'Santa Cruz', 'Santa Maria da Feira', 'Santa Marta de Penaguiao', 'Santana', 'Santarem', 'Santiago do Cacem', 'Santo Tirso', 'Sao Bras de Alportel', 'Sao Joao da Madeira', 'Sao Joao da Pesqueira', 'Sao Pedro do Sul', 'Sao Roque do Pico', 'Sao Vicente', 'Sardoal', 'Satao', 'Seia', 'Seixal', 'Sernancelhe', 'Serpa', 'Serta', 'Sesimbra', 'Setubal']
entidades = ['Policia', 'Bombeiros', 'Forca aerea', 'Exercito']
localDaCamara = []
nomes = ['Cremilde', 'Djalmo', 'Durbalino', 'Estanislau', 'Capitulino', 'Andrioleta', 'Hermenegildo', 'Xenocrates', 'Zardilaque', 'Silvandira']
apelidos = ['Chousa', 'Rocadas', 'Sacadura', 'Torquato', 'Ulhoa', 'Ximenes', 'Vidigal']
nomeMeio = ['Tinoni', 'Aviao', 'Quimboio', 'Autocarlos tchutchu']

de1a100 = []

socorro = []
apoio = []
combate = []

entidadesDoMeioI = []
dataHoraDoVideoI = []
camaraDoVideoI = []
dataHoraFimDoVideoI = []

#Incializar entidadesDoMeioI e dataHoraDoVideoI e camaraDoVideoI com 100 elementos
def init100Array():
    global entidadesDoMeioI
    global dataHoraDoVideoI
    global camaraDoVideoI
    global dataHoraFimDoVideoI

    for i in range(100):
        entidadesDoMeioI.append('')
        dataHoraDoVideoI.append('')
        dataHoraFimDoVideoI.append('')
        camaraDoVideoI.append('')

init100Array()

#Atribuir local a camara
for i in range(numCameras):
    localDaCamara.append(locais[randint(0, len(locais) - 1)])

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
    print("insert into SegmentoVideo values (", str(randint(0, 20)), ",", str(randint(1, 5)) + ", '" + dataHoraDoVideoI[i] + "',", str(camaraDoVideoI[i]), ");" )
print()

#Local
print("--Local")
for i in range(100):
    print("insert into Locais values ('" + locais[randint(0, len(locais) - 1)] + "');")
print()

#Vigia
print("--Vigia")
for i in range(numCameras):
    print("insert into Vigia values ('" + localDaCamara[i] + "', ", i, ");")
print()

#Evento de emergencia
print("--Evento de Emergencia")
for i in range(100):
    hora = randint(0, 23)
    minuto = randint(0, 59)
    segundo = randint(0, 59)

    print("insert into EventoEmergencia ('" + str(randint(960000000, 969999999)) + "', '" + str(hora) + ":" + str(minuto) + ":" + str(segundo) + "', '" + nomes[randint(0, len(nomes) - 1)], apelidos[randint(0, len(apelidos) - 1)] + "', '" + locais[randint(0, len(locais) - 1)] + "', " , randint(0, 99), ");")
print()

#Processo de socorro
print("--Processos de socorro")
for i in range(100):
    print("insert into ProcessoSocorro values (", i, ");")
print()

#Entidade do meio
print("--Entidade do meio")
for i in range(100):
    print("insert into EntidadeMeio values ('" + entidades[randint(0, len(entidades) - 1)] + "');")
print()

#Meio
print("--Meio")
for i in range(100):
    entidade = randint(0, len(entidades) - 1)
    entidadesDoMeioI[i] = entidades[entidade]

    print("insert into Meio values (", i, ", '" + nomeMeio[randint(0, len(nomeMeio) - 1)] + "', '" + entidades[entidade] + "');")
print()

#Meio de combate
print("--Meio de combate")
for i in range(33):
    meio = randint(0, len(de1a100) - 1)
    combate.append(de1a100[meio])
    print("insert into MeioCombate values (", de1a100[meio], ", '" + entidadesDoMeioI[meio] + "');")
    del de1a100[meio]
print()

#Meio de apoio
print("--Meio de apoio")
for i in range(33):
    meio = randint(0, len(de1a100) - 1)
    apoio.append(de1a100[meio])
    print("insert into MeioApoio values (", de1a100[meio], ", '" + entidadesDoMeioI[meio] + "');")
    del de1a100[meio]
print()

#Meio de socorro
print("--Meio de socorro")
for i in range(34):
    meio = randint(0, len(de1a100) - 1)
    socorro.append(de1a100[meio])
    print("insert into MeioSocorro values (", de1a100[meio], ", '" + entidadesDoMeioI[meio] + "');")
    del de1a100[meio]
print()

#Recria o array de 0-100
init100Array()

#Transporta
print("--Transporta")
for i in range(len(socorro)):
    print("insert into Transporta values (", socorro[i], ", '" + entidadesDoMeioI[socorro[i]] + "', ", randint(1, 30), ",", str(randint(0, 99)), ");")
print()

#Alocado
print("--Alocado")
for i in range(len(apoio)):
    print("insert into Alocado values (", apoio[i], ", '" + entidadesDoMeioI[apoio[i]] + "', ", randint(1, 24), ",", str(randint(0, 99)), ");")
print()

#Aciona
print("--Aciona")
for i in range(100):
    print("insert into Aciona values (", i, ", '" + entidadesDoMeioI[i] + "', ", randint(1, 24), ",", str(randint(0, 99)), ");")
print()

#Coordenador
print("--Coordenador")
for i in range(100):
    print("insert into Coordenador values (", i, ");")    
print()

#Audita
print("--Audita")
for i in range(100):
    meio = randint(0, 99)

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

    print("insert into Audita values (", str(randint(0, 99)), ",", str(meio), ",'" + entidadesDoMeioI[meio] + "',", randint(0, 99), ",'" + startStamp + "', '" + endStamp + "', '" + auditStamp + "', '" + text + "');")
print()

#Solicita
print("--Solicita")
for i in range(100):
    video = randint(0, 99)

    print("insert into Solicita values (", randint(0, 99), ",'" + dataHoraDoVideoI[video] + "', ", str(camaraDoVideoI[video]), ", '" + dataHoraFimDoVideoI[video], "');" )
print()