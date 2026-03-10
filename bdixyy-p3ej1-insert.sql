/*
Asignatura: Bases de Datos I
Curso: 2025/26
Convocatoria: enero

Practica: P3. Definicion y Modificacion de Datos en SQL

Equipo de practicas: bdixyy
 Integrante 1:
 Integrante 2: 

SCRIPT PARA ESTUDIANTES
*/

-- EJERCICIO 1. Insertar filas en las tablas del esquema--------------------------------------------------

-- Borrado de tablas, para ejecucion repetida

/***
   inserta aqui sentencias DELETE de las tablas
   en el orden inverso al de insercion
   Si surgen problemas con el ciclo referencial,
   solucionalo de igual manera que en la insercion
***/

--------------------------------------------------------
-- perfils --> TABLA perfil 

INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000001,'Berto Nunes',TO_DATE('15/01/2020','DD/MM/YYYY'),'Espanol','Amante de la tecnologia');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000002,'Hana Smith',TO_DATE('10/02/2011','DD/MM/YYYY'),'Ingles',NULL);
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000003,'Tulio Dubois',TO_DATE('05/03/2016','DD/MM/YYYY'),'Frances','Cinefilo');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000004,'Vega Rio',TO_DATE('20/01/2019','DD/MM/YYYY'),'Espanol','Viajera');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000005,'Rita Henz',TO_DATE('25/02/2021','DD/MM/YYYY'),'Aleman','Programadora de software');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000006,'Siena Bandini',TO_DATE('18/03/2020','DD/MM/YYYY'),'Italiano','Aficionada al arte');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000007,'Cleto Nunes',TO_DATE('01/04/2018','DD/MM/YYYY'),'Portugues', Null);
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000008,'Arturo Sort',TO_DATE('05/04/2014','DD/MM/YYYY'),'Espanol','Escritor');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000009,'Piro Nunes',TO_DATE('30/03/2016','DD/MM/YYYY'),'Portugues','Cocinero aficionado');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000010,'Olga Ivanova',TO_DATE('12/02/2023','DD/MM/YYYY'),'Ruso','Gamer');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000011,'Bardo Chen',TO_DATE('17/01/2014','DD/MM/YYYY'),'Espanol','Blogger de viajes');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000012,'Selva Prado',TO_DATE('11/03/2012','DD/MM/YYYY'),'Espanol','Fanatica del anime');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000013,'Yinuo Chen',TO_DATE('02/04/2010','DD/MM/YYYY'),'Chino','Fotografo');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000014,'Lulu Dupont',TO_DATE('14/03/2011','DD/MM/YYYY'),'Frances','Disenadora grafica');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000015,'Milo Conti',TO_DATE('28/02/2015','DD/MM/YYYY'),'Italiano', NULL);
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000016,'Eli Coleman',TO_DATE('09/04/2015','DD/MM/YYYY'),'Ingles','Ama la naturaleza');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000017,'Tadeo Pino',TO_DATE('23/03/2014','DD/MM/YYYY'),'Espanol','Piloto de drones');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion) 
  VALUES (600000018,'Estela Conti',TO_DATE('29/01/2015','DD/MM/YYYY'),'Italiano','Estudia astronomia');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000019,'Helio Arroyo',TO_DATE('15/02/2013','DD/MM/YYYY'),'Espanol', NULL);
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000020,'Frida Fischer',TO_DATE('19/03/2020','DD/MM/YYYY'),'Aleman','Jugadora de ajedrez');
INSERT INTO perfil (movil,nombre,fecha_registro,idioma,descripcion)
  VALUES (600000021,'Hans Salt',TO_DATE('10/03/2025','DD/MM/YYYY'),'Aleman', NULL);

--------------------------------------------------------
-- Chats de grupo
-- Se da valor 0 a la columna miembros, que se calculara' al final con UPDATE

INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C001', 'Amigos', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 0, 600000001, 'MSJ00100');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C002', 'Trabajo', TO_DATE('2022-04-10', 'YYYY-MM-DD'), 0, 600000006, 'MSJ00200');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C003', 'Familia', TO_DATE('2017-02-01', 'YYYY-MM-DD'), 0, 600000002, 'MSJ00300');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C004', 'Family Group', TO_DATE('2020-01-16', 'YYYY-MM-DD'), 0, 600000004, 'MSJ00400');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C005', 'Vecinos', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 0, 600000004, 'MSJ00500');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C006', 'The Colegas', TO_DATE('2024-06-30', 'YYYY-MM-DD'), 0, 600000009, 'MSJ00600');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C007', 'Clase', TO_DATE('2025-01-05', 'YYYY-MM-DD'), 0, 600000008, 'MSJ00700');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C008', 'Hermanos', TO_DATE('2018-05-25', 'YYYY-MM-DD'), 0, 600000009, 'MSJ00800');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C009', 'Lxs Mejores', TO_DATE('2017-05-30', 'YYYY-MM-DD'), 0, 600000008, 'MSJ00900');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C010', 'Grupo Clase', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 0, 600000002, 'MSJ01000');
INSERT INTO chat_grupo (codigo, nombre, fecha_creacion, miembros, administrador, msj_anclado)
  VALUES ('C011', 'LaFamiglia', TO_DATE('2015-03-03', 'YYYY-MM-DD'), 0, 600000006, 'MSJ01100');

--------------------------------------------------------
-- Mensajes de chats

-- Chat 1 Amigos
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00100', TO_DATE('2024-01-01 12:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000005, 'C001', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00104', TO_DATE('2024-01-02 10:30', 'YYYY-MM-DD HH24:MI'), 'NO', 600000005, 'C001', 'MSJ00103'); 
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00101', TO_DATE('2024-01-02 10:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000001, 'C001', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00102', TO_DATE('2024-01-02 10:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000017, 'C001', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00103', TO_DATE('2024-01-02 10:21', 'YYYY-MM-DD HH24:MI'), 'NO', 600000010, 'C001', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00105', TO_DATE('2024-01-02 10:40', 'YYYY-MM-DD HH24:MI'), 'NO', 600000008, 'C001', NULL);  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00106', TO_DATE('2024-01-02 11:03', 'YYYY-MM-DD HH24:MI'), 'NO', 600000001, 'C001', NULL);

-- Chat 2 Trabajo
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00201', TO_DATE('2024-04-12 20:04', 'YYYY-MM-DD HH24:MI'), 'NO', 600000007, 'C002', NULL);   
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00204', TO_DATE('2024-04-13 01:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000014, 'C002', NULL);  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00202', TO_DATE('2024-04-12 20:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000013, 'C002', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00200', TO_DATE('2024-04-12 00:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000006, 'C002', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00203', TO_DATE('2024-04-12 21:05', 'YYYY-MM-DD HH24:MI'), 'SI', 600000014, 'C002', NULL);

-- Chat 3 Familia  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00304', TO_DATE('2025-03-23 12:55', 'YYYY-MM-DD HH24:MI'), 'SI', 600000013, 'C003', 'MSJ00301');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00300', TO_DATE('2017-02-02 10:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000002, 'C003', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00302', TO_DATE('2025-03-22 09:45', 'YYYY-MM-DD HH24:MI'), 'SI', 600000002, 'C003', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original) 
  VALUES ('MSJ00301', TO_DATE('2025-03-22 08:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000011, 'C003', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00303', TO_DATE('2025-03-23 11:05', 'YYYY-MM-DD HH24:MI'), 'NO', 600000002, 'C003', 'MSJ00301');
 
-- Chat 4 Family Group 
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00400', TO_DATE('2023-09-18 08:22', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C004', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00404', TO_DATE('2024-04-01 20:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000009, 'C004', 'MSJ00402');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00401', TO_DATE('2024-04-01 15:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000009, 'C004', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00402', TO_DATE('2024-04-01 16:35', 'YYYY-MM-DD HH24:MI'), 'SI', 600000001, 'C004', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00403', TO_DATE('2024-04-01 19:05', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C004', 'MSJ00401');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00405', TO_DATE('2024-04-01 21:30', 'YYYY-MM-DD HH24:MI'), 'SI', 600000001, 'C004', NULL);  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00406', TO_DATE('2024-04-02 17:50', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C004', 'MSJ00404');
  
-- Chat 5 Vecinos 
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00500', TO_DATE('2024-05-25 13:30', 'YYYY-MM-DD HH24:MI'), 'NO', 600000019, 'C005', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00501', TO_DATE('2024-05-25 15:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C005', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00504', TO_DATE('2024-05-26 20:15', 'YYYY-MM-DD HH24:MI'), 'SI', 600000019, 'C005', 'MSJ00503');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00502', TO_DATE('2024-05-26 12:35', 'YYYY-MM-DD HH24:MI'), 'SI', 600000006, 'C005', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00503', TO_DATE('2024-05-26 19:05', 'YYYY-MM-DD HH24:MI'), 'NO', 600000013, 'C005', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00505', TO_DATE('2024-05-27 21:30', 'YYYY-MM-DD HH24:MI'), 'NO', 600000013, 'C005', NULL);  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00506', TO_DATE('2024-05-28 17:50', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C005', 'MSJ00504');

