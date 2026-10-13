-- Script DQL: Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Consultas SELECT


-- 1 Ver todos los estudiantes
SELECT * FROM ESTUDIANTE;

-- 2 Ver solo el nombre y el email de los estudiantes
SELECT Nombre, email FROM ESTUDIANTE;

-- 3 Estudiantes que estan activos
SELECT Nombre, Documento
FROM ESTUDIANTE
WHERE activo = TRUE;

-- 4 Estudiantes ordenados por nombre
SELECT Nombre, fecha_registro
FROM ESTUDIANTE
ORDER BY Nombre ASC;

-- 5 Asignaturas con mas de 3 creditos
SELECT nombre, creditos
FROM asignatura
WHERE creditos > 3;

-- 6 Estudiantes cuyo nombre empieza por la letra L
SELECT Nombre
FROM ESTUDIANTE
WHERE Nombre LIKE 'L%';

-- 7 Matriculas con total entre 1000000 y 1500000
SELECT matriculaID, estado, total
FROM matricula
WHERE total BETWEEN 1000000 AND 1500000;

-- 8 Los 3 pagos mas altos
SELECT pagoID, total, metodo_pago
FROM pago
ORDER BY total DESC
LIMIT 3;

-- 9 Cuantos estudiantes hay
SELECT COUNT(*) AS total_estudiantes
FROM ESTUDIANTE;

-- 10 Suma de todos los pagos
SELECT SUM(total) AS total_pagado
FROM pago;

-- 11 Promedio de los creditos de las asignaturas
SELECT AVG(creditos) AS promedio_creditos
FROM asignatura;

-- 12 Cantidad de estudiantes por programa
SELECT programa_academicoID, COUNT(*) AS cantidad
FROM ESTUDIANTE
GROUP BY programa_academicoID;

-- 13 Nombre de cada estudiante con su programa (JOIN)
SELECT ESTUDIANTE.Nombre, PROGRAMA_ACADEMICO.Nombre AS programa
FROM ESTUDIANTE
INNER JOIN PROGRAMA_ACADEMICO
    ON ESTUDIANTE.programa_academicoID = PROGRAMA_ACADEMICO.programa_academicoID;

-- 14 Matriculas con el nombre del estudiante
SELECT matricula.matriculaID, ESTUDIANTE.Nombre, matricula.estado, matricula.total
FROM matricula
INNER JOIN ESTUDIANTE
    ON matricula.estudianteID = ESTUDIANTE.EstudianteID;

-- 15 Pagos con el nombre del estudiante que los hizo
SELECT ESTUDIANTE.Nombre, pago.total, pago.metodo_pago, pago.estado_pago
FROM pago
INNER JOIN matricula
    ON pago.matriculaID = matricula.matriculaID
INNER JOIN ESTUDIANTE
    ON matricula.estudianteID = ESTUDIANTE.EstudianteID;

-- 16 Grupos con el nombre de su asignatura
SELECT grupo.grupoID, asignatura.nombre, grupo.numero, grupo.cupo
FROM grupo
INNER JOIN asignatura
    ON grupo.asignaturaID = asignatura.asignaturaID;