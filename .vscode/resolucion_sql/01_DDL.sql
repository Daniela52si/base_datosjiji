-- Base de Datos Relacional Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Fecha: 2026-09-15
-- DROP DATABASE IF EXISTS `Sistema_academico`;
USE `Sistema_academico`;

CREATE TABLE FACULTAD (
    facultad_id INT PRIMARY KEY,
    nombre_facultad VARCHAR(150) NOT NULL UNIQUE,
    ubicacion VARCHAR(100),
    presupuesto DECIMAL(12,2) NOT NULL,
    CONSTRAINT chk_presupuesto CHECK (presupuesto >= 0)
);

CREATE TABLE DOCENTE (
    docente_id INT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    identificacion VARCHAR(30) NOT NULL UNIQUE,
    correo_institucional VARCHAR(150) NOT NULL UNIQUE,
    especialidad VARCHAR(100),
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    facultad_id INT NOT NULL,
    CONSTRAINT chk_salario CHECK (salario >= 0),
    CONSTRAINT fk_docente_facultad
        FOREIGN KEY (facultad_id) REFERENCES FACULTAD (facultad_id)
);

ALTER TABLE ESTUDIANTE
    ADD fecha_nacimiento DATE NULL,
    ADD ciudad_residencia VARCHAR(100) NULL;

ALTER TABLE grupo
    ADD docente_id INT NULL,
    ADD CONSTRAINT fk_grupo_docente
        FOREIGN KEY (docente_id) REFERENCES DOCENTE (docente_id);

ALTER TABLE horario ADD tipo_aula VARCHAR(50);
ALTER TABLE asignatura ADD descripcion VARCHAR(500);