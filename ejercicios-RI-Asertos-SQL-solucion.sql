----------------------------------------------------------
--   RESTRICCIONES DE INTEGRIDAD         ------
----------------------------------------------------------

-- SOLUCIONES
-- RI1. Todo cliente ha de tener un banquero personal
-- 1) Poner en negativo
-- NO EXISTE UN CLIENTE QUE NO TENGA BANQUERO PERSONAL

-- 2) Redactar el aserto
CREATE ASSERTION RI1
CHECK (NOT EXISTS (SELECT * 
                   FROM CLIENTE
                   WHERE codcli NOT IN (SELECT cliente
                                        FROM BANQUERO_PERSONAL)));

-- 3) Ejecutar la SELECT. Debe devolver una tabla vacia
SELECT * 
FROM CLIENTE
WHERE codcli NOT IN (SELECT cliente
                     FROM BANQUERO_PERSONAL);



-- RI2. Toda sucursal debe haber abierto al menos una cuenta

-- 1) Poner en negativo
-- NO EXISTE UNA SUCURSAL PARA LA QUE NO EXISTA UNA CUENTA

-- 2) Redactar el aserto
CREATE ASSERTION RI2
CHECK (NOT EXISTS (SELECT * 
                   FROM SUCURSAL
                   WHERE codsuc NOT IN (SELECT sucursal
                                        FROM CUENTA)));

-- 3) Ejecutar la SELECT. Debe devolver una tabla vacia
SELECT * 
FROM SUCURSAL
WHERE codsuc NOT IN (SELECT sucursal
                     FROM CUENTA)

-- RI3. Todos los clientes del banquero PALAO tienen que tener alguna cuenta
-- 1) Poner en negativo
-- NO EXISTE UN CLIENTE DEL BANQUERO PALAO QUE NO TENGA UNA CUENTA
-- 2) Redactar el aserto
CREATE ASSERTION RI3
CHECK (NOT EXISTS (SELECT cliente 
                   FROM BANQUERO_PERSONAL
                   WHERE nombanquero LIKE '%PALAO%'
                     AND cliente NOT IN (SELECT cliente
                                         FROM CUENTA)));

-- 3) Ejecutar la SELECT. Debe devolver una tabla vacia
-- Pero detecta un cliente!!
SELECT cliente 
FROM BANQUERO_PERSONAL
WHERE nombanquero LIKE '%IBANEZ%'
 AND cliente NOT IN (SELECT cliente
                     FROM CUENTA);

             
             
             
-- 4) EXTRA
-- RI4. "Todas las cuentas con saldo negativo (rojos) deben tener asignado un banquero personal."
-- Frase en negativo:
-- No hay ninguna cuenta con saldo negativo sin un banquero personal

CREATE ASSERTION RI4
CHECK (NOT EXISTS (SELECT *
                    FROM cuenta c
                    WHERE c.saldo < 0
                        AND c.cliente NOT IN (
                                SELECT cliente
                                FROM banquero_personal));
                                
-- SELECT:
SELECT *
FROM cuenta c
WHERE c.saldo < 0
    AND c.cliente_cod NOT IN (
            SELECT cliente_cod
            FROM banquero_personal);       




























                     