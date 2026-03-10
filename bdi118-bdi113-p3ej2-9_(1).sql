/*
Asignatura: Bases de Datos I
Curso: 2025/26
Convocatoria: enero

Practica: P3. Definicion y Modificacion de Datos en SQL

Equipo de practicas: bdi118 y bdi113
 Integrante 1:Alejandro Sánchez Garrido
 Integrante 2: Pablo Martínez López
*/

--------------------------------------------------------------------------------------
-- EJERCICIO 2. Annadir / Eliminar columnas
-- Annadir texto a mensaje
ALTER TABLE mensaje ADD( 
    texto VARCHAR(35));


-- Annadir numero_mensajes a perfil
ALTER TABLE perfil ADD( 
    numero_mensajes NUMBER(3) DEFAULT 0 NOT NULL);
    
-- Eliminar la columna de perfil llamada descripcion
ALTER TABLE perfil DROP COLUMN descripcion;

--------------------------------------------------------------------------------------
-- EJERCICIO 3. Modificar valores de una columna 
-- UPDATE numero_mensajes
UPDATE perfil p SET numero_mensajes = (
    SELECT COUNT(*)
    FROM mensaje m 
    WHERE m.perfil = p.movil);

COMMIT;

-- Modificar mensajes anclados antigüos
UPDATE mensaje m SET texto = 'CHAT ANTIGUO: VALORA SU BORRADO' WHERE m.mensaje_id IN (
    SELECT c.msj_anclado
    FROM chat_grupo c
    WHERE c.codigo IN (
        SELECT chat_grupo
        FROM mensaje
        GROUP BY chat_grupo
        HAVING MAX(diahora) < TO_DATE('03/04/2024', 'DD/MM/YYYY')));

-- Mostrar los mensajes anclados modificados
SELECT c.codigo, c.nombre, m.texto
FROM chat_grupo c
    JOIN mensaje m ON c.msj_anclado = m.mensaje_id
WHERE m.texto = 'CHAT ANTIGUO: VALORA SU BORRADO';

-- Deshacer el cambio
ROLLBACK;

SELECT c.codigo, c.nombre, m.texto
FROM chat_grupo c
    JOIN mensaje m ON c.msj_anclado = m.mensaje_id;

--------------------------------------------------------------------------------------
-- EJERCICIO 4. Modificar el valor de una clave primaria 
-- Cambia el telefono de perfil 600000004 a 610000004
ALTER TABLE chat_grupo DISABLE CONSTRAINT chat_fk_admin;
ALTER TABLE contacto DISABLE CONSTRAINT contacto_fk_perfil;
ALTER TABLE mensaje DISABLE CONSTRAINT mensaje_fk_perfil;
ALTER TABLE participacion DISABLE CONSTRAINT participacion_fk_perfil;
ALTER TABLE email_contacto DISABLE CONSTRAINT emailc_fk_contacto;

UPDATE chat_grupo SET administrador = 610000004 WHERE administrador = 600000004;
UPDATE contacto SET perfil = 610000004 WHERE perfil = 600000004;
UPDATE mensaje SET perfil = 610000004 WHERE perfil = 600000004;
UPDATE participacion SET perfil = 610000004 WHERE perfil = 600000004;
UPDATE email_contacto SET perfil = 610000004 WHERE perfil = 600000004; 

UPDATE perfil SET movil = 610000004 WHERE movil = 600000004;

ALTER TABLE chat_grupo ENABLE CONSTRAINT chat_fk_admin;
ALTER TABLE contacto ENABLE CONSTRAINT contacto_fk_perfil;
ALTER TABLE mensaje ENABLE CONSTRAINT mensaje_fk_perfil;
ALTER TABLE participacion ENABLE CONSTRAINT participacion_fk_perfil;
ALTER TABLE email_contacto ENABLE CONSTRAINT emailc_fk_contacto;

-- Comprobacion
SELECT movil, nombre 
FROM perfil 
WHERE movil IN (600000004, 610000004);

SELECT * 
FROM contacto 
WHERE perfil = 600000004;

SELECT * 
FROM mensaje 
WHERE perfil = 600000004;

SELECT * 
FROM participacion 
WHERE perfil = 600000004;

SELECT * 
FROM chat_grupo 
WHERE administrador = 600000004;

COMMIT;

--------------------------------------------------------------------------------------
-- EJERCICIO 5. Borrar mensajes 
SELECT *
FROM mensaje m
WHERE m.diahora < TO_DATE('10/02/2025', 'DD/MM/YYYY')
        AND m.mensaje_id NOT IN (SELECT msj_anclado 
                                    FROM chat_grupo)
        AND m.msj_original IS NOT NULL
        AND m.chat_grupo IN (SELECT codigo 
                                FROM chat_grupo 
                                WHERE miembros > 3)
        AND m.perfil IN (SELECT perfil 
                            FROM participacion p 
                            GROUP BY perfil 
                            HAVING COUNT(*) < 4);

DELETE FROM mensaje m 
WHERE m.diahora < TO_DATE('10/02/2025', 'DD/MM/YYYY')
        AND m.mensaje_id NOT IN (SELECT msj_anclado 
                                    FROM chat_grupo)
        AND m.msj_original IS NOT NULL
        AND m.chat_grupo IN (SELECT codigo 
                                FROM chat_grupo 
                                WHERE miembros > 3)
        AND m.perfil IN (SELECT perfil 
                            FROM participacion p
                            GROUP BY perfil 
                            HAVING COUNT(*) < 4);

COMMIT;
--------------------------------------------------------------------------------------
-- EJERCICIO 6. Borrar chat de grupo 'C004'
SELECT * 
FROM chat_grupo c
WHERE c.codigo = 'C004';

