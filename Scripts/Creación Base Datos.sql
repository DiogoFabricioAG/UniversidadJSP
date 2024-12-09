

-- Tabla Facultad
CREATE TABLE Facultad (
    id_facultad NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre_facultad VARCHAR2(100) NOT NULL
);

-- Tabla Sexo
CREATE TABLE Sexo (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE Ubigeo (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE Estado_Acta (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE Periodo (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(6)
);

CREATE TABLE Estado_Alumno (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);


-- Tabla Escuela
CREATE TABLE Escuela (
    id_escuela NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre_escuela VARCHAR2(100) NOT NULL,
    id_facultad NUMBER,
    CONSTRAINT fk_escuela_facultad FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

-- Tabla Dpto_Academico
CREATE TABLE Dpto_Academico (
    id_dpto_academico NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre_dpto VARCHAR2(100) NOT NULL,
    id_escuela NUMBER,
    CONSTRAINT fk_dpto_escuela FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela)
);


CREATE TABLE Dato_Personales (
    id_persona NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
    sexo NUMBER,
    ubigeo NUMBER,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR2(255),
    telefono VARCHAR2(20),
    email VARCHAR2(100) UNIQUE,
    CONSTRAINT fk_datos_sexo FOREIGN KEY (sexo) REFERENCES Sexo(id),
    CONSTRAINT fk_datos_ubigeo FOREIGN KEY (ubigeo) REFERENCES Ubigeo(id)
);

-- Tabla Profesores
CREATE TABLE Profesores (
    id_profesor NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_persona NUMBER,
    id_dpto_academico NUMBER,
    CONSTRAINT fk_profesor_persona FOREIGN KEY (id_persona) REFERENCES Dato_Personales(id_persona),
    CONSTRAINT fk_profesor_dpto FOREIGN KEY (id_dpto_academico) REFERENCES Dpto_Academico(id_dpto_academico)
);




-- Tabla Plan de Estudios
CREATE TABLE Plan_Estudios (
    id_plan NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cod_plan VARCHAR2(4),
    año_creacion NUMBER(4),
    id_escuela NUMBER,
    CONSTRAINT fk_plan_escuela FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela)
);

CREATE TABLE Alumnos (
    id_alumno NUMBER GENERATED BY DEFAULT AS IDENTITY,
    id_persona NUMBER, 
    id_escuela NUMBER,
    id_codigo VARCHAR2(9) UNIQUE,
    id_plan NUMBER, 
    estado NUMBER,
    CONSTRAINT pk_alumno PRIMARY KEY (id_alumno),
    CONSTRAINT fk_alumno_plan FOREIGN KEY (id_plan) REFERENCES Plan_Estudios(id_plan),
    CONSTRAINT fk_alumno_persona FOREIGN KEY (id_persona) REFERENCES Dato_Personales(id_persona),
    CONSTRAINT fk_alumno_escuela FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela),
    CONSTRAINT fk_alumno_estado FOREIGN KEY (estado) REFERENCES Estado_Alumno(id)
);

-- Tabla Cursos
CREATE TABLE Cursos (
    id_curso NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre_curso VARCHAR2(100) NOT NULL,
    codigo_curso VARCHAR2(10) UNIQUE NOT NULL,
    id_plan NUMBER,
    creditos NUMBER(2) NOT NULL,
    CONSTRAINT fk_curso_plan FOREIGN KEY (id_plan) REFERENCES Plan_Estudios(id_plan)
);

CREATE TABLE Seccion (
    id_seccion NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_periodo NUMBER,
    id_profesor NUMBER,
    id_curso NUMBER,
    codigo_seccion VARCHAR2(1),
    CONSTRAINT fk_seccion_periodo FOREIGN KEY (id_periodo) REFERENCES Periodo(id),
    CONSTRAINT fk_seccion_profesor FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor),
    CONSTRAINT fk_seccion_curso FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabla de Requisitos
CREATE TABLE Requisitos (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_curso_princ NUMBER,
    id_curso_requer NUMBER, 
    CONSTRAINT fk_req_principal FOREIGN KEY (id_curso_princ) REFERENCES Cursos(id_curso),
    CONSTRAINT fk_req_requerimiento FOREIGN KEY (id_curso_requer) REFERENCES Cursos(id_curso)
);

-- Tabla Matricula (inscripciones de alumnos en cursos)
CREATE TABLE Matricula (
    id_matricula NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_alumno NUMBER,
    id_seccion NUMBER,
    id_periodo NUMBER,
    fecha_matricula DATE NOT NULL,
    CONSTRAINT fk_matricula_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    CONSTRAINT fk_matricula_periodo FOREIGN KEY (id_periodo) REFERENCES Periodo(id),
    CONSTRAINT fk_matricula_seccion FOREIGN KEY (id_seccion) REFERENCES Seccion(id_seccion)
);
-- Tabla Acta_Calificacion (calificaciones de alumnos en cursos)
CREATE TABLE Acta_Calificacion (
    id_acta NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_alumno NUMBER,
    id_curso NUMBER,
    fecha_evaluacion DATE NOT NULL,
    calificacion NUMBER(4,2) CHECK (calificacion >= 0 AND calificacion <= 20),
    estado NUMBER,
    CONSTRAINT fk_calificacion_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    CONSTRAINT fk_calificacion_curso FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    CONSTRAINT fk_calificacion_estado FOREIGN KEY (estado) REFERENCES Estado_Acta(id)
);
