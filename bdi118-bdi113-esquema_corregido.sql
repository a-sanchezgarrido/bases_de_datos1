/*
Asignatura: Bases de Datos I
Curso: 2025/26 
Convocatoria: enero

Practica: P1.3 Diseno Logico
ESQUEMA LOGICO ESPECIFICO (MR --> ANSI SQL)
-------------------------------------------
Cuenta Oracle: bdi118 y bdi113
Estudiante(s): Alejandro Sánchez Garrido, Pablo Martínez López       
---------------------------
*/
DROP TABLE imagen CASCADE CONSTRAINTS;
DROP TABLE texto CASCADE CONSTRAINTS;
DROP TABLE email_contacto CASCADE CONSTRAINTS;
DROP TABLE participa CASCADE CONSTRAINTS;
DROP TABLE mensaje CASCADE CONSTRAINTS;
DROP TABLE contacto CASCADE CONSTRAINTS;
DROP TABLE chat_grupo CASCADE CONSTRAINTS;
DROP TABLE perfil CASCADE CONSTRAINTS;

CREATE TABLE perfil(
    movil NUMBER(9) NOT NULL,
    nombre VARCHAR2(25) NOT NULL,
    fecha_registro DATE NOT NULL,
    idioma VARCHAR2(15) NOT NULL,
    descripcion VARCHAR2(30),
    CONSTRAINT perfil_pk PRIMARY KEY(movil)
);

CREATE TABLE chat_grupo(
    nombre VARCHAR2(25) NOT NULL,
    codigo CHAR(4) NOT NULL,
    fecha_creacion DATE NOT NULL,
    miembros NUMBER(10),
    administrador NUMBER(9) NOT NULL,
    msj_anclado CHAR(10) NOT NULL,
    CONSTRAINT chat_pk PRIMARY KEY(codigo),
    CONSTRAINT chat_fk_admin FOREIGN KEY(administrador) REFERENCES perfil(movil),
    CONSTRAINT chat_uk_msj_anclado UNIQUE(msj_anclado)
    -- ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE contacto(
  telefono NUMBER(9) NOT NULL,
  nombre VARCHAR2(25) NOT NULL,
  apellidos VARCHAR2(30),
  dia NUMBER(2),
  mes NUMBER(2),
  perfil NUMBER(9) NOT NULL,
  CONSTRAINT contacto_pk PRIMARY KEY (telefono, perfil),
  CONSTRAINT contacto_fk_perfil FOREIGN KEY (perfil) REFERENCES perfil(movil),
  -- ON DELETE CASCADE
  CONSTRAINT contacto_ck_dia CHECK (dia BETWEEN 1 AND 31 OR dia IS NULL),
  CONSTRAINT contacto_ck_mes CHECK (mes BETWEEN 1 AND 12 OR mes IS NULL),
  CONSTRAINT contacto_ck_coherencia CHECK (
    (dia IS NULL AND mes IS NULL) OR (dia IS NOT NULL AND mes IS NOT NULL)
  )
);

CREATE TABLE mensaje(
  mensaje_id CHAR(10) NOT NULL,
  reenviado CHAR(2) NOT NULL,
  diahora DATE NOT NULL,
  creador NUMBER(9) NOT NULL,
  grupo CHAR(4) NOT NULL,
  msj_original CHAR(10),
  CONSTRAINT mensaje_pk PRIMARY KEY (mensaje_id),
  CONSTRAINT mensaje_fk_creador FOREIGN KEY (creador) REFERENCES perfil(movil),
  -- ON DELETE NO ACTION ON UPDATE CASCADE
  CONSTRAINT mensaje_fk_grupo FOREIGN KEY (grupo) REFERENCES chat_grupo(codigo),
  -- ON DELETE CASCADE
  CONSTRAINT mensaje_fk_original FOREIGN KEY (msj_original) REFERENCES mensaje(mensaje_id),
  -- ON DELETE SET NULL
  CONSTRAINT mensaje_ck_reenviado CHECK (reenviado IN ('SI','NO')),
  CONSTRAINT mensaje_ck_autoref CHECK (msj_original IS NULL OR msj_original <> mensaje_id)
);

CREATE TABLE participa(
  perfil NUMBER(9) NOT NULL,
  grupo CHAR(4) NOT NULL,
  fecha_inicio DATE NOT NULL,
  CONSTRAINT participa_pk PRIMARY KEY (perfil, grupo),
  CONSTRAINT participa_fk_perfil FOREIGN KEY (perfil) REFERENCES perfil(movil),
  -- ON DELETE CASCADE
  CONSTRAINT participa_fk_grupo FOREIGN KEY (grupo) REFERENCES chat_grupo(codigo)
  -- ON DELETE CASCADE

);

CREATE TABLE email_contacto(
  telefono NUMBER(9) NOT NULL,
  perfil NUMBER(9) NOT NULL,
  email VARCHAR2(60) NOT NULL,
  CONSTRAINT emailc_pk PRIMARY KEY (telefono, perfil, email),
  CONSTRAINT emailc_fk_contacto FOREIGN KEY (telefono, perfil) REFERENCES contacto(telefono, perfil)
  -- ON DELETE CASCADE
);

CREATE TABLE texto(
  mensaje_id CHAR(10) NOT NULL,
  texto VARCHAR2(100) NOT NULL,
  CONSTRAINT texto_pk PRIMARY KEY (mensaje_id),
  CONSTRAINT texto_fk_msj FOREIGN KEY (mensaje_id) REFERENCES mensaje(mensaje_id)
  -- ON DELETE CASCADE
);

CREATE TABLE imagen(
  mensaje_id CHAR(10) NOT NULL,
  ubicacion VARCHAR2(30) NOT NULL,
  tamano NUMBER(10) NOT NULL,
  formato VARCHAR2(5) NOT NULL,
  comentario VARCHAR2(30),
  CONSTRAINT imagen_pk PRIMARY KEY (mensaje_id),
  CONSTRAINT imagen_fk_msj FOREIGN KEY (mensaje_id) REFERENCES mensaje(mensaje_id),
  -- ON DELETE CASCADE
  CONSTRAINT imagen_ck_tam CHECK (tamano IS NULL OR tamano > 0),
  CONSTRAINT imagen_ck_fmt CHECK (formato IN ('JPG','PNG','BMP','TIFF'))
);

ALTER TABLE chat_grupo ADD CONSTRAINT chat_fk_msj_anclado
  FOREIGN KEY (msj_anclado) REFERENCES mensaje(mensaje_id); --nos aparece subrayado sin los paréntesis de mensaje_anclado
  -- ON DELETE NO ACTION ON UPDATE CASCADE