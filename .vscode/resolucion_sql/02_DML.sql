-- Script DML: Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Contiene: INSERT (datos ficticios), UPDATE y DELETE
-- Requisito: haber ejecutado antes 01_DDL.sql
USE `Sistema_academico`;


-- 1. INSERT (orden respetando las llaves foraneas)

INSERT INTO PROGRAMA_ACADEMICO
    (programa_academicoID, Nombre, fecha_inicio, fecha_final, Descripcion)
VALUES
    (1, 'Ingenieria de Sistemas', '2026-02-01', '2030-12-01', 'Programa profesional de 10 semestres'),
    (2, 'Administracion de Empresas', '2026-02-01', '2030-12-01', 'Programa profesional de 10 semestres'),
    (3, 'Tecnologia en Analisis de Datos', '2026-02-01', '2029-06-01', 'Programa tecnologico de 6 semestres');


INSERT INTO ESTUDIANTE
    (EstudianteID, Nombre, Documento, programa_academicoID, Telefono, email, fecha_registro, activo)
VALUES
    (1, 'Laura Perez',    '1001001', 1, '3001112233', 'laura.perez@mail.com',    '2026-01-15', TRUE),
    (2, 'Carlos Ruiz',    '1001002', 2, '3002223344', 'carlos.ruiz@mail.com',    '2026-01-16', TRUE),
    (3, 'Maria Gomez',    '1001003', 1, '3003334455', 'maria.gomez@mail.com',    '2026-01-17', TRUE),
    (4, 'Andres Torres',  '1001004', 3, '3004445566', 'andres.torres@mail.com',  '2026-01-18', TRUE),
    (5, 'Sofia Ramirez',  '1001005', 2, '3005556677', 'sofia.ramirez@mail.com',  '2026-01-19', TRUE),
    (6, 'Juan Castro',    '1001006', 3, '3006667788', 'juan.castro@mail.com',    '2026-01-20', FALSE);


INSERT INTO PERIODO_ACADEMICO
    (periodo_academicoID, nombre, fecha_registro, programa_academicoID)
VALUES
    (1, '2026-1', '2026-01-10', 1),
    (2, '2026-1', '2026-01-10', 2),
    (3, '2026-1', '2026-01-10', 3),
    (4, '2026-2', '2026-07-01', 1);

INSERT INTO asignatura
    (asignaturaID, nombre, creditos)
VALUES
    (1, 'Bases de Datos', 3),
    (2, 'Programacion I', 4),
    (3, 'Matematicas Basicas', 3),
    (4, 'Contabilidad General', 3),
    (5, 'Estadistica', 3);


INSERT INTO PERIODO_ACADEMICO_ASIGNATURA
    (periodo_academicoID, asignaturaID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 3),
    (2, 4),
    (3, 1),
    (3, 5),
    (4, 1);


INSERT INTO grupo
    (grupoID, asignaturaID, numero, cupo)
VALUES
    (1, 1, 1, 30),
    (2, 1, 2, 25),
    (3, 2, 1, 30),
    (4, 3, 1, 40),
    (5, 4, 1, 35),
    (6, 5, 1, 30);


INSERT INTO horario
    (horarioID, grupoID, dia, hora_inicio, hora_fin, aula)
VALUES
    (1, 1, 'Lunes',     '07:00:00', '09:00:00', 'A-101'),
    (2, 2, 'Martes',    '09:00:00', '11:00:00', 'A-102'),
    (3, 3, 'Miercoles', '11:00:00', '13:00:00', 'B-201'),
    (4, 4, 'Jueves',    '07:00:00', '09:00:00', 'B-202'),
    (5, 5, 'Viernes',   '14:00:00', '16:00:00', 'C-301'),
    (6, 6, 'Sabado',    '08:00:00', '10:00:00', 'C-302');

-- un estudiante solo puede matricularse una vez por periodo

INSERT INTO matricula
    (matriculaID, periodo_academicoID, estudianteID, fecha, estado, total)
VALUES
    (1, 1, 1, '2026-01-25', 'Activa',    1500000.00),
    (2, 2, 2, '2026-01-26', 'Activa',    1200000.00),
    (3, 1, 3, '2026-01-27', 'Activa',    1500000.00),
    (4, 3, 4, '2026-01-28', 'Pendiente',  900000.00),
    (5, 2, 5, '2026-01-29', 'Activa',    1200000.00),
    (6, 3, 6, '2026-01-30', 'Cancelada',  900000.00);


INSERT INTO matricula_grupo
    (matriculaID, grupoID)
VALUES
    (1, 1),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 2),
    (3, 4),
    (4, 6),
    (5, 4),
    (5, 5),
    (6, 6);

-- incluye estado_pago, agregado con ALTER TABLE en el DDL
INSERT INTO pago
    (pagoID, total, fecha_pago, metodo_pago, matriculaID, estado_pago)
VALUES
    (1, 1500000.00, '2026-01-26', 'Tarjeta de credito', 1, 'Pagado'),
    (2, 1200000.00, '2026-01-27', 'Transferencia',      2, 'Pagado'),
    (3,  750000.00, '2026-01-28', 'Efectivo',           3, 'Parcial'),
    (4,  900000.00, '2026-01-29', 'PSE',                4, 'Pendiente'),
    (5, 1200000.00, '2026-01-30', 'Tarjeta debito',     5, 'Pagado'),
    (6,  900000.00, '2026-01-31', 'Efectivo',           6, 'Reembolsado');


-- 2. UPDATE

-- Actualizar el telefono de un estudiante
UPDATE ESTUDIANTE
SET Telefono = '3109998877'
WHERE EstudianteID = 1;

-- Cambiar el estado de una matricula pendiente a activa
UPDATE matricula
SET estado = 'Activa'
WHERE matriculaID = 4;

-- Completar el pago parcial
UPDATE pago
SET total = 1500000.00,
    estado_pago = 'Pagado'
WHERE pagoID = 3;

-- Ampliar el cupo de un grupo
UPDATE grupo
SET cupo = cupo + 5
WHERE grupoID = 1;


-- 3. DELETE


DELETE FROM horario
WHERE horarioID = 6;

DELETE FROM matricula_grupo
WHERE matriculaID = 6;

DELETE FROM pago
WHERE matriculaID = 6;

DELETE FROM matricula
WHERE matriculaID = 6;