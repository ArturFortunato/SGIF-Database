import time
from random import randint
import datetime

numCameras = 100
locais = ['Abrantes', 'Agueda', 'Aguiar da Beira', 'Alandroal', 'Albergaria-a-Velha', 'Albufeira', 'Alcacer do Sal', 'Alcanena', 'Alcobaça', 'Alcochete', 'Alcoutim', 'Alenquer', 'Alfandega da Fe', 'Alijo', 'Aljezur', 'Aljustrel', 'Almada', 'Almeida', 'Almeirim', 'Almodovar', 'Alpiarca', 'Alter do Chao', 'Alvaiazere', 'Alvito', 'Amadora', 'Amarante', 'Amares', 'Anadia', 'Angra do Heroismo', 'Ansiao', 'Arcos de Valdevez', 'Arganil', 'Armamar', 'Arouca', 'Arraiolos', 'Arronches', 'Arruda dos Vinhos', 'Aveiro', 'Avis', 'Azambuja', 'Baiao', 'Barcelos', 'Barrancos', 'Barreiro', 'Batalha', 'Beja', 'Belmonte', 'Benavente', 'Bombarral', 'Borba', 'Boticas', 'Braga', 'Bragança', 'Cadaval', 'Caldas da Rainha', 'Calheta', 'Câmara de Lobos', 'Caminha', 'Campo Maior', 'Cantanhede', 'Carrazeda de Ansiaes', 'Carregal do Sal', 'Cartaxo', 'Cascais', 'Castanheira de Pera', 'Castelo Branco', 'Castelo de Paiva', 'Castelo de Vide', 'Castro Daire', 'Castro Marim', 'Castro Verde', 'Celorico da Beira', 'Celorico de Basto', 'Chamusca', 'Chaves', 'Cinfaes', 'Coimbra', 'Condeixa-a-Nova', 'Constância', 'Coruche', 'Covilha', 'Crato', 'Cuba', 'Elvas', 'Entroncamento', 'Espinho', 'Esposende', 'Estarreja', 'Estremoz', 'Évora', 'Fafe', 'Faro', 'Felgueiras', 'Ferreira do Alentejo', 'Ferreira do Zezere', 'Figueira da Foz', 'Figueira de Castelo Rodrigo', 'Figueiro dos Vinhos', 'Fornos de Algodres', 'Freixo de Espada a Cinta', 'Fronteira', 'Funchal', 'Fundao', 'Gavião', 'Gois', 'Golega', 'Gondomar', 'Guarda', 'Guimaraes', 'Horta', 'Idanha-a-Nova', 'Ilhavo', 'Lagoa', 'Lagos', 'Lajes das Flores', 'Lajes do Pico', 'Lamego', 'Leiria', 'Lisboa', 'Loule', 'Loures', 'Lourinha', 'Lousa', 'Lousada', 'Macao', 'Macedo de Cavaleiros', 'Machico', 'Madalena', 'Mafra', 'Maia', 'Mangualde', 'Manteigas', 'Marco de Canaveses', 'Marinha Grande', 'Marvao', 'Matosinhos', 'Mealhada', 'Meda', 'Melgaço', 'Mertola', 'Mesao Frio', 'Mira', 'Miranda do Corvo', 'Miranda do Douro', 'Mirandela', 'Mogadouro', 'Moimenta da Beira', 'Moita', 'Moncao', 'Monchique', 'Mondim de Basto', 'Monforte', 'Montalegre', 'Montemor o Novo', 'Montemor-o-Velho', 'Montijo', 'Mora', 'Mortagua', 'Moura', 'Mourao', 'Murca', 'Murtosa', 'Nazare', 'Nelas', 'Nisa', 'Nordeste', 'Obidos', 'Odemira', 'Odivelas', 'Oeiras', 'Oleiros', 'Olhao', 'Oliveira de Azemeis', 'Oliveira de Frades', 'Oliveira do Bairro', 'Oliveira do Hospital', 'Olivença', 'Ourem', 'Ourique', 'Ovar', 'Paços de Ferreira', 'Palmela', 'Pampilhosa da Serra', 'Paredes', 'Paredes de Coura', 'Pedrogao Grande', 'Penacova', 'Penafiel', 'Penalva do Castelo', 'Penamacor', 'Penedono', 'Penela', 'Peniche', 'Peso da Régua', 'Pinhel', 'Pombal', 'Ponta Delgada', 'Ponta do Sol', 'Ponte da Barca', 'Ponte de Lima', 'Ponte de Sor', 'Portalegre', 'Portel', 'Portimao', 'Porto', 'Porto de Mos', 'Porto Moniz', 'Porto Santo', 'Povoacao', 'Povoa de Lanhoso', 'Povoa de Varzim', 'Praia da Vitoria', 'Proença-a-Nova', 'Redondo', 'Reguengos de Monsaraz', 'Resende', 'Ribeira Brava', 'Ribeira de Pena', 'Ribeira Grande', 'Rio Maior', 'Sabrosa', 'Sabugal', 'Salvaterra de Magos', 'Santa Comba Dao', 'Santa Cruz da Graciosa', 'Santa Cruz das Flores', 'Santa Cruz', 'Santa Maria da Feira', 'Santa Marta de Penaguião', 'Santana', 'Santarém', 'Santiago do Cacem', 'Santo Tirso', 'Sao Bras de Alportel', 'Sao Joao da Madeira', 'Sao Joao da Pesqueira', 'Sao Pedro do Sul', 'Sao Roque do Pico', 'Sao Vicente', 'Sardoal', 'Satao', 'Seia', 'Seixal', 'Sernancelhe', 'Serpa', 'Serta', 'Sesimbra', 'Setubal']
entidades = ['Policia', 'Bombeiros', 'Protecao Civil']
localDaCamara = []

#Atribuir local a camara
for i in range(numCameras):
    localDaCamara.append(locais[randint(0, len(locais) - 1)])

#Camara
print("--Camaras")
for i in range(numCameras):
    print("insert into Camaras values (", i, ");")
print()

#Video
print("--Videos")
for i in range(100):
    startTime = str(randint(0, 23)).zfill(2) + " : " + str(randint(0, 59)).zfill(2)
    endTime = str(randint(0, 23)).zfill(2) + " : " + str(randint(0, 59)).zfill(2)

    startDate = datetime.date(randint(2000, 2018), randint(1, 12), randint(1,28))
    endDate = startDate + datetime.timedelta(randint(1,365))

    startStamp = str(startDate) + " " + str(startTime)
    endStamp = str(endDate) + " " + str(endTime)
    print("insert into Video values ('" + startStamp + "','" + endStamp + "','", randint(0,99), "');")
print()

#Vigia
print("--Vigia")
for i in range(numCameras):
    print("insert into Vigia values ('" + localDaCamara[i] + "', ", i, ");")
print()

#Segmento
#print("--Segmentos")
#for i in range(100):
#    print("insert into SegmentoVideo values(", randint(0, 20), )
#print()

#Local
print("--Local")
for i in range(100):
    print("insert into Locais values ('" + locais[randint(0, len(locais) - 1)] +"');")
print()

#Processo de socorro
print("--Processos de socorro")
for i in range(100):
    print("insert into ProcessosSocorro values (", i, ");")
print()

#Entidade do meio
print("--Entidade do meio")
for i in range(100):
    print("insert into EntidadesMeio values ('", entidades[randint(0, len(entidades) - 1)], "');")
print()

#Coordenador
print("--Coordenador")
for i in range(100):
    print("insert into Coordenadores values (", i, ");")    