-- Chat 6 The Colegas  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00600', TO_DATE('2025-04-01 13:50', 'YYYY-MM-DD HH24:MI'), 'NO', 600000009, 'C006', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00601', TO_DATE('2025-04-01 15:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000013, 'C006', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00602', TO_DATE('2025-04-01 16:35', 'YYYY-MM-DD HH24:MI'), 'SI', 600000006, 'C006', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00603', TO_DATE('2025-04-01 19:05', 'YYYY-MM-DD HH24:MI'), 'NO', 600000002, 'C006', 'MSJ00601');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00604', TO_DATE('2025-04-01 20:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000012, 'C006', 'MSJ00602');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00605', TO_DATE('2025-04-01 21:30', 'YYYY-MM-DD HH24:MI'), 'SI', 600000020, 'C006', NULL);  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00606', TO_DATE('2025-04-02 17:50', 'YYYY-MM-DD HH24:MI'), 'NO', 600000006, 'C006', 'MSJ00604');  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00607', TO_DATE('2025-04-02 18:32', 'YYYY-MM-DD HH24:MI'), 'NO', 600000020, 'C006', NULL);
    
-- Chat 7 Clase  
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00700', TO_DATE('2025-01-10 08:25', 'YYYY-MM-DD HH24:MI'), 'NO', 600000008, 'C007', NULL);

-- Chat 8 Hermanos
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00800', TO_DATE('2018-05-25 16:30', 'YYYY-MM-DD HH24:MI'), 'NO', 600000009, 'C008', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00801', TO_DATE('2018-05-27 14:45', 'YYYY-MM-DD HH24:MI'), 'NO', 600000009, 'C008', NULL);
  
-- Chat 9 Lxs Mejores
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00900', TO_DATE('2025-04-10 18:40', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C009', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00901', TO_DATE('2025-04-10 18:42', 'YYYY-MM-DD HH24:MI'), 'NO', 600000016, 'C009', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00902', TO_DATE('2025-04-11 18:45', 'YYYY-MM-DD HH24:MI'), 'SI', 600000008, 'C009', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00903', TO_DATE('2025-04-11 19:10', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C009', 'MSJ00902');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00904', TO_DATE('2025-04-11 20:20', 'YYYY-MM-DD HH24:MI'), 'NO', 600000008, 'C009', 'MSJ00901');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ00905', TO_DATE('2025-04-12 07:30', 'YYYY-MM-DD HH24:MI'), 'SI', 600000008, 'C009', NULL);  
   
-- Chat 10 Grupo Clase
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01000', TO_DATE('2025-02-08 22:35', 'YYYY-MM-DD HH24:MI'), 'NO', 600000002, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01001', TO_DATE('2025-02-08 22:45', 'YYYY-MM-DD HH24:MI'), 'NO', 600000019, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01002', TO_DATE('2025-02-08 22:46', 'YYYY-MM-DD HH24:MI'), 'NO', 600000007, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01008', TO_DATE('2025-02-08 23:45', 'YYYY-MM-DD HH24:MI'), 'NO', 600000015, 'C010', 'MSJ01003');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01003', TO_DATE('2025-02-08 22:47', 'YYYY-MM-DD HH24:MI'), 'SI', 600000004, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01004', TO_DATE('2025-02-08 22:55', 'YYYY-MM-DD HH24:MI'), 'NO', 600000019, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01005', TO_DATE('2025-02-08 23:10', 'YYYY-MM-DD HH24:MI'), 'NO', 600000004, 'C010', 'MSJ01003');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01006', TO_DATE('2025-02-08 23:35', 'YYYY-MM-DD HH24:MI'), 'NO', 600000007, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01007', TO_DATE('2025-02-08 23:40', 'YYYY-MM-DD HH24:MI'), 'NO', 600000012, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01009', TO_DATE('2025-02-08 23:50', 'YYYY-MM-DD HH24:MI'), 'NO', 600000019, 'C010', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01010', TO_DATE('2025-02-08 23:55', 'YYYY-MM-DD HH24:MI'), 'NO', 600000015, 'C010', NULL);


