create schema consultorio

create table consultorio.Tipo_Consulta (
	codConsulta int identity,
	descricao text not null,
	constraint PK_codConsulta primary key (codConsulta)
)

create table consultorio.Status_Consulta (
	codStatus int identity,
	descricao varchar(25) not null,
	constraint PK_codStatus primary key (codStatus)
)

create table consultorio.Especialidade_Medica (
	codEspecialidade int identity,
	descricao varchar(25) not null,
	constraint PK_codEspecialidade primary key (codEspecialidade)
)

create table consultorio.Medico (
	idMedico int identity,
	codEspecialidade int,
	prenome varchar(50) not null,
	sobrenome varchar(50) not null,
	email varchar(50) not null,
	constraint PK_idMedico primary key (idMedico),
	constraint FK_codEspecialidade foreign key (codEspecialidade) references consultorio.Especialidade_Medica(codEspecialidade)
)

create table consultorio.Paciente (
	idPaciente int identity,
	prenome varchar(50) not null,
	sobrenome varchar(50) not null,
	email varchar(50) not null,
	constraint PK_idPaciente primary key (idPaciente)
)

create table consultorio.Consulta (
	idConsulta int identity,
	codConsulta int,
	codStatus int,
	idMedico int,
	idPaciente int,
	dataConsulta date not null,
	horaConsulta time not null,
	constraint PK_idConsulta primary key (idConsulta),
	constraint FK_codConsulta foreign key (codConsulta) references consultorio.Tipo_Consulta(codConsulta),
	constraint FK_codStatus foreign key (codStatus) references consultorio.Status_Consulta(codStatus),
	constraint FK_idMedico foreign key (idMedico) references consultorio.Medico(idMedico),
	constraint FK_idPaciente foreign key (idPaciente) references consultorio.Paciente(idPaciente)
)