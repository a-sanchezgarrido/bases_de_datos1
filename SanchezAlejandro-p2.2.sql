/*
Asignatura: BASES DE DATOS I
Curso: 2025/26
Convocatoria: enero

Practica: P2. Consultas SQL

Cuenta Oracle: bdi118
Estudiante: Alejandro Sánchez Garrido
*/

-- CONSULTAS:
-- Q1
SELECT V.nombre AS nombre_viajero, A.zona AS zona_agencia, Q.fecha_inicio AS fecha_inicio_alquiler
FROM viajero V
    JOIN alquiler Q ON V.codigo = Q.viajero
    JOIN agencia A ON Q.agencia = A.codigo
WHERE Q.cerrado = 'N' AND A.zona IN ('SAN ANDRES', 'GRAN VIA') AND Q.coste_total > 300 AND Q.fecha_inicio < TO_DATE('05/12/2025', 'DD/MM/YYYY')
ORDER BY V.nombre;

-- Q2
SELECT C.matricula AS matricula_coche, 
        COALESCE(TO_CHAR(Q.alquiler_id), '+++') AS alquiler_id,
        COALESCE(TO_CHAR(Q.fecha_fin, 'DD/MM/YYYY'), 'xxx') AS fecha_fin,
        COALESCE(D.coste_coche, 0) AS coste_coche, 
        COALESCE(A.zona, '---') AS zona_agencia
FROM COCHE C 
    LEFT JOIN detalle_alquiler D ON C.matricula = D.coche
    LEFT JOIN alquiler Q ON D.alquiler = Q.alquiler_id
    LEFT JOIN agencia A ON Q.agencia = A.codigo
WHERE C.garaje = 'G4'
ORDER BY Q.alquiler_id;

-- Q3
SELECT V.codigo
FROM viajero V
WHERE V.ciudad = 'MURCIA' INTERSECT (
    SELECT Q.viajero
    FROM alquiler Q
    WHERE EXTRACT(YEAR FROM fecha_inicio) = 2024
    UNION
    SELECT Q.viajero
    FROM alquiler Q, detalle_alquiler D, coche C
    WHERE Q.alquiler_id = D.alquiler AND D.coche = C.matricula AND C.precio_alquiler BETWEEN 50 AND 60
    );

    
                                        
