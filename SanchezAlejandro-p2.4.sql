/*
Asignatura: BASES DE DATOS I
Curso: 2025/26
Convocatoria: enero

Practica: P2. Consultas SQL

Cuenta Oracle: bdi118
Estudiante: Alejandro Sánchez Garrido
*/

-- CONSULTAS:
-- Q7
SELECT G.nombre, G.direccion, COUNT(C.matricula) AS cuantos_coches
FROM garaje G
    JOIN coche C ON G.codigo = C.garaje
GROUP BY G.nombre, G.direccion
HAVING COUNT(C.matricula) = (SELECT MAX(COUNT(*))
                                    FROM coche
                                    GROUP by garaje
                                    )
ORDER BY G.nombre;
-- Q8
SELECT V.nombre, V.telefono, V.direccion
FROM viajero V 
WHERE NOT EXISTS (
            SELECT A.codigo
            FROM agencia A
            WHERE NOT EXISTS(
                SELECT Q.alquiler_id
                FROM alquiler Q
                WHERE Q.viajero = V.codigo AND Q.agencia = A.codigo
            )
        )
;
-- Q9
SELECT A.codigo, A.zona, COUNT(DISTINCT Q.alquiler_id) AS alquileres, 
        COUNT(D.coche) AS alquileres_coches, (SELECT COUNT(DISTINCT V.codigo)
                                                    FROM ALQUILER Q2, VIAJERO V
                                                    WHERE Q2.viajero = V.codigo
                                                    AND Q2.agencia = A.codigo 
                                                    AND V.ciudad = 'BENIEL') AS alq_benielenses
                                                                                                            
FROM agencia A LEFT JOIN alquiler Q ON A.codigo = Q.agencia
                LEFT JOIN detalle_alquiler D ON Q.alquiler_id = D.alquiler
GROUP BY A.codigo, A.zona
ORDER BY A.codigo;

















