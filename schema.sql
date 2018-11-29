---------------------------------------------
---             CREATE TABLES             ---
---------------------------------------------

drop table if exists Solicita cascade;
drop table if exists SegmentoVideo cascade;
drop table if exists Video cascade;
drop table if exists Vigia cascade;
drop table if exists Camara cascade;
drop table if exists EventoEmergencia cascade;
drop table if exists Locais cascade;
drop table if exists Audita cascade;
drop table if exists Transporta cascade;
drop table if exists MeioCombate cascade;
drop table if exists Alocado cascade;
drop table if exists MeioSocorro cascade;
drop table if exists Aciona cascade;
drop table if exists MeioApoio cascade;
drop table if exists ProcessoSocorro cascade;
drop table if exists Coordenador cascade;
drop table if exists Meio cascade;
drop table if exists EntidadeMeio cascade;

-- Camara (numCamara)
-- numCamara is primary key
create table Camara
    (numCamara int not null unique,
    constraint pk_camara primary key(numCamara)
);

-- Video (dataHoraInicio, dataHoraFim, numCamara)
-- numCamara is a foreign key from Camara
-- dataHoraInicio is primary key
create table Video
    (dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null,
    numCamara int not null ,
    constraint pk_video primary key (dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint chk_video_time check (dataHoraFim > dataHoraInicio)
);

-- Segmento (numSegmento, duracao, dataHoraInicio, numCamara)
-- numCamara is a foreign key from Camara
-- dataHoraInicio is a foreign key from Video
-- (numCamara, numSegmento, dataHoraInicio) is primary key
create table SegmentoVideo
    (numSegmento int not null ,
    duracao int not null,
    dataHoraInicio timestamp not null,
    numCamara int not null ,
    constraint pk_segment primary key (numCamara, numSegmento, dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Video(numCamara),
    constraint fk_dataHoraInicio foreign key (dataHoraInicio) references Video(dataHoraInicio)
);

-- Locais (moradaLocal)
-- moradaLocal is primary key
create table Locais
	(moradaLocal varchar(255) not null unique,
	constraint pk_local primary key (moradaLocal)
);

-- Vigia (moradaLocal, numCamara)
-- moradaLocal is a foreign key from Locais
-- numCamara is a foreign key from Camara
create table Vigia
	(moradaLocal varchar(255) not null,
	numCamara int not null unique,
	constraint fk_local foreign key (moradaLocal) references Locais(moradaLocal),
	constraint fk_camara foreign key (numCamara) references Camara(numCamara)
);

-- ProcessoSocorro
-- numProcessoSocorro is primary key
create table ProcessoSocorro
	(numProcessoSocorro int not null unique,
	constraint pk_numProcessoSocorro primary key (numProcessoSocorro)
);

-- EventoEmergencia
-- moradaLocal is a foreign key from Locais
-- numProcessoSocorro is a foreign key from ProcessoSocorro
-- (numTelefone, nomePessoa) is primary key
create table EventoEmergencia
	(numTelefone char(9) not null,
	instanteChamada timestamp not null,
	nomePessoa varchar(30) not null,
	moradaLocal varchar(255) not null,
	numProcessoSocorro int not null,
	constraint pk_witness primary key(numTelefone, nomePessoa),
	constraint fk_local foreign key (moradaLocal) references Locais(moradaLocal),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

-- EntidadeMeio
-- nomeEntididade is primary key
create table EntidadeMeio
	(nomeEntidade varchar(20) not null unique,
	constraint pk_nomeEntidade primary key (nomeEntidade)
);

-- Meio
-- nomeEntidade is foreign key from EntidadeMeio
-- (numMeio, nomeEntidade) is primary key
create table Meio
	(numMeio int not null,
	nomeMeio varchar(30) not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meio primary key (numMeio, nomeEntidade),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references EntidadeMeio(nomeEntidade)
);

-- MeioCombate
-- (numMeio, nomeEntidade) is foreign key from Meio
-- (numMeio, nomeEntidade) is primary key
create table MeioCombate
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meioCombate primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)
);

-- MeioApoio
-- (numMeio, nomeEntidade) is foreign key from Meio
-- (numMeio, nomeEntidade) is primary key
create table MeioApoio
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meioApoio primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)
);

-- MeioSocorro
-- (numMeio, nomeEntidade) is foreign key from Meio
-- (numMeio, nomeEntidade) is primary key
create table MeioSocorro
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint fk_meioSocorro primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)
);

-- Transporta
-- (numMeio, nomeEntidade) is foreign key from MeioCombate
-- numProcessoSocorro is foreign key from ProcessoSocorro
create table Transporta
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numVitimas int not null ,
	numProcessoSocorro int not null,
	constraint fk_meio foreign key (numMeio, nomeEntidade) references MeioSocorro(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

-- Alocado
-- (numMeio, nomeEntidade) is foreign key from MeioApoio
-- numProcessoSocorro is foreign key from ProcessoSocorro
create table Alocado
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numHoras int not null ,
	numProcessoSocorro int,
	constraint fk_meio foreign key (numMeio, nomeEntidade) references MeioApoio(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

-- Aciona
-- (numMeio, nomeEntidade) is foreign key from Meio
-- numProcessoSocorro is foreign key from ProcessoSocorro
-- (numMeio, nomeEntidade, numProcessoSocorro) is primary key
create table Aciona
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numProcessoSocorro int not null,
	constraint pk_aciona primary key (numMeio, nomeEntidade, numProcessoSocorro),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

-- Coordenador
-- idCoordenador is primary key
create table Coordenador
	(idCoordenador int not null unique ,
	constraint idCoordenador primary key (idCoordenador)
);

-- Audita
-- (numMeio, nomeEntidade, numProcessoSocorro) is foreign key from Aciona
-- idCoordenador is foreign key from Coordenador
create table Audita
	(idCoordenador int not null,
	numMeio int not null,
	nomeEntidade varchar(20) not null,
	numProcessoSocorro int,
	datahoraInicio timestamp not null,
	datahoraFim timestamp not null,
	dataAuditoria date not null,
	texto text not null,
	constraint numMeio foreign key (numMeio, nomeEntidade, numProcessoSocorro) references Aciona(numMeio, nomeEntidade, numProcessoSocorro),
	constraint idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint chk_audit_time check (datahoraInicio < datahoraFim),
	constraint chk_audit_date check (dataAuditoria <= current_date)
);

-- Solicita
-- idCoordenador is foreign key from Coordenador
-- dataHoraInicioVideo is foreign key from Video
-- numCamara is foreign key from Camara
create table Solicita
	(idCoordenador int not null,
	dataHoraInicioVideo timestamp not null,
	numCamara int not null,
	dataHoraInicio timestamp not null,
	dataHoraFim timestamp not null,
	constraint idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint dataHoraInicioVideo foreign key (dataHoraInicioVideo) references Video(dataHoraInicio),
	constraint numCamara foreign key (numCamara) references Camara(numCamara)
);