ALTER TABLE chat_grupo DISABLE CONSTRAINT chat_fk_msj_anclado;

DELETE FROM texto 
WHERE mensaje_id IN (SELECT mensaje_id 
                        FROM mensaje 
                        WHERE chat_grupo = 'C004');
DELETE FROM imagen
WHERE mensaje_id IN (SELECT mensaje_id 
                        FROM mensaje 
                        WHERE chat_grupo = 'C004');
DELETE FROM participacion
WHERE chat_grupo = 'C004';
DELETE FROM mensaje 
WHERE chat_grupo = 'C004';

DELETE FROM chat_grupo 
WHERE codigo = 'C004';

ALTER TABLE chat_grupo ENABLE CONSTRAINT chat_fk_msj_anclado;

COMMIT;

--------------------------------------------------------------------------------------
-- EJERCICIO 7. Crear y manipular vistas
-- Define INTERACCION_ADMIN
DROP VIEW interaccion_admin;

CREATE VIEW interaccion_admin
 AS SELECT p.movil AS mov_admin,
           p.nombre AS nom_admin,
           p.fecha_registro AS f_registro,
           c.nombre AS nom_chat,
           COUNT(m.mensaje_id) AS n_mensajes
    FROM chat_grupo c
        JOIN perfil p ON c.administrador = p.movil
        LEFT JOIN mensaje m ON m.perfil = p.movil AND m.chat_grupo = c.codigo
    GROUP BY p.movil, p.nombre, p.fecha_registro, c.nombre;

--  Muestra (con SELECT *) el contenido completo de la vista
SELECT *
FROM interaccion_admin
ORDER BY nom_admin, nom_chat;

--  Modifica la definición de la vista
CREATE OR REPLACE VIEW interaccion_admin
 AS SELECT p.movil AS mov_admin,
           p.nombre AS nom_admin,
           c.nombre AS nom_chat,
           COUNT(m.mensaje_id) AS n_mensajes,
          (SELECT COUNT(*)
            FROM mensaje mx
            WHERE mx.chat_grupo = c.codigo
            ) AS total_mensajes
    FROM chat_grupo c
        JOIN perfil p ON c.administrador = p.movil
        LEFT JOIN mensaje m ON m.perfil = p.movil AND m.chat_grupo = c.codigo
    GROUP BY p.movil, p.nombre,c.codigo, c.nombre;

SELECT *
FROM interaccion_admin
ORDER BY nom_admin, nom_chat;

-- Inserta dos nuevos mensajes  
INSERT INTO mensaje (mensaje_id, reenviado, diahora, perfil, chat_grupo, msj_original)
    VALUES ('MSJ00701', 'NO', SYSDATE, 600000008, 'C007', NULL);
INSERT INTO texto (mensaje_id, texto)
    VALUES ('MSJ00701', 'Q deberes puso la d mates?');
INSERT INTO mensaje (mensaje_id, reenviado, diahora, perfil, chat_grupo, msj_original)
    VALUES ('MSJ00702', 'NO', SYSDATE, 600000011, 'C007', 'MSJ00701');
INSERT INTO texto (mensaje_id, texto)
    VALUES ('MSJ00702', 'Toda la pag. 36 del libro');

--  Visualiza el contenido de la vista (repite el paso b), y contesta: ¿se aplica el cambio? ¿Por qué? 
SELECT *
FROM interaccion_admin
ORDER BY nom_admin, nom_chat;

--Sí, porque una vista no guarda datos, es decir, solo muestra los datos que hay en las tablas en ese momento, por lo que los cambios aparecen automáticamente.
COMMIT;


--------------------------------------------------------------------------------------
-- EJERCICIO 8.  Restricciones de integridad: Asertos. 
CREATE ASSERTION RI_min_msj
    CHECK(NOT EXISTS(SELECT c.codigo
                     FROM chat_grupo c LEFT JOIN mensaje m ON m.chat_grupo = c.codigo
                     WHERE m.mensaje_id IS NULL)
                     );

SELECT c.codigo
FROM chat_grupo c LEFT JOIN mensaje m ON m.chat_grupo = c.codigo
WHERE m.mensaje_id IS NULL;

CREATE ASSERTION RI_msj_anclado
    CHECK(NOT EXISTS(SELECT c.codigo
                     FROM chat_grupo c JOIN mensaje m ON m.mensaje_id = c.msj_anclado
                     WHERE m.chat_grupo <> c.codigo)
                     );

SELECT c.codigo
FROM chat_grupo c JOIN mensaje m ON m.mensaje_id = c.msj_anclado
WHERE m.chat_grupo <> c.codigo;


-- EJERCICIO 9. Creación y uso de índices. 
SELECT DISTINCT M.mensaje_id 
    FROM mensaje M 
    JOIN chat_grupo G ON M.chat_grupo = G.codigo 
    JOIN participacion A ON A.chat_grupo = G.codigo 
    WHERE M.msj_original IS NOT NULL 
    AND EXISTS (SELECT * 
                FROM PERFIL P 
                WHERE P.movil = A.perfil  
                AND P.movil IN (SELECT perfil 
                                FROM contacto 
                                GROUP BY perfil 
                                HAVING COUNT(*) > 5)); 
-- EL valor de COSTE es: 8

DROP INDEX indice_contacto_perfil;

CREATE INDEX indice_contacto_perfil
    ON contacto(perfil);


-- 1) ¿Cuál es el nuevo valor de COSTE?: El nuevo valor de COSTE es 18
-- 2) ¿Ha mejorado respecto de la ejecución previa a la existencia del índice?:
--  No, el valor de COSTE ha aumentado con respecto al valor anterior.