-- Chat 11 La Famiglia
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01100', TO_DATE('2024-03-15 21:15', 'YYYY-MM-DD HH24:MI'), 'NO', 600000006, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01101', TO_DATE('2025-02-08 22:45', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01107', TO_DATE('2025-02-08 23:40', 'YYYY-MM-DD HH24:MI'), 'NO', 600000015, 'C011', 'MSJ01105');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01108', TO_DATE('2025-02-08 23:45', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C011', 'MSJ01105');
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01102', TO_DATE('2025-02-08 22:46', 'YYYY-MM-DD HH24:MI'), 'SI', 600000015, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01103', TO_DATE('2025-02-08 22:47', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01104', TO_DATE('2025-02-08 22:55', 'YYYY-MM-DD HH24:MI'), 'NO', 600000015, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01105', TO_DATE('2025-02-08 23:10', 'YYYY-MM-DD HH24:MI'), 'NO', 600000018, 'C011', NULL);
INSERT INTO mensaje (mensaje_id, diahora, reenviado, perfil, chat_grupo, msj_original)
  VALUES ('MSJ01106', TO_DATE('2025-02-08 23:35', 'YYYY-MM-DD HH24:MI'), 'SI', 600000006, 'C011', NULL);


--------------------------------------------------------  
-- Emails de contactos

INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000004, 600000002, 'hana@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000013, 600000007, 'cleto@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000002, 600000013, 'yinuo@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000013, 600000006, 'siena@email.com');

INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000014, 600000006, 'siena@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000013, 600000014, 'lulu@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000007, 600000013, 'yinuo@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000007, 600000006, 'siena@email.com');

INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000005, 600000008, 'artix@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000015, 600000002, 'hana@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000012, 600000002, 'hana@email.com');
INSERT INTO email_contacto (perfil, contacto, email)
  VALUES (600000007, 600000002, 'hana@email.com');

--------------------------------------------------------
-- Contactos de los perfiles de usuario
-- contactos de Berto
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000004, 'AAMama', NULL, 10, 4, 600000001);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000009, 'Papa', NULL, 30, 10, 600000001);  
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000016, 'Eli (clase)', NULL, NULL, NULL, 600000001);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arturo clase', NULL, 26, 8, 600000001);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (968000111, 'Fijo casa', NULL, NULL, NULL, 600000001);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000005, 'Rita', NULL, 26, 8, 600000001);  
  
-- contactos de Hana
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000004, 'Vega', 'Rio', 10, 4, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000019, 'Helio', 'Arroyo', NULL, NULL, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000015, 'Milo clase', NULL, NULL, NULL, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000012, 'Selva', 'Prado', NULL, NULL, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Yinuo trabajo', NULL, NULL, NULL, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000007, 'Cleto', 'Nunes', NULL, NULL, 600000002);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (968000222, 'Casa', NULL, NULL, NULL, 600000002);

-- contactos de Tulio
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000014, 'Lulu disenadora', NULL, NULL, NULL, 600000003);
  
-- contactos de Vega
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000001, 'Berto hijo', NULL, 20, 5, 600000004);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'Hana clase ingles', NULL, NULL, NULL, 600000004);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000009, 'AAPiro', NULL, 20, 7, 600000004);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000019, 'Helio vecino', NULL, NULL, NULL, 600000004);
  
-- contactos de Rita
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000001, 'Bertito', NULL, 20, 5, 600000005);
/*INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000017, 'Tadeo cero feo', NULL, NULL, NULL, 600000005);*/
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000010, 'Olga mi rusita', NULL, 20, 7, 600000005);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Artix', NULL, NULL, NULL, 600000005);

-- contactos de Siena
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000018, 'Estela figlia', NULL, 20, 5, 600000006);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000015, 'Milo figlio', NULL, NULL, NULL, 600000006);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000010, 'Olga mi rusita', NULL, 20, 7, 600000006);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arthur', NULL, NULL, NULL, 600000006);

-- contactos de Cleto
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000009, 'Piro', NULL, 30, 10, 600000007);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'Hana profe ingles', NULL, NULL, NULL, 600000007);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000006, 'Siena trabajo', NULL, NULL, NULL, 600000007);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Yinuo fotografo trabajo', NULL, NULL, NULL, 600000007);
  
