/*
Asignatura: BASES DE DATOS I
Curso: 2025/26
Convocatoria: enero

Practica: P2. Consultas SQL

Cuenta Oracle: bdi118
Estudiante: Alejandro Sánchez Garrido

*/

-- CONSULTAS:
-- Q6 <-- Identificador de la consulta 6
SELECT Q.alquiler_id, Q.fecha_fin, Q.viajero, Q.agencia, Q.coste_total
FROM ALQUILER Q
WHERE Q.cerrado = 'S' AND (Q.agencia = 'A1' OR (Q.viajero = 'V14' AND Q.coste_total < 300))
ORDER BY Q.fecha_fin;

-- Q9 <-- Identificador consulta 9
SELECT V.dni, V.nombre, V.fecha_registro, SYSDATE - V.fecha_registro AS V.dias_registrado 
FROM VIAJERO V
WHERE V.fecha_registro > SYSDATE - 243
ORDER BY dias_registrado;

-- Q19
SELECT V.nombre, C.matricula, C.modelo, D.coste_coche
FROM VIAJERO V JOIN ALQUILER Q ON V.codigo = Q.viajero 
                JOIN DETALLE_ALQUILER D ON Q.alquiler_id = D.alquiler
                JOIN COCHE C ON D.coche = C.matricula
WHERE C.marca = 'AUDI'
ORDER BY V.nombre, C.matricula;

-- Q1
SELECT c.marca, c.modelo, c.color, c.precio_alquiler
FROM coche c
WHERE c.precio_alquiler > 70;

-- Q2
SELECT v.codigo, v.nombre, v.direccion
FROM viajero v
WHERE v.direccion LIKE '%RO%'
ORDER BY v.nombre;

-- Q3
SELECT a.fecha_inicio, a.agencia, a.viajero, a.coste_total
FROM alquiler a
WHERE a.coste_total>600 AND a.coste_total<1200
ORDER BY a.agencia, a.viajero;

-- Q4
SELECT DISTINCT q.agencia
FROM alquiler q
WHERE q.cerrado = 'N'
    AND q.fecha_inicio < TO_DATE('01/04/2025','DD/MM/YYYY')
ORDER BY q.agencia DESC;

-- Q5
SELECT v.nombre, v.telefono, TO_CHAR(v.fecha_registro,'MONTH') AS mes_registro
FROM viajero v
WHERE v.nombre LIKE '%ME%'
ORDER BY v.nombre;

-- Q7
SELECT c.matricula, marca ||' '|| modelo AS marca_modelo, c.color, c.garaje
FROM coche c
WHERE c.garaje IN ('G1','G5') 
    AND c.color != 'PLATA'
ORDER BY marca_modelo;

-- Q8
SELECT q.alquiler_id, q.coste_total, (q.coste_total*0.79) AS nuevo_coste
FROM alquiler q
WHERE q.cerrado = 'S' 
    AND q.coste_total > 500 
ORDER BY q.alquiler_id;

-- Q10
SELECT d.alquiler, d.litros_inicio, d.coste_coche
FROM detalle_alquiler d
WHERE d.coche = '1234XPQ' 
    AND d.coste_coche < 300 
ORDER BY d.alquiler;

-- Q11
SELECT v.codigo, v.nombre, q.alquiler_id, q.coste_total
FROM viajero v JOIN alquiler q 
                ON q.viajero = v.codigo
ORDER BY v.codigo;

-- Q 12
SELECT q.alquiler_id, q.coste_total, d.coche, d.coste_coche
FROM alquiler q JOIN detalle_alquiler d ON d.alquiler = q.alquiler_id
WHERE q.cerrado = 'S'
    AND q.coste_total > 500;

-- Q13
SELECT q.alquiler_id, q.fecha_inicio, q.coste_total, q.cerrado
FROM alquiler q
WHERE q.viajero IN (SELECT v.codigo
                    FROM viajero v 
                    WHERE v.ciudad = 'MURCIA'
                    ) AND q.coste_total > 250 AND q.coste_total < 700;

-- Q14
SELECT a.codigo AS codigo_agencia, a.zona, q.alquiler_id, q.cerrado, (q.fecha_fin - q.fecha_inicio) AS dias_alquiler
FROM alquiler q JOIN agencia a 
                ON a.codigo = q.agencia
                JOIN detalle_alquiler d 
                ON q.alquiler_id = d.alquiler
WHERE (q.fecha_fin - q.fecha_inicio) > 7
ORDER BY d.coche; -- Salen repetidas pero no me deja poner DISTINCT

-- Q15
SELECT DISTINCT a.zona AS zona_agencia, v.nombre AS nombre_viajero
FROM viajero v JOIN alquiler q 
                ON q.viajero = v.codigo
                JOIN agencia a ON a.codigo = q.agencia
ORDER BY a.zona, v.nombre;

-- Q16
SELECT q.alquiler_id, q.viajero, q.fecha_fin, d.coche
FROM alquiler q JOIN detalle_alquiler d 
                ON d.alquiler = q.alquiler_id
                JOIN agencia a 
                ON q.agencia = a.codigo
WHERE a.zona = 'GRAN VIA' 
    AND q.cerrado = 'N'
ORDER BY d.alquiler;

-- Q17
SELECT v.nombre AS nombre_viajero, q.fecha_inicio, d.coche
FROM viajero v JOIN alquiler q
                ON q.viajero = v.codigo
                JOIN detalle_alquiler d
                ON d.alquiler = q.alquiler_id
WHERE v.ciudad = 'MURCIA'
ORDER BY v.nombre;

-- Q18
SELECT d.alquiler AS alquiler_id, c.matricula, g.nombre AS nombre_garaje
FROM detalle_alquiler d JOIN coche c ON c.matricula = d.coche
                        JOIN garaje g ON c.garaje = g.codigo
