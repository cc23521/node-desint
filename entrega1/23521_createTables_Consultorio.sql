create table Tipo_Consulta (
	codTConsulta int identity,
	descricao text not null,
	constraint PK_codConsulta primary key (codConsulta)
)

create table Status_Consulta (
	codSConsulta int identity,
	descricao varchar(25) not null,
	constraint PK_codStatus primary key (codStatus)
)

create table Especialidade_Medica (
	codEspecialidade int identity,
	descricao varchar(25) not null,
	constraint PK_codEspecialidade primary key (codEspecialidade)
)

create table Medico (
	idMedico int identity,
	codEspecialidade int,
	prenome varchar(50) not null,
	sobrenome varchar(50) not null,
	email varchar(50) not null,
	senha varchar(16) not null,
	constraint PK_idMedico primary key (idMedico),
	constraint FK_codEspecialidade foreign key (codEspecialidade) references Especialidade_Medica(codEspecialidade)
)

create table Paciente (
	idPaciente int identity,
	prenome varchar(50) not null,
	sobrenome varchar(50) not null,
	email varchar(50) not null,
	senha varchar(16) not null,
	constraint PK_idPaciente primary key (idPaciente)
)

create table Consulta (
	idConsulta int identity,
	codTConsulta int,
	codSConsulta int,
	idMedico int,
	idPaciente int,
	dataConsulta date not null,
	horaConsulta time not null,
	constraint PK_idConsulta primary key (idConsulta),
	constraint FK_codTConsulta foreign key (codTConsulta) references Tipo_Consulta(codTConsulta),
	constraint FK_codSConsulta foreign key (codSConsulta) references Status_Consulta(codSConsulta),
	constraint FK_idMedico foreign key (idMedico) references Medico(idMedico),
	constraint FK_idPaciente foreign key (idPaciente) references Paciente(idPaciente)
)