-- contactos de Arturo
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000001, 'Berto', 'Nunes', NULL, NULL, 600000008);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000011, 'Bardo clase', NULL, NULL, NULL, 600000008); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000016, 'Eli', 'clase ESO', NULL, NULL, 600000008);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000018, 'Estela melli Milo', NULL, NULL, NULL, 600000008); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000015, 'Milo melli Estela', NULL, NULL, NULL, 600000008);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000010, 'Olga', NULL, 23, 2, 600000008);   

-- contactos de Piro
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000004, 'AAVega', NULL, 20, 5, 600000009);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000001, 'Berto heredero', NULL, NULL, NULL, 600000009);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000007, 'Cletoooo', NULL, 15, 7, 600000009);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Yinuo fotografo', NULL, NULL, NULL, 600000009);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000020, 'Frida ajedrez', NULL, 15, 7, 600000009);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000012, 'Selva', NULL, NULL, NULL, 600000009);

-- contactos de Olga
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000005, 'Rita hacker', NULL, 16, 12, 600000010);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000001, 'Berto', 'Nunes', NULL, NULL, 600000010);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000010, 'Olga erasmus', NULL, 23, 2, 600000010);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arturete', NULL, 26, 8, 600000010);

-- contactos de Bardo
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'AAMama', NULL, 10, 4, 600000011);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Papa', NULL, 30, 10, 600000011);  
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000016, 'Eli (clase)', NULL, NULL, NULL, 600000011);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000015, 'Milo clase', NULL, NULL, NULL, 600000011);  
  
-- contactos de Selva
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000009, 'Piro clase ingles', NULL, NULL, NULL, 600000012);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'Hana profesora ingles', NULL, NULL, NULL, 600000012); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000019, 'Helio clase ingles', NULL, NULL, NULL, 600000012);
  
-- contactos de Yinuo
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000011, 'Hijo', NULL, NULL, NULL, 600000013);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'AAHana', NULL, NULL, NULL, 600000013); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000014, 'Lulu trabajo', NULL, NULL, NULL, 600000013);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000007, 'Cleto trabajo', NULL, NULL, NULL, 600000013);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000006, 'Siena jefa', NULL, NULL, NULL, 600000013);
  
-- contactos de Lulu
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Yinuo oficina', NULL, NULL, NULL, 600000014); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000007, 'Cleto trabajo', NULL, NULL, NULL, 600000014);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000006, 'Siena', NULL, NULL, NULL, 600000014); 

-- contactos de Milo
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000006, 'La Mamma', NULL, 4, 9 , 600000015);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000018, 'Melliza', NULL, 10, 10 , 600000015); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'Hana profe ingles', NULL, NULL, NULL , 600000015);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000011, 'Bardo clase', NULL, NULL, NULL , 600000015); 
  
-- contactos de Eli
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000018, 'Estelita', NULL, NULL, NULL , 600000016);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000011, 'Bardo clase', NULL, NULL, NULL , 600000016); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arturo clase', NULL, NULL, NULL , 600000016);

-- contactos de Tadeo
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000005, 'Rita', NULL, NULL, NULL , 600000017);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000010, 'Olga', NULL, NULL, NULL , 600000017); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arturo colega', NULL, NULL, NULL , 600000017);

-- contactos de Estela
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000006, 'Mamma', NULL, 4, 9, 600000018);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000015, 'Mellizo', NULL, 10, 10 , 600000018); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000016, 'Eli delegada', NULL, NULL, NULL , 600000018);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000011, 'Bardo clase', NULL, NULL, NULL , 600000018); 
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000008, 'Arturo', NULL, NULL, NULL , 600000018);  
  
-- contactos de Frida
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000012, 'AASelva', NULL, 21, 4, 600000020);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000009, 'Piro', NULL, NULL, NULL, 600000020);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000007, 'Cleto hermano Piro', NULL, NULL, NULL, 600000020);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000002, 'Hana', NULL, NULL, NULL, 600000020);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000013, 'Yinuo fotos', NULL, NULL, NULL, 600000020);
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000021, 'Hans', 'Salt', NULL, NULL, 600000020);
  
-- Contactos de Hans
INSERT INTO contacto (telefono, nombre, apellidos, dia, mes, perfil)
  VALUES (600000020, 'Frida', 'Fisher', NULL, NULL, 600000021);

--------------------------------------------------------
-- Participacion de perfiles de usuario en chats

