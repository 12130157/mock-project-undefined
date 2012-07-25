drop database FinalTaind
create database FinalTaind
go
use FinalTaind
go
create table Bees
(
	Id int primary key identity(1,1),
	IdType int not null,
	Health float,
	IsDead bit
)
go
create table TypeBees
(
	IdType int primary key identity(1,1),
	NameType nvarchar(500)
)
go
alter table Bees
add constraint fk_1 foreign key(IdType)
references TypeBees(IdType)

