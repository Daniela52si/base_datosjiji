-- Base de Datos Relacional Glob-Gusters Video-Club
-- Autor: Daniela Gonzalez Cardenas
-- Fecha: 2026-09-15
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `glob_gusters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glob_gusters`;

-- Eliminación de la base de datos
-- DROP DATABASE IF EXISTS `glob_gusters`;
CREATE TABLE Actor (
    ActorID int primary key,
    NacionalidadID int,
    Nombre varchar(50) not null,
    Sexo char(1) not null
    CONSTRAINT fk_Nacionalidad
    FOREIGN KEY (NacionalidadID)
    REFERENCES Nacionalidad(NacionalidadID)
);

create table Nacionalidad (
    NacionalidadID int primary key,
    Nombre varchar(50) not null
     CONSTRAINT fk_Director
    FOREIGN KEY (DirectorID)
    REFERENCES Director(DirectorID)
); 

create table Reparto (
    ActorID int primary key,
    PeliculaID int foreign key,
    Rol int not null
    CONSTRAINT fk_Pelicula
    FOREIGN KEY (PeliculaID)
    REFERENCES Pelicula(PeliculaID)
);

create table Director (
    DirectorID int primary key,
    Nacionalidad_ID int foreign key,
    Nombre varchar(50) not null
);

create table Pelicula (
    PeliculaID int primary key,
    ProductoraID int foreign key,
    Titulo varchar(50) not null,
    DirectorID int foreign key,
    Fecha date
    CONSTRAINT fk_Ejemplar
    FOREIGN KEY (EjemplarID)
    REFERENCES Ejemplar(EjemplarID)
    
);

create table Productora (
    ProductoraID int primary key,
    Nombre varchar(50) not null
);

create table Ejemplar(
    EjemplarID int primary key,
    NumeroID int,
    EstadoID int foreign key,
    PeliculaID int foreign key
    CONSTRAINT fk_Estado
    FOREIGN KEY (EstadoID)
    REFERENCES Estado(EstadoID)
);


create table Estado (
    EstadoID int primary key,
    Nombre varchar(50) not null
);


--NO TIENE MAS RELACIONES DESDE ACTOR HASTA ESTADO--

create table Ejemplar_renta(
    EjemplarID int primary key,
    RentaID int foreign key,
    Entrega date not null
    CONSTRAINT fk_Renta
    FOREIGN KEY (RentaID)
    REFERENCES Renta(RentaID)
);

create table Renta (
    RentaID int primary key,
    ClienteDNI int foreign key,
    Inicia date not null,
    Entrega date not null
    CONSTRAINT fk_Cliente
    FOREIGN KEY (ClienteDNI)
    REFERENCES Cliente(ClienteDNI)
);

create table Cliente (
    DNI int primary key,
    ClienteDNI int foreign key,
    Nombre varchar(50) not null,
    Telefono int not null,
    Direccion varchar(100) not null
);