WHERE g.nombre IN ('VISTALEGRE', 'LA FLOTA') 
ORDER BY g.nombre, d.alquiler;

-- Q20
SELECT v.ciudad AS ciudad_viajero, TO_CHAR(q.fecha_inicio, 'MONTH') AS mes_alquiler, 
        a.zona AS zona_agencia, c.marca AS marca_coche, g.direccion AS direccion_garaje
FROM detalle_alquiler d JOIN alquiler q ON q.alquiler_id = d.alquiler
                        JOIN viajero v ON v.codigo = q.viajero
                        JOIN agencia a ON a.codigo = q.agencia
                        JOIN coche c ON c.matricula = d.coche
                        JOIN garaje g ON g.codigo = c.garaje
WHERE v.ciudad IN ('BENIEL', 'SANTOMERA')
ORDER BY v.ciudad, TO_CHAR(q.fecha_inicio, 'MONTH'), a.zona; 
-- SI PIDEN ORDENAR POR MES ESTARÍA MEJOR PONER 'MM' EN LUGAR DE 'MONTH'

-- Q21
SELECT g.codigo AS codigo_garaje, g.direccion AS direccion_garaje, 
        COALESCE(c.matricula, 'VACIO') AS matricula_coche, 
        COALESCE(TO_CHAR(c.precio_alquiler), '---') AS precio_coche
FROM coche c RIGHT JOIN garaje g 
            ON g.codigo = c.garaje
ORDER BY g.codigo;

-- Q22
SELECT v.codigo AS codigo_viajero, v.nombre, COALESCE(q.alquiler_id, '***') AS alquiler_id, 
        COALESCE(q.cerrado, '-') AS cerrado, q.fecha_fin AS fin_alquiler, 
        COALESCE(q.coste_total, 0) AS coste_alquiler
FROM alquiler q RIGHT JOIN viajero v 
                ON v.codigo = q.viajero
WHERE v.ciudad = 'YECLA'
ORDER BY v.nombre;

-- Q23 -- En teoria hecho por la profesora pero no lo sube asi que hecho por la IA
SELECT C.matricula AS matricula_coche,
    COALESCE(TO_CHAR(Q.alquiler_id), '***') AS alquiler_id,
    COALESCE(TO_CHAR(Q.fecha_inicio, 'MONTH YYYY'), '---') AS fecha_inicio,
    COALESCE(D.litros_inicio, 0) AS litros_inicio
FROM COCHE C 
    LEFT JOIN DETALLE_ALQUILER D ON C.matricula = D.coche
    LEFT JOIN ALQUILER Q ON D.alquiler = Q.alquiler_id
WHERE C.garaje = 'G3'
ORDER BY C.matricula;

-- Q24 SIN LA RESTRICCION DE OPERADORES DE CONJUNTOS
SELECT c.matricula
FROM coche c
WHERE c.garaje = 'G4' 
    AND c.matricula NOT IN (SELECT d.coche
                FROM detalle_alquiler d
                );  
                
-- Q24 CON OPERADORES DE CONJUNTOS
(SELECT c.matricula
FROM coche c
WHERE c.garaje = 'G4')
MINUS
(SELECT d.coche
FROM detalle_alquiler d);

-- Q25 -- En teoría hecho por la profesora pero lo haré yo
(SELECT q.agencia
FROM alquiler q
WHERE q.coste_total < 100) -- Si queremos que salgan los mismos resultados es > 1200
UNION
(SELECT q.agencia
FROM alquiler q JOIN viajero v
                ON q.viajero = v.codigo
WHERE TO_CHAR(v.fecha_registro, 'MM/YYYY') = '08/2025');

-- Q26
(SELECT d.coche
FROM detalle_alquiler d JOIN alquiler q 
                        ON q.alquiler_id = d.alquiler
                        JOIN viajero v 
                        ON v.codigo = q.viajero
WHERE v.ciudad = 'MURCIA')
MINUS
(SELECT d.coche
FROM detalle_alquiler d JOIN alquiler q 
                        ON q.alquiler_id = d.alquiler
                        JOIN viajero v 
                        ON v.codigo = q.viajero
WHERE v.ciudad = 'SANTOMERA')
ORDER BY 1; -- Ordena por la primera fila del resultado

-- Q27
(SELECT c.matricula
FROM coche c JOIN garaje g 
            ON g.codigo = c.garaje
WHERE g.nombre LIKE 'VISTA%')
INTERSECT 
(SELECT d.coche
FROM detalle_alquiler d JOIN alquiler q 
                        ON q.alquiler_id = d.alquiler
WHERE (q.fecha_fin - q.fecha_inicio) > 6);

-- Q28
(SELECT c.matricula
FROM coche c
WHERE c.garaje IN ('G1','G3'))
MINUS
(SELECT d.coche
FROM detalle_alquiler d JOIN alquiler q ON q.alquiler_id = d.alquiler
WHERE (q.fecha_fin - q.fecha_inicio) > 3);

-- Q29
SELECT q.alquiler_id
FROM alquiler q
WHERE q.cerrado = 'S' AND q.agencia = 'A1'
MINUS
SELECT d.alquiler
FROM detalle_alquiler d
WHERE d.coste_coche <= 400;

-- Q30 -- No ha subido el codigo la profesora
SELECT v.codigo
FROM viajero v 
WHERE (SYSDATE - v.fecha_registro) > 365
INTERSECT 
(   
    SELECT q.viajero
    FROM alquiler q
    MINUS
    SELECT q.viajero
    FROM alquiler q
    WHERE (q.coste_total >= 500)
);