-- Chat 1 Amigos
-- Chat 1 Amigos
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000001, 'C001', TO_DATE('2024-01-01 10:20', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000005, 'C001', TO_DATE('2024-01-01 10:21', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000017, 'C001', TO_DATE('2024-01-01 10:22', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000010, 'C001', TO_DATE('2024-01-01 10:23', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000008, 'C001', TO_DATE('2024-01-01 10:24', 'YYYY-MM-DD HH24:MI'));  
  
-- chat 2 Trabajo
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000013, 'C002', TO_DATE('2024-04-10 17:10', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000007, 'C002', TO_DATE('2024-04-10 17:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000014, 'C002', TO_DATE('2024-04-11 10:25', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000006, 'C002', TO_DATE('2024-04-11 10:30', 'YYYY-MM-DD HH24:MI'));

-- chat 3 Familia  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000002, 'C003', TO_DATE('2017-02-01 14:50', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000011, 'C003', TO_DATE('2017-02-01 15:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000013, 'C003', TO_DATE('2017-02-01 15:40', 'YYYY-MM-DD HH24:MI'));
  
-- chat 4 Family Group  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000004, 'C004', TO_DATE('2020-01-16 11:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000001, 'C004', TO_DATE('2020-01-16 12:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000009, 'C004', TO_DATE('2020-01-16 12:35', 'YYYY-MM-DD HH24:MI'));
  
-- chat 5 Vecinos  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000004, 'C005', TO_DATE('2024-05-25 10:50', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000019, 'C005', TO_DATE('2024-05-25 10:55', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000013, 'C005', TO_DATE('2024-05-25 11:10', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000006, 'C005', TO_DATE('2024-05-26 11:35', 'YYYY-MM-DD HH24:MI'));
  
-- chat 6 The colegas
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000006, 'C006', TO_DATE('2024-06-30 17:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000009, 'C006', TO_DATE('2024-06-30 17:17', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000013, 'C006', TO_DATE('2024-06-30 17:19', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000020, 'C006', TO_DATE('2024-06-30 17:20', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000002, 'C006', TO_DATE('2024-06-30 17:25', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000012, 'C006', TO_DATE('2024-06-30 17:26', 'YYYY-MM-DD HH24:MI'));
 
  
-- chat 7 Clase  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000008, 'C007', TO_DATE('2025-01-05 09:45', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000001, 'C007', TO_DATE('2025-01-05 10:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000015, 'C007', TO_DATE('2025-01-05 10:25', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000011, 'C007', TO_DATE('2025-01-05 10:45', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000016, 'C007', TO_DATE('2025-01-05 10:48', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000018, 'C007', TO_DATE('2025-01-05 10:59', 'YYYY-MM-DD HH24:MI'));

-- chat 8 Hermanos
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000009, 'C008', TO_DATE('2018-05-25 10:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000007, 'C008', TO_DATE('2018-05-25 10:20', 'YYYY-MM-DD HH24:MI'));

-- chat 9 Lxs mejores  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000016, 'C009', TO_DATE('2017-05-30 10:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000018, 'C009', TO_DATE('2017-05-30 10:16', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000008, 'C009', TO_DATE('2017-05-30 10:17', 'YYYY-MM-DD HH24:MI'));

-- chat 10 Grupo clase  
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000002, 'C010', TO_DATE('2024-09-05 16:05', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000019, 'C010', TO_DATE('2024-09-05 16:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000015, 'C010', TO_DATE('2024-09-05 16:25', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000012, 'C010', TO_DATE('2024-09-05 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000007, 'C010', TO_DATE('2024-09-05 17:10', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000004, 'C010', TO_DATE('2024-09-05 18:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000021, 'C010', TO_DATE('2024-09-05 18:20', 'YYYY-MM-DD HH24:MI'));

-- chat 11 La Famiglia
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000006, 'C011', TO_DATE('2015-03-03 14:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000018, 'C011', TO_DATE('2015-03-03 14:10', 'YYYY-MM-DD HH24:MI'));
INSERT INTO participacion (perfil, chat_grupo, fecha_inicio)
  VALUES (600000015, 'C011', TO_DATE('2015-03-03 15:45', 'YYYY-MM-DD HH24:MI'));

-- columna calculada CHAT_GRUPO.miembros
UPDATE chat_grupo C
  SET miembros = (SELECT COUNT(*) 
                  FROM participacion P
                  WHERE P.chat_grupo = C.codigo);
   
