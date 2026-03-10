-- 1. Activo y ciudad de las sucursales del banco.
SELECT activo, ciudad
FROM SUCURSAL;

-- 2. Nombre y calle de los clientes de 'YECLA', ordenado por nombre.
SELECT nombre, calle
FROM CLIENTE
WHERE ciudad = 'YECLA'
ORDER BY nombre;

-- 3. Para cada prestamo de mas de 1000€, mostrar el codigo del prestamo, 
-- el nombre de la sucursal, el codigo del cliente y la cantidad prestada.
SELECT prestamo_id, nombre, cliente_cod, cantidad
FROM PRESTAMO JOIN SUCURSAL 
              ON sucursal_cod=codigo 
WHERE cantidad > 1000;

-- 4. Para cada cuenta de cliente, mostrar el nombre del cliente y el saldo
-- de la cuenta, ordenado por cliente (ascendente) y por saldo (descendente).
SELECT nombre, saldo
FROM CLIENTE JOIN CUENTA
             ON codigo = cliente_cod
ORDER BY nombre, saldo DESC;

-- Ampliacion: mostrar tambien el nombre de la sucursal de la cuenta
-- (implica  varios join, usar pseudonimos y calificar)
SELECT C.nombre nombre_cliente, Q.saldo, S.nombre nombre_sucursal
FROM CLIENTE C JOIN CUENTA Q
               ON C.codigo = Q.cliente_cod
     JOIN SUCURSAL ON Q.sucursal_cod = S.codigo
ORDER BY nombre, saldo DESC;

-- 5. Saldo de las cuentas del cliente 'ARRUBAL,A'.
SELECT saldo
FROM CUENTA
WHERE cliente_cod IN (SELECT codigo 
                      FROM CLIENTE
                      WHERE nombre = 'ARRUBAL,A');
                      
SELECT saldo
FROM CUENTA JOIN CLIENTE
            ON cliente_cod = codigo
WHERE nombre = 'ARRUBAL,A';

-- 6. Nombre y ciudad de los clientes con cuentas en la sucursal 'S02'.
SELECT nombre, ciudad
FROM CLIENTE JOIN CUENTA
             ON codigo = cliente_cod
WHERE sucursal_cod = 'S02';

SELECT nombre, ciudad
FROM CLIENTE  
WHERE codigo IN (SELECT cliente_cod
                 FROM CUENTA
                 WHERE sucursal_cod = 'S02');

-- 7. Nombre y calle de los clientes de 'MURCIA' que tienen prestamos.
SELECT nombre, calle
FROM CLIENTE
WHERE ciudad = 'MURCIA'
  AND codigo IN (SELECT cliente_cod 
                 FROM PRESTAMO);
SELECT nombre, calle
FROM CLIENTE C
WHERE ciudad = 'MURCIA'
  AND EXISTS (SELECT * 
              FROM PRESTAMO 
              WHERE cliente_cod = C.codigo);
 
SELECT nombre, calle
FROM CLIENTE JOIN PRESTAMO 
               ON codigo = cliente_cod
WHERE ciudad = 'MURCIA';

-- 8. Nombre y calle de los clientes de YECLA que no tienen prestamos.
SELECT nombre, calle
FROM CLIENTE
WHERE ciudad = 'YECLA'
  AND codigo NOT IN (SELECT cliente_cod 
                     FROM PRESTAMO);

-- Correlacion y NOT EXISTS
SELECT nombre, calle
FROM CLIENTE C
WHERE ciudad = 'YECLA'
AND NOT EXISTS (SELECT * 
                FROM PRESTAMO 
                WHERE cliente_cod = C.codigo);                   
-- GRAVE ERROR:          
SELECT nombre, calle
FROM CLIENTE, PRESTAMO
WHERE ciudad = 'YECLA'
AND codigo <> cliente_cod; -- anti-join. ERROR!!     

-- 9. Codigo de los clientes que tienen cuentas pero no prestamos.
 (SELECT cliente_cod 
 FROM CUENTA)
MINUS
(SELECT cliente_cod 
 FROM PRESTAMO); 

-- no hace falta el acceso a CLIENTE, pero es correcta:       
(SELECT codigo
 FROM CLIENTE)
INTERSECT
(SELECT cliente_cod 
 FROM CUENTA)
MINUS
(SELECT cliente_cod 
 FROM PRESTAMO);  
 
-- Anidamiento (MEJOR)

SELECT cliente_cod
FROM CUENTA   
WHERE cliente_cod NOT IN (SELECT cliente_cod
                          FROM PRESTAMO);     

