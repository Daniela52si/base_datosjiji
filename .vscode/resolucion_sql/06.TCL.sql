-- Script TCL: Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Transacciones (START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT)

-- 1. COMMIT: guardar los cambios
-- Se paga una matricula pendiente y se confirma el cambio
START TRANSACTION;

UPDATE pago
SET estado_pago = 'Pagado'
WHERE pagoID = 4;

UPDATE matricula
SET estado = 'Activa'
WHERE matriculaID = 4;

COMMIT;

SELECT pagoID, estado_pago FROM pago WHERE pagoID = 4;


-- 2. ROLLBACK: deshacer los cambios
-- Se cambia el estado de un pago, pero luego se cancela
START TRANSACTION;

UPDATE pago
SET estado_pago = 'Cancelado'
WHERE pagoID = 1;

-- Aqui el estado ya aparece como Cancelado (dentro de la transaccion)
SELECT pagoID, estado_pago FROM pago WHERE pagoID = 1;

ROLLBACK;

-- Despues del ROLLBACK vuelve a quedar como estaba
SELECT pagoID, estado_pago FROM pago WHERE pagoID = 1;


-- 3. SAVEPOINT: punto de guardado dentro de la transaccion
START TRANSACTION;

UPDATE ESTUDIANTE
SET Telefono = '3000000001'
WHERE EstudianteID = 2;

SAVEPOINT cambio_telefono;

UPDATE ESTUDIANTE
SET activo = FALSE
WHERE EstudianteID = 2;

-- Se deshace solo el ultimo cambio (activo), el del telefono se mantiene
ROLLBACK TO cambio_telefono;

COMMIT;

SELECT EstudianteID, Nombre, Telefono, activo
FROM ESTUDIANTE
WHERE EstudianteID = 2;