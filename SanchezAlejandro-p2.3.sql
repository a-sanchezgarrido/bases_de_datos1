/*
Asignatura: BASES DE DATOS I
Curso: 2025/26
Convocatoria: enero

Practica: P2. Consultas SQL

Cuenta Oracle: bdi118
Estudiante: Alejandro Sánchez Garrido
*/


-- CONSULTAS:
-- Q4
SELECT DISTINCT G.nombre AS nombre_garaje, G.direccion
FROM garaje G, coche C
WHERE G.codigo = C.garaje AND C.matricula NOT IN (
    SELECT D.coche 
    FROM detalle_alquiler D
    WHERE D.alquiler IN (
        SELECT Q.alquiler_id
        FROM alquiler Q
        WHERE Q.viajero IN (
            SELECT V.codigo
            FROM viajero V
            WHERE V.ciudad = 'MURCIA'
        )
    )
)
ORDER BY nombre_garaje;

 
-- Q5

SELECT Q.viajero, COUNT(Q.alquiler_id) AS cuantos_alquileres
FROM alquiler Q 
WHERE Q.agencia IN (
    SELECT A.codigo
    FROM agencia A
        JOIN alquiler Q ON A.codigo = Q.agencia
    GROUP BY A.codigo
    HAVING COUNT(Q.alquiler_id) > 7
    ) 
    AND Q.alquiler_id IN (
        SELECT D.alquiler
        FROM detalle_alquiler D 
        GROUP BY D.alquiler
        HAVING AVG(D.coste_coche) < 300
    )
GROUP BY Q.viajero
ORDER BY Q.viajero;

-- Q6
SELECT C.matricula, C.marca, C.color, C.precio_alquiler, C.garaje
FROM coche C
    JOIN (
        SELECT D.coche
        FROM DETALLE_ALQUILER D
            JOIN ALQUILER Q ON D.alquiler = Q.alquiler_id
        GROUP BY D.coche
        HAVING COUNT(DISTINCT Q.viajero) = 4
    )coche4 ON C.matricula = coche4.coche 
WHERE C.garaje IN (
        SELECT C.garaje
        FROM coche C
        GROUP BY C.garaje
        HAVING COUNT(C.matricula) > 3 
    )
ORDER BY C.matricula;

    
                                        