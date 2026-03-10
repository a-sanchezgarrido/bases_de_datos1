-- 1. Actualizar la calle y ciudad del cliente 'MALDONADO,D', pues se ha 
-- mudado a la calle 'LEPANTO' de YECLA.

UPDATE CLIENTE
SET calle = 'LEPANTO', ciudad = 'YECLA'
WHERE nombre = 'MALDONADO,D';

-- 2. Modificar el activo de la sucursal SUR, para disminuirlo en 1650 euros.
UPDATE SUCURSAL
   SET activo = activo - 1650
WHERE nombre = 'SUR';

-- 3. Modificar la cantidad de cada prestamo concedido al cliente 
-- 'ESPALLARDO,E' para aumentarlo un 20%.
UPDATE PRESTAMO
   SET cantidad = cantidad * 1.2
WHERE cliente_cod IN (SELECT codigo
                      FROM CLIENTE
                      WHERE nombre = 'ESPALLARDO,E');
                  
-- 4.	Anadir una columna a la tabla CLIENTE, llamada "cuantas_cuentas" 
-- que almacenara valores numericos de dos digitos; su valor por defecto ha de 
-- ser 0; no admite nulos.
ALTER TABLE CLIENTE ADD
   cuantas_cuentas NUMBER(2) DEFAULT 0 NOT NULL;   
   
-- 5.	Actualizar la columna "cuantas_cuentas" de CLIENTE con el numero de
-- cuentas que tiene cada uno de los clientes de la base de datos.

UPDATE CLIENTE C
   SET cuantas_cuentas = (SELECT COUNT(*) 
                          FROM CUENTA
                          WHERE cliente_cod = C.codigo);
                          
-- 6.	Anadir una columna a la tabla SUCURSAL, llamada "media_prestamo" que 
-- almacenara valores numericos de 9 digitos con 2 decimales.

ALTER TABLE SUCURSAL ADD
   media_prestamo NUMBER(9,2) NULL;   

-- 7. Actualizar la columna "media_prestamo" para todas las sucursales, de forma
-- que para cada sucursal que haya concedido 2 o mas prestamos, almacene la 
-- cantidad media prestada por parte de dicha sucursal a los clientes.

UPDATE SUCURSAL S
SET media_prestamo = (SELECT AVG(cantidad)
                      FROM PRESTAMO
                      WHERE sucursal_cod = S.codigo)
WHERE codigo IN (SELECT sucursal_cod
                 FROM PRESTAMO
                 GROUP BY sucursal_cod
                 HAVING COUNT(*) >= 2);
                 
-- 8. Insertar filas en las tablas

INSERT INTO CLIENTE (codigo, nombre, calle, ciudad)
VALUES ('C10', 'VALIENTE,T', 'VENUS', 'ALICANTE');
INSERT INTO BANQUERO_PERSONAL(cliente_cod, nombre)
VALUES ('C10', 'IBANEZ,J');
INSERT INTO CUENTA (cuenta_id, sucursal_cod, cliente_cod, saldo)
VALUES ('Q10', 'S02', 'C10', 3650);
INSERT INTO CUENTA (cuenta_id, sucursal_cod, cliente_cod, saldo)
VALUES ('Q11', 'S03', 'C10', 1500);
INSERT INTO PRESTAMO(prestamo_id, sucursal_cod, cliente_cod, cantidad)
VALUES ('P09', 'S01', 'C10', 600);

-- 9.	Eliminar los prestamos cuya cantidad sea inferior a 900 euros.

DELETE FROM PRESTAMO
WHERE cantidad < 900;

-- 10.	Eliminar las cuentas pertenecientes al cliente 'VALIENTE,T' con un 
-- saldo inferior a 2000 euros. 

DELETE FROM CUENTA
WHERE cliente_cod IN (SELECT codigo
                      FROM CLIENTE
                      WHERE nombre = 'VALIENTE,T')
  AND saldo < 2000;

-- 11.	Eliminar los clientes de Yecla que no tienen ni prestamos ni cuentas.
-- Si surgen problemas de integridad referencial, elimine tambien las filas de
-- otras tablas afectadas.

-- Ver las que se van a borrar
SELECT * FROM CLIENTE 
WHERE ciudad = 'YECLA'
  AND codigo NOT IN (SELECT cliente_cod 
                     FROM CUENTA)
  AND codigo NOT IN (SELECT cliente_cod
                     FROM PRESTAMO);
-- Borrado
DELETE FROM CLIENTE 
WHERE ciudad = 'YECLA'
  AND codigo NOT IN (SELECT cliente_cod 
                     FROM CUENTA)
  AND codigo NOT IN (SELECT cliente_cod
                     FROM PRESTAMO);

-- da error. ¿Sabrias explicar por que?

-- Antes hay que ejecutar esta:
DELETE FROM BANQUERO_PERSONAL
WHERE cliente_cod = (SELECT codigo
                     FROM CLIENTE 
                     WHERE ciudad = 'YECLA'
                       AND codigo NOT IN (SELECT cliente_cod 
                                          FROM CUENTA)
                       AND codigo NOT IN (SELECT cliente_cod 
                                          FROM PRESTAMO));
-- Y ahora se puede ejecutar el primer DELETE                 
                 