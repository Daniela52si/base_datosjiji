-- Base de Datos Relacional Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Fecha: 2026-09-15

CREATE DATABASE IF NOT EXISTS `Sistema_academico`
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE `Sistema_academico`;

-- Para eliminar la base de datos, descomenta la siguiente línea.
-- DROP DATABASE IF EXISTS `Sistema_academico`;

CREATE TABLE PROGRAMA_ACADEMICO (
    programa_academicoID INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    Descripcion TEXT,
    CONSTRAINT chk_fechas
        CHECK (fecha_final >= fecha_inicio)
);

CREATE TABLE ESTUDIANTE (
    EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    programa_academicoID INT,
    Telefono VARCHAR(20),
    email VARCHAR(255) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_est_programa_academico
        FOREIGN KEY (programa_academicoID)
        REFERENCES PROGRAMA_ACADEMICO (programa_academicoID)
);

CREATE TABLE PERIODO_ACADEMICO (
    periodo_academicoID INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL,
    programa_academicoID INT,
    CONSTRAINT fk_periodo_programa_academico
        FOREIGN KEY (programa_academicoID)
        REFERENCES PROGRAMA_ACADEMICO (programa_academicoID)
);

CREATE TABLE asignatura (
    asignaturaID INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    creditos INT NOT NULL,
    CONSTRAINT chk_creditos
        CHECK (creditos > 0)
);

CREATE TABLE PERIODO_ACADEMICO_ASIGNATURA (
    periodo_academicoID INT NOT NULL,
    asignaturaID INT NOT NULL,
    PRIMARY KEY (periodo_academicoID, asignaturaID),
    CONSTRAINT fk_paa_periodo_academico
        FOREIGN KEY (periodo_academicoID)
        REFERENCES PERIODO_ACADEMICO (periodo_academicoID),
    CONSTRAINT fk_paa_asignatura
        FOREIGN KEY (asignaturaID)
        REFERENCES asignatura (asignaturaID)
);

CREATE TABLE grupo (
    grupoID INT PRIMARY KEY,
    asignaturaID INT NOT NULL,
    numero INT NOT NULL,
    cupo INT NOT NULL,
    CONSTRAINT chk_cupo
        CHECK (cupo > 0),
    CONSTRAINT uq_grupo_asignatura_numero
        UNIQUE (asignaturaID, numero),
    CONSTRAINT fk_grupo_asignatura
        FOREIGN KEY (asignaturaID)
        REFERENCES asignatura (asignaturaID)
);

CREATE TABLE horario (
    horarioID INT PRIMARY KEY,
    grupoID INT NOT NULL,
    dia VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    aula VARCHAR(30) NOT NULL,
    CONSTRAINT chk_horario
        CHECK (hora_fin > hora_inicio),
    CONSTRAINT fk_horario_grupo
        FOREIGN KEY (grupoID)
        REFERENCES grupo (grupoID)
);

CREATE TABLE matricula (
    matriculaID INT PRIMARY KEY,
    periodo_academicoID INT NOT NULL,
    estudianteID INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_total
        CHECK (total >= 0),
    CONSTRAINT uq_matricula_estudiante_periodo
        UNIQUE (estudianteID, periodo_academicoID),
    CONSTRAINT fk_matricula_estudiante
        FOREIGN KEY (estudianteID)
        REFERENCES ESTUDIANTE (EstudianteID),
    CONSTRAINT fk_matricula_periodo_academico
        FOREIGN KEY (periodo_academicoID)
        REFERENCES PERIODO_ACADEMICO (periodo_academicoID)
);

CREATE TABLE matricula_grupo (
    matriculaID INT NOT NULL,
    grupoID INT NOT NULL,
    PRIMARY KEY (matriculaID, grupoID),
    CONSTRAINT fk_matricula_grupo_matricula
        FOREIGN KEY (matriculaID)
        REFERENCES matricula (matriculaID),
    CONSTRAINT fk_matricula_grupo_grupo
        FOREIGN KEY (grupoID)
        REFERENCES grupo (grupoID)
);

CREATE TABLE pago (
    pagoID INT PRIMARY KEY,
    total DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(255) NOT NULL,
    matriculaID INT NOT NULL,
    CONSTRAINT chk_total_pago
        CHECK (total >= 0),
    CONSTRAINT fk_pago_matricula
        FOREIGN KEY (matriculaID)
        REFERENCES matricula (matriculaID)
    ALTER TABLE pago
    ADD estado_pago VARCHAR(255) NOT NULL
);
