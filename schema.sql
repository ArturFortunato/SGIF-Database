---------------------------------------------
---             CREATE TABLES             ---
---------------------------------------------

create table Camara (
    numCamara int not null unique unsigned,
    constraint pk_camara primary key(numCamara)
);

create table Video (
    dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null,
    numCamara int not null unsigned,
    constraint pk_video primary key (dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint chk_video_time check (dataHoraFim > dataHoraInicio)
);

create table SegmentoVideo (
    numSegmento int not null unsigned,
    duracao time not null,
    dataHoraInicio timestamp not null,
    numCamara int not null unsigned,
    constraint pk_segment primary key (numSegmento),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint fk_dataHoraInicio foreign key (dataHoraInicio) references Video(dataHoraInicio)
);

create table Locais (
	moradaLocal varchar(255) not null unique,
	constraint pk_local primary key (moradaLocal)
);

create table Vigia (
	moradaLocal varchar(255) not null unique,
	numCamara int not null unique unsigned,
	constraint fk_local foreign key (moradaLocal) references Local(moradaLocal),
	constraint fk_camara foreign key (numCamara) references Camara(numCamara)
);

create table EventoEmergencia (
	numTelefone char(9) not null unique,
	instanteChamada timestamp not null unique,
	nomePessoa varchar(30) not null,
	moradaLocal varchar(255) not null,
	numProcessoSocorro int unique unsigned,
	constraint pk_numTelefone primary key (numTelefone),
	constraint pk_witness primary key (numTelefone, nomePessoa),
	constraint fk_local foreign key (moradaLocal) references Local(moradaLocal),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table ProcessoSocorro(
	numProcessoSocorro int not null unique unsigned,
	constraint pk_numProcessoSocorro primary key (numProcessoSocorro)
	/* verificar restricao para todos os processo estarem associados a um ou mais evento de emergencia */
);

create table EntidadeMeio(
	nomeEntidade varchar(20) not null,
	constraint pk_nomeEntidade primary key (nomeEntidade)
);

create table Meio(
	numMeio int not null unique unsigned,
	nomeMeio varchar(30) not null,
	nomeEntidade varchar(20) not null unique,
	constraint pk_numMeio primary key (numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references EntidadeMeio(nomeEntidade)
);

create table MeioCombate(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

create table MeioApoio(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

create table MeioSocorro(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	constraint fk_numMeio foreign key (numMeio) references Meio(numMeio),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade)
);

create table Transporta(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numVitimas int not null unsigned,
	numProcessoSocorro int unique unsigned,
	constraint numMeio foreign key (numMeio) references MeioSocorro(numMeio),
	constraint nomeEntidade foreign key (nomeEntidade) references MeioSocorro(nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Alocado(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numHoras int not null unsigned,
	numProcessoSocorro int unique unsigned,
	constraint numMeio foreign key (numMeio) references MeioApoio(numMeio),
	constraint nomeEntidade foreign key (nomeEntidade) references MeioApoio(nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Aciona(
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numProcessoSocorro int unique unsigned,
	constraint numMeio foreign key (numMeio) references Meio(numMeio),
	constraint nomeEntidade foreign key (nomeEntidade) references Meio(nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Coordenador(
	idCoordenador int not null unique unsigned,
	constraint idCoordenador primary key (idCoordenador)
);

create table Audita(
	idCoordenador int not null unique unsigned,
	numMeio int not null unique unsigned,
	nomeEntidade varchar(20) not null unique,
	numProcessoSocorro int unique unsigned,
	datahoraInicio timestamp not null,
	datahoraFim timestamp not null,
	dataAuditoria date not null,
	texto text not null,
	constraint numMeio foreign key (numMeio) references Aciona(numMeio),
	constraint nomeEntidade foreign key (nomeEntidade) references Aciona(nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references Aciona(numProcessoSocorro),
	constraint idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint chk_audit_time check (datahoraInicio < datahoraFim),
	constraint chk_audit_date check (dataAuditoria >= current_date) /*VERIFICAR*/
);

create table Solicita(
	idCoordenador int not null unique unsigned,
	dataHoraInicioVideo timestamp not null,
	numCamara int not null unique unsigned,
	dataHoraInicio timestamp not null,
	dataHoraFim timestamp not null,
	constraint idCoordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
	constraint dataHoraInicioVideo foreign key (dataHoraInicioVideo) references Video(dataHoraInicio),
	constraint numCamara foreign key (numCamara) references Camara(numCamara)
);