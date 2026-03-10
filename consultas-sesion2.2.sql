-- Consultas post sesión 2.2

-- Q1
SELECT c.matricula, c.marca, c.modelo 
FROM coche c
WHERE NOT EXISTS (
            SELECT 1
            FROM detalle_alquiler d
            WHERE d.coche = c.matricula);
            
-- Q2
SELECT v.nombre
FROM detalle_alquiler d JOIN coche c 
                        ON c.matricula = d.coche
                        JOIN alquiler q 
                        ON q.alquiler_id = d.alquiler
                        JOIN viajero v 
                        ON v.codigo = q.viajero
WHERE c.marca = 'FORD';

-- Q3
SELECT q.alquiler_id, q.fecha_inicio, q.coste_total
FROM alquiler q
WHERE q.coste_total > 450 
    AND q.viajero IN (SELECT v.codigo
                        FROM viajero v
                        WHERE v.ciudad = 'SANTOMERA');

-- Q4
SELECT DISTINCT v.nombre
FROM garaje g JOIN coche c ON c.garaje = g.codigo
                JOIN detalle_alquiler d ON d.coche = c.matricula
                JOIN alquiler q ON q.alquiler_id = d.alquiler
                JOIN viajero v ON v.codigo = q.viajero
WHERE g.nombre = 'EL CARMEN';

-- Q5
SELECT DISTINCT a.codigo, a.zona
FROM agencia a
WHERE a.codigo NOT IN (
                    SELECT q.agencia
                    FROM alquiler q
                    WHERE q.fecha_inicio > TO_DATE('15/05/2025', 'DD/MM/YYYY')
                    );

-- Q6
SELECT g.codigo, g.nombre
FROM garaje g
WHERE g.codigo NOT IN (SELECT c.garaje
                        FROM coche c
                        WHERE c.matricula IN (SELECT d.coche
                                                FROM detalle_alquiler d));

-- Q7
SELECT DISTINCT c.matricula, c.marca, c.modelo
FROM coche c JOIN detalle_alquiler d 
                ON c.matricula = d.coche
                JOIN alquiler q 
                ON q.alquiler_id = d.alquiler
WHERE q.viajero NOT IN ( 
            SELECT q2.viajero
            FROM alquiler q2
            WHERE q2.agencia = 'A3');

-- Q8
SELECT c.matricula, c.precio_alquiler
FROM coche c
WHERE c.matricula IN (SELECT d.coche
                        FROM detalle_alquiler d JOIN alquiler q ON q.alquiler_id = d.alquiler
                                                JOIN viajero v ON v.codigo = q.viajero
                        WHERE (SYSDATE - v.fecha_registro) < 120)
    AND c.matricula NOT IN (SELECT d2.coche
                            FROM detalle_alquiler d2 JOIN alquiler q2 ON q2.alquiler_id = d2.alquiler
                            WHERE q2.agencia = 'A2');
        
-- Q9
SELECT v.dni, v.nombre, TO_CHAR(v.fecha_registro, 'DD/MONTH/YYYY') AS fecha_registro
FROM viajero v
WHERE v.codigo NOT IN (
        SELECT q.viajero
        FROM alquiler q JOIN detalle_alquiler d ON q.alquiler_id = d.alquiler
                        JOIN coche c ON d.coche = c.matricula
        WHERE c.precio_alquiler > 65)
ORDER BY v.fecha_registro;

-- Q10
SELECT a.codigo, a.zona
FROM agencia a
WHERE a.codigo IN (
        SELECT q.agencia 
        FROM alquiler q
        WHERE q.coste_total > 750
            AND q.alquiler_id IN (
                    SELECT d.alquiler
                    FROM detalle_alquiler d
                    WHERE d.coste_coche BETWEEN 400 AND 500));

-- Q11
SELECT v.nombre
FROM viajero v
WHERE v.codigo IN (
        SELECT q.viajero 
        FROM alquiler q
        WHERE q.fecha_fin - q.fecha_inicio > 3
            AND q.alquiler_id IN (
                SELECT d.alquiler
                FROM detalle_alquiler d 
                WHERE d.coche IN (
                        SELECT c.matricula
                        FROM coche c
                        WHERE c.marca = 'SEAT')));

-- Q12
SELECT a.codigo, a.zona
FROM agencia a
WHERE a.codigo NOT IN (
        SELECT q.agencia
        FROM alquiler q
        WHERE q.alquiler_id IN (
                SELECT d.alquiler
                FROM detalle_alquiler d
                WHERE d.coche IN (
                        SELECT c.matricula
                        FROM coche c
                        WHERE c.precio_alquiler >= 85)));

-- Q13
SELECT c.matricula
FROM coche c
WHERE c.garaje = 'G4'
    AND c.matricula NOT IN (
        SELECT d.coche
        FROM detalle_alquiler d);

-- Q14
SELECT q.agencia
FROM alquiler q
WHERE q.coste_total > 1200
UNION 
SELECT q.agencia
FROM alquiler q 
WHERE q.viajero IN (
        SELECT v.codigo
        FROM viajero v
        WHERE TO_CHAR(v.fecha_registro, 'MM/YYYY') = '08/2025');

-- Q15
SELECT d.coche
FROM detalle_alquiler d
WHERE d.alquiler IN (
        SELECT q.alquiler_id
        FROM alquiler q 
        WHERE q.viajero IN (
                SELECT v.codigo 
                FROM viajero v 
                WHERE v.ciudad = 'MURCIA'))
MINUS 
SELECT d.coche
FROM detalle_alquiler d
WHERE d.alquiler IN (
        SELECT q.alquiler_id
        FROM alquiler q
        WHERE q.viajero IN (
                SELECT v.codigo
                FROM viajero v
                WHERE v.ciudad = 'SANTOMERA'))
ORDER BY 1;



