-- no hace falta el acceso a CLIENTE, pero es correcta:   					  
SELECT codigo
FROM CLIENTE
WHERE codigo IN (SELECT cliente_cod
                 FROM CUENTA)   
  AND codigo NOT IN (SELECT cliente_cod
                     FROM PRESTAMO);
  
-- CORRELACION  
SELECT cliente_cod
FROM CUENTA Q
WHERE NOT EXISTS (SELECT * 
                  FROM PRESTAMO
                  WHERE cliente_cod = Q.cliente_cod);
  
 -- 10. Nombres de todos los clientes de la sucursal 'S01', es decir, 
 -- los que tienen cuenta y/o prestamo ahi.

-- Sin anidamiento
  SELECT nombre
  FROM CLIENTE JOIN CUENTA
               ON codigo = cliente_cod
  WHERE sucursal_cod='S01'
 UNION 
  SELECT nombre
  FROM PRESTAMO JOIN CUENTA
                ON codigo = cliente_cod
  WHERE sucursal_cod='S01';

-- Con anidamiento y conjuntos
SELECT nombre
FROM CLIENTE
WHERE codigo IN ((SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S01')
                  UNION 
                 (SELECT cliente_cod
                  FROM PRESTAMO
                  WHERE sucursal_cod='S01')); 

-- Solo anidamiento                  
SELECT nombre
 FROM CLIENTE
 WHERE codigo IN (SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S01')
    OR codigo IN (SELECT cliente_cod
                  FROM PRESTAMO
                  WHERE sucursal_cod='S01');


-- 11. Nombres de clientes con cuentas en la sucursal 'S04' pero sin prestamos alli. 
SELECT nombre
 FROM CLIENTE
 WHERE codigo IN (SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S04')
   AND codigo NOT IN (SELECT cliente_cod
                      FROM PRESTAMO
                      WHERE sucursal_cod='S04');
SELECT nombre
FROM CLIENTE
WHERE codigo IN ((SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S04')
                  MINUS 
                 (SELECT cliente_cod
                  FROM PRESTAMO
                  WHERE sucursal_cod='S04'));
                  
-- 12. Nombres de los clientes con algun prestamo y alguna cuenta en la sucursal 'S02'. 
SELECT nombre
FROM CLIENTE
WHERE codigo IN (SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S02')
  AND codigo IN (SELECT cliente_cod
                  FROM PRESTAMO
                  WHERE sucursal_cod='S02');
SELECT nombre
FROM CLIENTE
WHERE codigo IN ((SELECT cliente_cod
                  FROM CUENTA
                  WHERE sucursal_cod='S02')
                  INTERSECT 
                 (SELECT cliente_cod
                  FROM PRESTAMO
                  WHERE sucursal_cod='S02'));
                  
-- 13. Nombres de los clientes que no tienen prestamos ni cuentas.
SELECT nombre
FROM CLIENTE
WHERE codigo NOT IN (SELECT cliente_cod
                     FROM CUENTA)                  
  AND codigo NOT IN (SELECT cliente_cod
                     FROM PRESTAMO);
SELECT nombre
FROM CLIENTE
WHERE codigo NOT IN ((SELECT cliente_cod
                      FROM CUENTA)
                     UNION 
                     (SELECT cliente_cod
                      FROM PRESTAMO));

-- 14. Nombres de los clientes del banquero PALAO,R y ciudades en las que viven, ordenado por ciudad y por nombre de cliente.
SELECT nombre, ciudad 
FROM CLIENTE
WHERE codigo IN (SELECT cliente_cod 
                 FROM BANQUERO_PERSONAL 
                 WHERE nombre = 'PALAO,R')
ORDER BY ciudad, nombre;

SELECT c.nombre, ciudad 
FROM CLIENTE c JOIN BANQUERO_PERSONAL b
               ON codigo = cliente_cod 
WHERE b.nombre = 'PALAO,R'
ORDER BY ciudad, c.nombre;

SELECT c.nombre, ciudad 
FROM CLIENTE c,BANQUERO_PERSONAL b
WHERE codigo = cliente_cod 
  AND b.nombre = 'PALAO,R'
ORDER BY ciudad, c.nombre;

-- 15. Nombres de  clientes que viven en la misma calle y ciudad 
-- que el cliente llamado 'MALDONADO,D.' Ordenados alfabeticamente

SELECT C.nombre 
FROM CLIENTE C JOIN CLIENTE M    --join evitable
               ON C.calle = M.calle 
                  AND C.ciudad = M.ciudad
WHERE M.nombre = 'MALDONADO,D';

SELECT C.nombre 
FROM CLIENTE C, CLIENTE M    --join evitable
WHERE M.nombre = 'MALDONADO,D' 
AND C.calle = M.calle AND C.ciudad = M.ciudad;

-- MUCHO MEJOR:
SELECT nombre
FROM CLIENTE
WHERE (calle, ciudad) IN (SELECT calle, ciudad
                          FROM CLIENTE
                          WHERE nombre = 'MALDONADO,D')
ORDER BY nombre;

-- 16. Activo y nombre de todas las sucursales con cuentas de clientes 
-- que vivan en MURCIA. Resultado ordenado por activo, en orden descendente.

SELECT DISTINCT S.activo, S.nombre
FROM SUCURSAL S JOIN CUENTA Q
                ON S.codigo = Q.sucursal_cod
     JOIN CLIENTE C ON Q.cliente_cod = C.codigo
 WHERE C.ciudad = 'MURCIA'
ORDER BY S.activo DESC;

SELECT DISTINCT S.activo, S.nombre
FROM SUCURSAL S, CUENTA Q, CLIENTE C
WHERE S.codigo = Q.sucursal_cod
  AND Q.cliente_cod = C.codigo
  AND C.ciudad = 'MURCIA'
ORDER BY S.activo DESC;

-- La mejor:
SELECT activo, nombre
FROM SUCURSAL
WHERE codigo IN
          ( SELECT sucursal_cod
            FROM CUENTA
            WHERE cliente_cod IN
                        ( SELECT codigo
                          FROM CLIENTE
                          WHERE ciudad = 'MURCIA' ) )
ORDER BY activo DESC;

-- 17. Nombre de clientes con cuentas en alguna sucursal situada en 'ALICANTE'.
SELECT nombre
FROM CLIENTE
WHERE codigo IN (SELECT cliente_cod
                 FROM CUENTA
                 WHERE sucursal_cod IN (SELECT codigo
                                        FROM SUCURSAL
                                        WHERE ciudad = 'ALICANTE'));
                                    
SELECT C.nombre
FROM CLIENTE C, CUENTA, SUCURSAL S
WHERE C.codigo = cliente_cod
AND sucursal_cod = S.codigo
AND S.ciudad = 'ALICANTE';

SELECT C.nombre
FROM CLIENTE C JOIN CUENTA
            ON C.codigo = cliente_cod
     JOIN SUCURSAL S ON sucursal_cod = S.codigo
WHERE S.ciudad = 'ALICANTE';

-- 18.Mostrar cuantas sucursales hay en la base de datos. Columna: (cuantas_sucursales).
SELECT COUNT(*) cuantas_sucursales
FROM SUCURSAL;

-- 19. Obtener la media del saldo de las cuentas. Columna: (saldo_medio).
SELECT AVG(saldo) saldo_medio
FROM CUENTA;

-- 20. Mostrar la cantidad mxima que se ha prestado a algun cliente. Columna: (prestamo_maximo).
SELECT MAX(cantidad) prestamo_maximo
FROM PRESTAMO;

-- 21. Indicar de cuantas ciudades distintas hay clientes almacenados en la base de datos. Columna: (ciudades_distintas).
SELECT COUNT(DISTINCT ciudad) ciudades_distintas
FROM CLIENTE;

-- 22. Obtener cuantos prestamos tiene el cliente 'C07'.
SELECT COUNT(*)
FROM PRESTAMO
WHERE cliente_cod = 'C07';

-- 23. Mostrar cuantas cuentas tiene el cliente llamado ARRUBAL,A.
SELECT COUNT(*)
FROM CUENTA
WHERE cliente_cod IN (SELECT codigo
                  FROM CLIENTE
                  WHERE nombre = 'ARRUBAL,A');
SELECT COUNT(*)
FROM CUENTA, CLIENTE
WHERE cliente_cod = codigo
AND nombre = 'ARRUBAL,A';

-- 24. Obtener cuantos clientes hay de cada ciudad. Columnas: (ciudad, cuantos_clientes).
SELECT ciudad, COUNT(*) cuantos_clientes
FROM CLIENTE
GROUP BY ciudad;

-- 25. Mostrar cuantas cuentas tiene cada cliente. Columnas: (cliente, cuantas_cuentas).
SELECT cliente_cod, COUNT(*) cuantas_cuentas
FROM CUENTA
GROUP BY cliente_cod
ORDER BY cliente_cod;

-- 26. Cuanto suman las cantidades concedidas en prestamo a clientes, siempre que la cantidad prestada es superior a 1.100.
SELECT SUM(cantidad)
FROM PRESTAMO
WHERE cantidad > 1100;

-- 27. Para cada cliente que tenga 2 o ms cuentas, indicar el Codigo del cliente, cuntas cuentas posee y cunto suman 
-- los saldos de dichas cuentas. Columnas: (cliente, cuantas_cuentas, suma_saldos).

SELECT cliente_cod, COUNT(*) cuantas_cuentas, SUM(saldo) suma_saldos
FROM CUENTA
GROUP BY cliente_cod
HAVING COUNT(*) >= 2;

-- 28.	Para cada sucursal con ms de 3 prestamos, indicar el nombre de sucursal y su ciudad.
SELECT nombre, ciudad
FROM SUCURSAL
WHERE codigo IN (SELECT sucursal_cod
                 FROM PRESTAMO
                 GROUP BY sucursal_cod
                 HAVING COUNT(*) > 3);
                 
SELECT nombre, ciudad
FROM SUCURSAL
WHERE 3 < (SELECT COUNT(*)
           FROM PRESTAMO
           WHERE sucursal_cod = codigo);
		   
--29.Nombre y ciudad de los clientes que tienen algun prestamo en una sucursal
-- ubicada en la misma ciudad en la que vive el cliente.
SELECT nombre, ciudad 
FROM CLIENTE C
WHERE codigo IN (SELECT cliente_cod 
                 FROM PRESTAMO
                 WHERE sucursal_cod IN (SELECT nombre 
                                    FROM SUCURSAL
                                    WHERE ciudad = C.ciudad ));
SELECT C.nombre, C.ciudad 
FROM CLIENTE C, PRESTAMO, SUCURSAL S
WHERE C.codigo = cliente_cod
  AND sucursal_cod = S.codigo
  AND C.ciudad = S.ciudad;
		   
-- 30. Mostrar para todos los clientes, el Codigo de cada uno de sus prestamos
-- y la cantidad prestada, ordenado por Codigo de cliente. Deben aparecer todos
-- los clientes, y para los clientes sin prestamo, la columna prestamo_id 
-- debe mostrar 3 guiones: '---', y cantidad debe mostrar un cero.
-- Columnas: (codigo, prestamo_id, cantidad)

SELECT codigo, COALESCE(prestamo_id, '---') prestamo_id,
       COALESCE(cantidad, 0) cantidad
FROM CLIENTE LEFT JOIN PRESTAMO
             ON codigo = cliente_cod
ORDER BY codigo;


-- #EXTRA# ONLINE VIEW (no en el enunciado) 
-- Mostrar el nombre del cliente que tiene mas cuentas, incluyendo cuantas son.
-- Columnas: (codigo, nombre, numero_cuentas)

-- 1) Sacamos que cliente tiene mas cuentas: aquel tal que si cuento 
-- cuantas cuentas tiene, ese valor coincide con el maximo numero
-- de cuentas considerando todos los clientes		   
SELECT cliente_cod
FROM CUENTA
GROUP BY cliente_cod
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM CUENTA
                   GROUP BY cliente_cod);

-- 2) Es posible sacar tambien cuantas son		   
SELECT cliente_cod, COUNT(*) cuantas_cuentas
FROM CUENTA
GROUP BY cliente_cod
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM CUENTA
                   GROUP BY cliente_cod);

-- 3) Tenemos el codigo del cliente, pero nos piden el nombre
-- por lo que hay que sacarlo de la tabla CLIENTE
-- y al mismo tiempo, tenemos que sacar "cuantas_cuentas"
-- solo es posible si la select anterior esta en el FROM:

-- Codigo final
SELECT C.codigo, nombre, cuantas_cuentas
FROM CLIENTE C JOIN (SELECT cliente_cod, COUNT(*) cuantas_cuentas
                   FROM CUENTA
                   GROUP BY cliente_cod
                   HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                      FROM CUENTA
                                      GROUP BY cliente_cod))
  ON C.codigo = cliente_cod;


-- DIVISION
-- 31.Nombres de los clientes con cuenta en todas las sucursales que estan en MURCIA.
-- En negativo:
-- Clientes para los que no exista ninguna sucursal en murcia en la que no tenga cuenta.
    SELECT nombre 
    FROM CLIENTE C
    WHERE NOT EXISTS (SELECT * 
                      FROM SUCURSAL S
                      WHERE ciudad = 'MURCIA'
                        AND NOT EXISTS (SELECT *
                                        FROM CUENTA
                                        WHERE sucursal_cod = S.codigo
                                          AND cliente_cod = C.codigo));

