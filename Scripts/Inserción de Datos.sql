-- ========================
-- INSERTS PARA TABLA FACULTAD
-- ========================
BEGIN
INSERT INTO Facultad (nombre_facultad, descripcion) VALUES ('Facultad de Ingeniería', 'Facultad de carreras de ingeniería');
INSERT INTO Facultad (nombre_facultad, descripcion) VALUES ('Facultad de Ciencias', 'Facultad de carreras científicas');
INSERT INTO Facultad (nombre_facultad, descripcion) VALUES ('Facultad de Humanidades', 'Facultad de carreras humanísticas');
END;

select * from FACULTAD;
-- ========================
-- INSERTS PARA TABLA DPTO_ACADEMICO
-- ========================
INSERT INTO Dpto_Academico (nombre_dpto, id_facultad) VALUES ('Departamento de Informática', 1);
INSERT INTO Dpto_Academico (nombre_dpto, id_facultad) VALUES ('Departamento de Física', 2);
INSERT INTO Dpto_Academico (nombre_dpto, id_facultad) VALUES ('Departamento de Literatura', 3);

-- ========================
-- INSERTS PARA TABLA ESCUELA
-- ========================
INSERT INTO Escuela (nombre_escuela, descripcion, id_facultad) VALUES ('Escuela de Ingeniería de Software', 'Ingeniería de Software', 1);
INSERT INTO Escuela (nombre_escuela, descripcion, id_facultad) VALUES ('Escuela de Física Aplicada', 'Física Aplicada', 2);
INSERT INTO Escuela (nombre_escuela, descripcion, id_facultad) VALUES ('Escuela de Historia y Literatura', 'Historia y Literatura', 3);

-- ========================
-- INSERTS PARA TABLA PROFESORES
-- ========================
INSERT INTO Profesores (nombre, apellido, dni, especialidad, email, telefono, id_dpto_academico) 
VALUES ('Juan', 'Perez', '12345678', 'Ingeniería de Software', 'juan.perez@uni.edu', '987654321', 1);

INSERT INTO Profesores (nombre, apellido, dni, especialidad, email, telefono, id_dpto_academico) 
VALUES ('Laura', 'Gomez', '23456789', 'Física Cuántica', 'laura.gomez@uni.edu', '912345678', 2);

INSERT INTO Profesores (nombre, apellido, dni, especialidad, email, telefono, id_dpto_academico) 
VALUES ('Carlos', 'Ruiz', '34567890', 'Literatura Clásica', 'carlos.ruiz@uni.edu', '923456789', 3);

-- ========================
-- INSERTS PARA TABLA ALUMNOS
-- ========================
INSERT INTO Alumnos (nombre, apellido, dni, fecha_nacimiento, direccion, telefono, email, id_escuela) 
VALUES ('Ana', 'Lopez', '45678901', TO_DATE('2000-01-15', 'YYYY-MM-DD'), 'Av. Siempre Viva 123', '987123456', 'ana.lopez@uni.edu', 1);

INSERT INTO Alumnos (nombre, apellido, dni, fecha_nacimiento, direccion, telefono, email, id_escuela) 
VALUES ('Pedro', 'Martinez', '56789012', TO_DATE('1999-05-20', 'YYYY-MM-DD'), 'Calle Falsa 456', '987654321', 'pedro.martinez@uni.edu', 2);

INSERT INTO Alumnos (nombre, apellido, dni, fecha_nacimiento, direccion, telefono, email, id_escuela) 
VALUES ('Lucia', 'Torres', '67890123', TO_DATE('2001-09-10', 'YYYY-MM-DD'), 'Jr. Central 789', '912345678', 'lucia.torres@uni.edu', 3);

-- ========================
-- INSERTS PARA TABLA PLAN_ESTUDIOS
-- ========================
INSERT INTO Plan_Estudios (nombre_plan, descripcion, fecha_creacion, id_escuela) 
VALUES ('Plan 2024 Ingeniería de Software', 'Plan de estudios actualizado 2024', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1);

INSERT INTO Plan_Estudios (nombre_plan, descripcion, fecha_creacion, id_escuela) 
VALUES ('Plan 2024 Física Aplicada', 'Plan de estudios de Física', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 2);

-- ========================
-- INSERTS PARA TABLA CURSOS
-- ========================
INSERT INTO Cursos (nombre_curso, codigo_curso, creditos, id_profesor) 
VALUES ('Programación Avanzada', 'INF101', 4, 1);

INSERT INTO Cursos (nombre_curso, codigo_curso, creditos, id_profesor) 
VALUES ('Física Cuántica I', 'FIS201', 3, 2);

INSERT INTO Cursos (nombre_curso, codigo_curso, creditos, id_profesor) 
VALUES ('Literatura Medieval', 'LIT301', 3, 3);

-- ========================
-- INSERTS PARA TABLA CURSOS_PLAN_ESTUDIOS
-- ========================
INSERT INTO Cursos_Plan_Estudios (id_curso, id_plan, semestre) VALUES (1, 1, 1);
INSERT INTO Cursos_Plan_Estudios (id_curso, id_plan, semestre) VALUES (2, 2, 2);
INSERT INTO Cursos_Plan_Estudios (id_curso, id_plan, semestre) VALUES (3, 2, 3);

-- ========================
-- INSERTS PARA TABLA MATRICULA
-- ========================
INSERT INTO Matricula (id_alumno, id_curso, semestre_academico, fecha_matricula) 
VALUES (1, 1, '2024-I', TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_alumno, id_curso, semestre_academico, fecha_matricula) 
VALUES (2, 2, '2024-I', TO_DATE('2024-03-02', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_alumno, id_curso, semestre_academico, fecha_matricula) 
VALUES (3, 3, '2024-I', TO_DATE('2024-03-03', 'YYYY-MM-DD'));

-- ========================
-- INSERTS PARA TABLA ACTA_CALIFICACION
-- ========================
INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion) 
VALUES (1, 1, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 18.5);

INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion) 
VALUES (2, 2, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 17.0);

INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion) 
VALUES (3, 3, TO_DATE('2024-06-25', 'YYYY-MM-DD'), 19.0);

SELECT * from ACTA_CALIFICACION;