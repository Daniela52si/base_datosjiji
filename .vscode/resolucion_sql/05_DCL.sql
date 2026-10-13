-- Script DCL: Sistema_academico
-- Autor: Yenifer Daniela Gonzalez Cardenas
-- Permisos (CREATE USER, GRANT, REVOKE)

-- 1. Crear usuarios
CREATE USER IF NOT EXISTS 'estudiante_user'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'profesor_user'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY '1234';

-- 2. GRANT: dar permisos

-- El estudiante solo puede consultar
GRANT SELECT ON Sistema_academico.* TO 'estudiante_user'@'localhost';

-- El profesor puede consultar, insertar y actualizar
GRANT SELECT, INSERT, UPDATE ON Sistema_academico.* TO 'profesor_user'@'localhost';

-- El administrador tiene todos los permisos sobre la base de datos
GRANT ALL PRIVILEGES ON Sistema_academico.* TO 'admin_user'@'localhost';

-- Permiso solo sobre una tabla
GRANT SELECT ON Sistema_academico.pago TO 'estudiante_user'@'localhost';

-- 3. Ver los permisos de cada usuario
SHOW GRANTS FOR 'estudiante_user'@'localhost';
SHOW GRANTS FOR 'profesor_user'@'localhost';
SHOW GRANTS FOR 'admin_user'@'localhost';

-- 4. REVOKE: quitar permisos

-- Al profesor se le quita el permiso de actualizar
REVOKE UPDATE ON Sistema_academico.* FROM 'profesor_user'@'localhost';

-- Ver como quedaron los permisos del profesor
SHOW GRANTS FOR 'profesor_user'@'localhost';

-- 5. Eliminar un usuario
DROP USER 'admin_user'@'localhost';