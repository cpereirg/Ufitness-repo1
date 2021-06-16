create database ufitness;

create table cliente(
	id_cliente bigint PRIMARY KEY auto_increment,
	nome varchar(255),
    email varchar(255) UNIQUE,
    senha varchar(255),
    enabled boolean
)engine=InnoDB;

create table dados_pagamento(
	id_cliente bigint PRIMARY KEY auto_increment,
	cpf varchar(255) UNIQUE,
    cartaoCredito varchar(16),
    codigoSeguranca bigint,
    cep varchar(255),
    cidade varchar(255),
    endereco varchar(255),
    
    constraint clientFK foreign key(id_cliente) references cliente(id_cliente)
)engine=InnoDB;

create table smartband(
	id_client bigint primary key auto_increment,
    modelo_smartband varchar(255),
	
    constraint clientSMBNDFK foreign key(id_client) references cliente(id_cliente) 
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;    

create table perfomance(
	id_cliente bigint,
    id_performance bigint primary key auto_increment,
    mediaMensal float, 
    mediaSemanal float,
    mediaGanhoMassaMagra float,
    evolucaoForca float,
    
  constraint clientPERFK foreign key(id_cliente) references cliente(id_cliente) 
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

create table localizacao(
	id_performance bigint not null,
    id_localizacao bigint primary key auto_increment,
    lat double, 
    lon double,
    
    constraint localizacaoFK foreign key(id_performance) REFERENCES perfomance(id_performance)
)engine=InnoDB;


create table instrutor(
	id_instrutor bigint PRIMARY KEY auto_increment,
	nome varchar(255),
    email varchar(255) UNIQUE,
    senha varchar(255), 
    cpf varchar(11),
    fotoDiploma varchar(11),
    enabled boolean default false
);

create table dados_bancarios(
	id_instrutor bigint primary KEY,
    contaCorrente varchar(7) unique not null ,
    agencia bigint unique not null,
    
    constraint dadosBanFK Foreign Key(id_instrutor) references instrutor(id_instrutor)
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

create table avaliacao(
	id_instrutor bigint not null,
    id_avaliacao bigint primary key auto_increment,
    totalAvaliacao bigint not null,
    numeroEstrelas bigint not null,
	mediaAvaliacao float not null default 0,
    
    constraint avaFK FOREIGN KEY(id_instrutor) references instrutor(id_instrutor)
		ON DELETE CASCADE ON UPDATE cascade
)engine=InnoDB;

create table pacoteServicos(
	id_pacote bigint primary key auto_increment, 
    id_instrutor bigint,
    descricao text,
    tipo_aula varchar(25),
    duracao int,
    preco float not null,
    
    constraint pkgService FOREIGN KEY(id_instrutor) REFERENCES instrutor(id_instrutor)
		ON DELETE CASCADE ON update CASCADE
)engine=InnoDB;

create table aula(
	id_aula bigint primary key auto_increment,
    id_pacote bigint,
    duracaoAula int,
    descricao text,
    progresso float,
    
    constraint aulaFK FOREIGN KEY(id_pacote) REFERENCES pacoteServicos(id_pacote)
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

create table aulaSincrona(
	id_aula bigint,
    id_aula_sync bigint primary key auto_increment,
    constraint assyncFK FOREIGN KEY(id_aula) REFERENCES aula(id_aula)
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

create table diasTreino(
	id_dia_treino bigint auto_increment primary key,
    id_aula bigint,
    diaTreino date,
    
    constraint diasTreinoFK FOREIGN KEY(id_aula) REFERENCES aulaSincrona(id_aula)
		ON DELETE CASCADE ON UPDATE CASCADE
);

create table aulaAssincrona(
	id_aula bigint,
    id_aula_async bigint primary key auto_increment,
	video_url varchar(500) not null,
	
    constraint assynchronousFK FOREIGN KEY(id_aula) REFERENCES aula(id_aula)
		ON DELETE CASCADE ON UPDATE CASCADE
);

create table equipamento(
	id_equipamento bigint primary key auto_increment,
    id_aula bigint,
    nome_equipamento varchar(255),
    
    constraint equiFK FOREIGN KEY(id_aula) REFERENCES aula(id_aula)
);

create table clientePacoteServico(
	id_cliente bigint not null,
    id_pacote bigint not null,
        primary key(id_cliente, id_pacote),
        
    CONSTRAINT clientPKG FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT pkgFK FOREIGN KEY(id_pacote) REFERENCES pacoteServicos(id_pacote)
		ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

create table administrador(
	id_adm bigint primary key auto_increment,
    nome varchar(255) not null,
    email varchar(255) not null,
    senhar varchar(255) not null,
    roles varchar(255) not null
);

