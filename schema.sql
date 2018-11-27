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

create table Camara
    (numCamara int not null unique,
    constraint pk_camara primary key(numCamara)
);

create table Video
    (dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null,
    numCamara int not null ,
    constraint pk_video primary key (dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint chk_video_time check (dataHoraFim > dataHoraInicio)
);

create table SegmentoVideo
    (numSegmento int not null ,
    duracao int not null,
    dataHoraInicio timestamp not null,
    numCamara int not null ,
    constraint pk_segment primary key (numCamara, numSegmento, dataHoraInicio),
    constraint fk_camara foreign key (numCamara) references Camara(numCamara),
    constraint fk_dataHoraInicio foreign key (dataHoraInicio) references Video(dataHoraInicio)
);

create table Locais
	(moradaLocal varchar(255) not null unique,
	constraint pk_local primary key (moradaLocal)
);

create table Vigia
	(moradaLocal varchar(255) not null,
	numCamara int not null unique,
	constraint fk_local foreign key (moradaLocal) references Locais(moradaLocal),
	constraint fk_camara foreign key (numCamara) references Camara(numCamara)
);

create table ProcessoSocorro
	(numProcessoSocorro int not null unique,
	constraint pk_numProcessoSocorro primary key (numProcessoSocorro)
	--verificar restricao para todos os processo estarem associados a um ou mais evento de emergencia */
);

create table EventoEmergencia
	(numTelefone char(9) not null,
	instanteChamada timestamp not null,
	nomePessoa varchar(30) not null,
	moradaLocal varchar(255) not null,
	numProcessoSocorro int,
	constraint pk_witness primary key(numTelefone, nomePessoa),
	constraint fk_local foreign key (moradaLocal) references Locais(moradaLocal),
	constraint fk_numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table EntidadeMeio
	(nomeEntidade varchar(20) not null unique,
	constraint pk_nomeEntidade primary key (nomeEntidade)
);

create table Meio
	(numMeio int not null,
	nomeMeio varchar(30) not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meio primary key (numMeio, nomeEntidade),
	constraint fk_nomeEntidade foreign key (nomeEntidade) references EntidadeMeio(nomeEntidade)
);

create table MeioCombate
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meioCombate primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)
);

create table MeioApoio
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint pk_meioApoio primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)
);

create table MeioSocorro
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	constraint fk_meioSocorro primary key (numMeio, nomeEntidade),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade)

);

create table Transporta
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numVitimas int not null ,
	numProcessoSocorro int not null,
	constraint fk_meio foreign key (numMeio, nomeEntidade) references MeioSocorro(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Alocado
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numHoras int not null ,
	numProcessoSocorro int,
	constraint fk_meio foreign key (numMeio, nomeEntidade) references MeioApoio(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Aciona
	(numMeio int not null,
	nomeEntidade varchar(20) not null,
	numProcessoSocorro int not null,
	constraint pk_aciona primary key (numMeio, nomeEntidade, numProcessoSocorro),
	constraint fk_meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade),
	constraint numProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro)
);

create table Coordenador
	(idCoordenador int not null unique ,
	constraint idCoordenador primary key (idCoordenador)
);

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
	constraint chk_audit_date check (dataAuditoria <= current_date) /*VERIFICAR*/
);

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
