---------------------------------------------
---             CREATE TABLES             ---
---------------------------------------------

create table Camaras (
    numCamara numeric not null unique unsigned,
    constraint pk_camara primary key(numCamara)
);

create table Video (
    dataHorainicio timestamp not null,
    dataHoraFim timestamp not null,
    numCamera numeric not null unsigned,
    constraint pk_video primary key (dataHorainicio),
    constraint fk_camera foreign key (numCamara) references Camara(numCamara)
);

create table SegmentoVideo (
    numSegmento numeric not null unsigned,
    duracao time not null,
    dataHoraInicio timestamp not null,
    numCamera numeric not null unsigned,
    constraint pk_segment primary key (numSegmento)
);