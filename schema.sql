---------------------------------------------
---             CREATE TABLES             ---
---------------------------------------------

# Camara(numCamara)
create table Camara (
    numCamara int not null unique unsigned,
    constraint pk_camara primary key(numCamara)
);

# Video(dataHoraInicio, dataHoraFim, numCamara)
create table Video (
    dataHoraInicio datetime not null,
    dataHoraFim datetime not null,
    numCamara int not null unsigned,
    constraint pk_video primary key (dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint chk_video_time check (dataHoraFim > dataHoraInicio)
);

# SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara)
create table SegmentoVideo (
    numSegmento int not null unsigned,
    duracao time not null,
    dataHoraInicio datetime not null,
    numCamara int not null unsigned,
    constraint pk_segment primary key (numSegmento),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint fk_dataHoraInicio foreign key (dataHoraInicio) references Video(dataHoraInicio)
);

# Locais(moradaLocal)
create table Locais (
	moradaLocal varchar(255) not null unique,
	constraint pk_local primary key (moradaLocal)
);

# Vigia(moradaLocal, numCamara)
create table Vigia (
	moradaLocal varchar(255) not null unique,
	numCamara int not null unique unsigned,
	constraint fk_local foreign key (moradaLocal) references Local(moradaLocal),
	constraint fk_camara foreign key (numCamara) references Camara(numCamara)
);

# EventoEmergencia(numTelefone, instanceChamada, nomePessoa, moradaLocal, numProcessoSocorro)
create table EventoEmergencia (
	numTelefone char(9) not null unique,
	instanteChamada datetime not null unique,
	nomePessoa varchar(30) not null,
	moradaLocal varchar(255) not null,
	numProcessoSocorro int unique unsigned,
	constraint pk_numTelefone primary key (numTelefone),
	constraint pk_witness primary key (numTelefone, nomePessoa),
	constraint fk_local foreign key (moradaLocal) references Local(moradaLocal),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

# ProcessoSocorro(numProcessoSocorro)
create table ProcessoSocorro(
	numProcessoSocorro int not null unique unsigned,
	constraint pk_numProcessoSocorro primary key (numProcessoSocorro)
	/* verificar restricao para todos os processo estarem associados a um ou mais evento de emergencia */
);

# EntidadeMeio (nomeEntidade)
create table EntidadeMeio(
	nomeEntidade varchar(20) not null,
	constraint pk_nomeEntidade primary key (nomeEntidade)
);

# Meio(numMeio, nomeMeio, nomeEntidade)
create table Meio(
	numMeio int not null unique unsigned,
	nomeMeio varchar(30) not null,
	nomeEntidade varchar(20) not null unique,
	constraint pk_numMeio primary key (numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references EntidadeMeio(nomeEntidade)
);

# MeioCombate(numMeio, nomeEntidade)
create table MeioCombate(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

# MeioApoio(numMeio, nomeEntidade)
create table MeioApoio(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

# MeioSocorro(numMeio, nomeEntidade)
create table MeioSocorro(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

# Transporta(numMeio, nomeEntidade, numVitimas, numProcessoSocorro)
create table Transporta(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numVitimas int not null unsigned,
	numProcessoSocorro int unique unsigned,
	constraint fk_numMeio foreign key (numMeio) references MeioSocorro(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references MeioSocorro(nomeEntidade),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

# Alocado(numMeio, nomeEntidade, numHoras, numProcessoSocorro)
create table Alocado(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numHoras int not null unsigned,
	numProcessoSocorro int unique unsigned,
	constraint fk_numMeio foreign key (numMeio) references MeioApoio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references MeioApoio(nomeEntidade),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

# Aciona(numMeio, nomeEntidade, numProcessoSocorro)
create table Aciona(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numProcessoSocorro int unique unsigned,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

# Coordenador(idCoordenador)
create table Coordenador(
	idCoordenador int not null unique unsigned,
	constraint pk_idCoordenador primary key (idCoordenador)
);

# Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto)
create table Audita(
	idCoordenador int not null unique unsigned,
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numProcessoSocorro int unique unsigned,
	datahoraInicio datetime not null,
	datahoraFim datetime not null,
	dataAuditoria date not null,
	texto text not null,
	constraint fk_numMeio foreign key (numMeio) references Aciona(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Aciona(nomeEntidade),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references Aciona(numProcessoSocorro),
	constraint fk_idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint chk_audit_time check (datahoraInicio < datahoraFim),
	constraint chk_audit_date check (dataAuditoria >= current_date) #verificar
);

# Solicita(idCoordenador, dataHoraInicioVideo, numCamara, dataHoraInicio, dataHoraFim)
create table Solicita(
	idCoordenador int not null unique unsigned,
	dataHoraInicioVideo datetime not null,
	numCamara int not null unique unsigned,
	dataHoraInicio datetime not null,
	dataHoraFim datetime not null,
	constraint fk_idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint fk_dataHoraInicioVideo foreign key (dataHoraInicioVideo) references Video(dataHoraInicio),
	constraint fk_numCamara foreign key (numCamara) references Camara(numCamara)
);