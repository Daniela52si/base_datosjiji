-- Script VDL: Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Vistas (CREATE VIEW)

-- 1. Vista de los estudiantes activos
CREATE OR REPLACE VIEW vista_estudiantes_activos AS
SELECT EstudianteID, Nombre, Documento, email
FROM ESTUDIANTE
WHERE activo = TRUE;

-- 2. Vista de cada estudiante con su programa
CREATE OR REPLACE VIEW vista_estudiante_programa AS
SELECT ESTUDIANTE.Nombre AS estudiante,
       PROGRAMA_ACADEMICO.Nombre AS programa
FROM ESTUDIANTE
INNER JOIN PROGRAMA_ACADEMICO
    ON ESTUDIANTE.programa_academicoID = PROGRAMA_ACADEMICO.programa_academicoID;

-- 3. Vista de las matriculas con el estudiante y el periodo
CREATE OR REPLACE VIEW vista_matriculas AS
SELECT matricula.matriculaID,
       ESTUDIANTE.Nombre AS estudiante,
       PERIODO_ACADEMICO.nombre AS periodo,
       matricula.estado,
       matricula.total
FROM matricula
INNER JOIN ESTUDIANTE
    ON matricula.estudianteID = ESTUDIANTE.EstudianteID
INNER JOIN PERIODO_ACADEMICO
    ON matricula.periodo_academicoID = PERIODO_ACADEMICO.periodo_academicoID;

-- 4. Vista de los pagos con el nombre del estudiante
CREATE OR REPLACE VIEW vista_pagos AS
SELECT ESTUDIANTE.Nombre AS estudiante,
       pago.total,
       pago.metodo_pago,
       pago.estado_pago
FROM pago
INNER JOIN matricula
    ON pago.matriculaID = matricula.matriculaID
INNER JOIN ESTUDIANTE
    ON matricula.estudianteID = ESTUDIANTE.EstudianteID;

-- 5. Vista de los grupos con su asignatura y horario
CREATE OR REPLACE VIEW vista_grupos AS
SELECT asignatura.nombre AS asignatura,
       grupo.numero AS grupo,
       grupo.cupo,
       horario.dia,
       horario.aula
FROM grupo
INNER JOIN asignatura
    ON grupo.asignaturaID = asignatura.asignaturaID
INNER JOIN horario
    ON horario.grupoID = grupo.grupoID;

-- Consultar las vistas
SELECT * FROM vista_estudiantes_activos;
SELECT * FROM vista_estudiante_programa;
SELECT * FROM vista_matriculas;
SELECT * FROM vista_pagos;
SELECT * FROM vista_grupos;

-- Una vista tambien se puede filtrar
SELECT * FROM vista_pagos
WHERE estado_pago = 'Pendiente';

-- Crear una vista de prueba y luego eliminarla
CREATE VIEW vista_prueba AS
SELECT Nombre FROM ESTUDIANTE;

DROP VIEW vista_prueba;