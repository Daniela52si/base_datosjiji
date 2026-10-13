# Glob-Gusters Video-Club · Base de Datos Relacional


Motor de base de datos: **MariaDB / MySQL** sobre entorno **XAMPP**.
# Sistema_academico

Proyecto de base de datos relacional en MySQL para gestionar un sistema académico: programas, estudiantes, periodos, asignaturas, grupos, horarios, matrículas y pagos.

**Autora:** Yenifer Daniela Gonzalez Cardenas
**Fecha:** 2026-10-13

## Herramientas utilizadas

- MySQL (servidor local con XAMPP)
- phpMyAdmin
- Visual Studio Code con la extensión SQLTools

## Estructura del proyecto

```
resolucion_sql/
├── 01_DDL.sql   -> Crea la base de datos y las tablas
├── 02_DML.sql   -> Inserta datos ficticios, actualiza y elimina
├── 03_DQL.sql   -> Consultas SELECT
├── 04_VDL.sql   -> Vistas
├── 05_DCL.sql   -> Usuarios y permisos
└── 06_TCL.sql   -> Transacciones
```

## Tablas de la base de datos

| Tabla | Descripción |
|---|---|
| PROGRAMA_ACADEMICO | Programas que ofrece la institución |
| ESTUDIANTE | Datos de los estudiantes |
| PERIODO_ACADEMICO | Periodos académicos de cada programa |
| asignatura | Materias y sus créditos |
| PERIODO_ACADEMICO_ASIGNATURA | Relación entre periodos y asignaturas |
| grupo | Grupos de cada asignatura con su cupo |
| horario | Día, hora y aula de cada grupo |
| matricula | Matrícula de un estudiante en un periodo |
| matricula_grupo | Grupos en los que está inscrita cada matrícula |
| pago | Pagos realizados por cada matrícula |

## Cómo ejecutar los scripts

1. Iniciar MySQL desde XAMPP.
2. Conectar SQLTools a `localhost` (puerto 3306, usuario `root`).
3. Ejecutar los scripts **en este orden**:
   1. `01_DDL.sql`
   2. `02_DML.sql`
   3. `03_DQL.sql`
   4. `04_VDL.sql`
   5. `05_DCL.sql`
   6. `06_TCL.sql`

## Contenido de cada script

- **DDL (Data Definition Language):** `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`.
- **DML (Data Manipulation Language):** `INSERT`, `UPDATE`, `DELETE`.
- **DQL (Data Query Language):** `SELECT` con `WHERE`, `ORDER BY`, `GROUP BY`, funciones de agregación y `JOIN`.
- **VDL (View Definition Language):** `CREATE VIEW` y `DROP VIEW`.
- **DCL (Data Control Language):** `CREATE USER`, `GRANT`, `REVOKE`.
- **TCL (Transaction Control Language):** `START TRANSACTION`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`.

## Notas

- El `01_DDL.sql` incluye una línea `DROP DATABASE` comentada. Si se activa, borra la base de datos y todos sus datos.
- El `02_DML.sql` debe ejecutarse una sola vez; si se repite, aparece el error `Duplicate entry` por las llaves primarias.
- Los usuarios creados en el `05_DCL.sql` usan contraseñas de ejemplo, solo para la práctica.
