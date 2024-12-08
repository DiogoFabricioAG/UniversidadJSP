-- Inserts para Escuela (Carreras asociadas a las Facultades)
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ciencias de la Computación', 7); -- Facultad de Ciencias
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Física', 7); -- Facultad de Ciencias
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Matemática', 7); -- Facultad de Ciencias
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Civil', 9); -- Facultad de Ingeniería Civil
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Mecánica', 11); -- Facultad de Ingeniería Mecánica
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Industrial', 3); -- Facultad de Ingeniería Industrial y de Sistemas
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Eléctrica', 4); -- Facultad de Ingeniería Eléctrica y Electrónica
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Electrónica', 4); -- Facultad de Ingeniería Eléctrica y Electrónica
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Química', 6); -- Facultad de Ingeniería Química y Textil
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Textil', 6); -- Facultad de Ingeniería Química y Textil
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería de Petróleo', 5); -- Facultad de Ingeniería de Petróleo, Gas Natural y Petroquímica
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería de Minas', 8); -- Facultad de Ingeniería Geológica Minera y Metalúrgica
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Ambiental', 2); -- Facultad de Ingeniería Ambiental
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería Económica', 10); -- Facultad de Ingeniería Económica, Estadística y Ciencias Sociales
INSERT INTO Escuela (nombre_escuela, id_facultad) VALUES ('Ingeniería de Sistemas', 3); -- Facultad de Ingeniería Industrial y de Sistemas

-- Inserts para Dpto_Academico (Especializaciones de cada carrera)
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Inteligencia Artificial', 1); -- Ciencias de la Computación
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Ciencia de Datos', 1); -- Ciencias de la Computación
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Computación Gráfica', 1); -- Ciencias de la Computación

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Física Teórica', 2); -- Física
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Física Experimental', 2); -- Física

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Estructuras', 4); -- Ingeniería Civil
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Hidráulica', 4); -- Ingeniería Civil

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Automatización', 5); -- Ingeniería Mecánica
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Mecánica de Materiales', 5); -- Ingeniería Mecánica

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Telecomunicaciones', 8); -- Ingeniería Electrónica
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Robótica', 8); -- Ingeniería Electrónica

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Procesos Químicos', 9); -- Ingeniería Química
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Biotecnología', 9); -- Ingeniería Química

INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Minería Subterránea', 12); -- Ingeniería de Minas
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Minería a Cielo Abierto', 12); -- Ingeniería de Minas


INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Sistemas de Información', 13); -- Ingeniería de Sistemas
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Gestión de Proyectos de TI', 13); -- Ingeniería de Sistemas
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Arquitectura de Software', 13); -- Ingeniería de Sistemas
INSERT INTO Dpto_Academico (nombre_dpto, id_escuela) VALUES ('Redes y Comunicaciones', 13); -- Ingeniería de Sistemas


-- ==================
-- DATOS PERSONAS
-- ==================


-- Profesores

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Juan', 'Perez', '12345678', 1, 1, TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'Av. Siempre Viva 123', '987654321', 'juan.perez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Maria', 'Lopez', '12345679', 2, 2, TO_DATE('1982-03-22', 'YYYY-MM-DD'), 'Jr. Los Cedros 456', '987654322', 'maria.lopez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Carlos', 'Garcia', '12345680', 1, 3, TO_DATE('1979-12-10', 'YYYY-MM-DD'), 'Calle Falsa 789', '987654323', 'carlos.garcia@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Ana', 'Martinez', '12345681', 2, 4, TO_DATE('1985-02-18', 'YYYY-MM-DD'), 'Av. La Marina 789', '987654324', 'ana.martinez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Pedro', 'Sanchez', '12345682', 1, 5, TO_DATE('1978-07-30', 'YYYY-MM-DD'), 'Calle Los Olivos 111', '987654325', 'pedro.sanchez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Luisa', 'Ramirez', '12345683', 2, 6, TO_DATE('1983-04-12', 'YYYY-MM-DD'), 'Jr. Arica 456', '987654326', 'luisa.ramirez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Jorge', 'Fernandez', '12345684', 1, 7, TO_DATE('1980-08-19', 'YYYY-MM-DD'), 'Av. Grau 202', '987654327', 'jorge.fernandez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Claudia', 'Torres', '12345685', 2, 8, TO_DATE('1987-01-25', 'YYYY-MM-DD'), 'Jr. Lima 333', '987654328', 'claudia.torres@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Ricardo', 'Diaz', '12345686', 1, 9, TO_DATE('1982-06-28', 'YYYY-MM-DD'), 'Calle Los Girasoles 777', '987654329', 'ricardo.diaz@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Sofia', 'Mendoza', '12345687', 2, 10, TO_DATE('1984-11-03', 'YYYY-MM-DD'), 'Av. Salaverry 101', '987654330', 'sofia.mendoza@uni.edu.pe');


-- Alumnos

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Andrea', 'Castillo', '23456789', 2, 1, TO_DATE('2001-05-12', 'YYYY-MM-DD'), 'Av. Primavera 101', '900123456', 'andrea.castillo@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Luis', 'Ramirez', '23456790', 1, 2, TO_DATE('2002-01-15', 'YYYY-MM-DD'), 'Jr. Los Álamos 456', '900123457', 'luis.ramirez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Clara', 'Sanchez', '23456791', 2, 3, TO_DATE('2000-08-22', 'YYYY-MM-DD'), 'Calle Lima 321', '900123458', 'clara.sanchez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Jorge', 'Martinez', '23456792', 1, 4, TO_DATE('1999-12-18', 'YYYY-MM-DD'), 'Av. Arequipa 789', '900123459', 'jorge.martinez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Valeria', 'Torres', '23456793', 2, 5, TO_DATE('2001-06-10', 'YYYY-MM-DD'), 'Jr. Salaverry 654', '900123460', 'valeria.torres@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Pablo', 'Fernandez', '23456794', 1, 6, TO_DATE('2002-11-30', 'YYYY-MM-DD'), 'Av. Grau 456', '900123461', 'pablo.fernandez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Lucia', 'Diaz', '23456795', 2, 7, TO_DATE('2000-04-25', 'YYYY-MM-DD'), 'Calle los Pinos 555', '900123462', 'lucia.diaz@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Carlos', 'Vega', '23456796', 1, 8, TO_DATE('2001-02-28', 'YYYY-MM-DD'), 'Jr. Progreso 234', '900123463', 'carlos.vega@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Monica', 'Gomez', '23456797', 2, 9, TO_DATE('2003-03-15', 'YYYY-MM-DD'), 'Av. La Marina 789', '900123464', 'monica.gomez@uni.edu.pe');

INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email)
VALUES ('Raul', 'Navarro', '23456798', 1, 10, TO_DATE('2000-07-12', 'YYYY-MM-DD'), 'Calle San Martin 987', '900123465', 'raul.navarro@uni.edu.pe');

-- Profesores

-- Asumiendo que los IDs de los departamentos académicos ya existen en la tabla Dpto_Academico
INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (1, 1); -- Profesor Juan Perez, Departamento de Ingeniería de Sistemas

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (2, 2); -- Profesora Maria Lopez, Departamento de Ingeniería Eléctrica

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (3, 3); -- Profesor Carlos Garcia, Departamento de Matemáticas

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (4, 4); -- Profesora Ana Martinez, Departamento de Física

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (5, 1); -- Profesor Pedro Sanchez, Departamento de Ingeniería de Sistemas

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (6, 2); -- Profesora Luisa Ramirez, Departamento de Ingeniería Eléctrica

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (7, 3); -- Profesor Jorge Fernandez, Departamento de Matemáticas

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (8, 4); -- Profesora Claudia Torres, Departamento de Física

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (9, 1); -- Profesor Ricardo Diaz, Departamento de Ingeniería de Sistemas

INSERT INTO Profesores (id_persona, id_dpto_academico) 
VALUES (10, 2); -- Profesora Sofia Mendoza, Departamento de Ingeniería Eléctrica

-- Alumnos

-- Asumiendo que los IDs de las escuelas y estados ya existen
INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (11, 1, '20221101A', 1); -- Alumna Andrea Castillo, Escuela de Ingeniería de Sistemas, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (12, 2, '20221102B', 1); -- Alumno Luis Ramirez, Escuela de Ingeniería Eléctrica, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (13, 3, '20221103C', 1); -- Alumna Clara Sanchez, Escuela de Matemáticas, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (14, 4, '20221104D', 1); -- Alumno Jorge Martinez, Escuela de Física, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (15, 1, '20221105E', 2); -- Alumna Valeria Torres, Escuela de Ingeniería de Sistemas, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (16, 2, '20221106F', 1); -- Alumno Pablo Fernandez, Escuela de Ingeniería Eléctrica, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (17, 3, '20221107G', 1); -- Alumna Lucia Diaz, Escuela de Matemáticas, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (18, 4, '20221108H', 1); -- Alumno Carlos Vega, Escuela de Física, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (19, 1, '20221109I', 1); -- Alumna Monica Gomez, Escuela de Ingeniería de Sistemas, Estado "Activo"

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) 
VALUES (20, 2, '20221110J', 1); -- Alumno Raul Navarro, Escuela de Ingeniería Eléctrica, Estado "Activo"


-- Planes de estudios para distintas escuelas
INSERT INTO Plan_Estudios (cod_plan, año_creacion, id_escuela) VALUES ('P202', 2020, 1); -- Plan 2020 para Ingeniería de Sistemas
INSERT INTO Plan_Estudios (cod_plan, año_creacion, id_escuela) VALUES ('P203', 2021, 2); -- Plan 2021 para Ingeniería Eléctrica
INSERT INTO Plan_Estudios (cod_plan, año_creacion, id_escuela) VALUES ('P204', 2022, 3); -- Plan 2022 para Matemáticas
INSERT INTO Plan_Estudios (cod_plan, año_creacion, id_escuela) VALUES ('P205', 2023, 4); -- Plan 2023 para Física


-- Cursos asignados a los planes de estudio
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Programación I', 'SIS101', 1, 4);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Cálculo Diferencial', 'MAT101', 1, 3);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Circuitos Eléctricos', 'ELE201', 2, 4);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Electromagnetismo', 'FIS301', 4, 3);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Álgebra Lineal', 'MAT102', 3, 3);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Base de Datos', 'SIS202', 1, 4);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Redes Eléctricas', 'ELE202', 2, 4);
INSERT INTO Cursos (nombre_curso, codigo_curso, id_plan, creditos) VALUES ('Física Moderna', 'FIS302', 4, 3);


-- Requisitos entre cursos
INSERT INTO Requisitos (id_curso_princ, id_curso_requer) VALUES (6, 1); -- Base de Datos requiere Programación I
INSERT INTO Requisitos (id_curso_princ, id_curso_requer) VALUES (2, 5); -- Cálculo Diferencial requiere Álgebra Lineal
INSERT INTO Requisitos (id_curso_princ, id_curso_requer) VALUES (3, 7); -- Circuitos Eléctricos requiere Redes Eléctricas
INSERT INTO Requisitos (id_curso_princ, id_curso_requer) VALUES (4, 8); -- Electromagnetismo requiere Física Moderna


-- Secciones ofrecidas para los cursos en un periodo específico
INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 1, 1, 'A'); -- Programación I con Profesor Juan Perez, sección A

INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 2, 2, 'B'); -- Cálculo Diferencial con Profesora Maria Lopez, sección B

INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 3, 3, 'A'); -- Circuitos Eléctricos con Profesor Carlos Garcia, sección A

INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 4, 4, 'C'); -- Electromagnetismo con Profesora Ana Martinez, sección C

INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 5, 5, 'A'); -- Álgebra Lineal con Profesor Pedro Sanchez, sección A

INSERT INTO Seccion (id_periodo, id_profesor, id_curso, codigo_seccion) 
VALUES (1, 6, 6, 'B'); -- Base de Datos con Profesora Luisa Ramirez, sección B

-- Matrícula de alumnos en secciones
INSERT INTO Matricula (id_alumno, id_seccion, id_periodo, fecha_matricula) 
VALUES (1, 1, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_alumno, id_seccion, id_periodo, fecha_matricula) 
VALUES (2, 2, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_alumno, id_seccion, id_periodo, fecha_matricula) 
VALUES (3, 3, 1, TO_DATE('2024-03-02', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_alumno, id_seccion, id_periodo, fecha_matricula) 
VALUES (4, 4, 1, TO_DATE('2024-03-02', 'YYYY-MM-DD'));


-- Calificaciones de alumnos en los cursos
INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion, estado) 
VALUES (1, 1, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 18.50, 1);

INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion, estado) 
VALUES (2, 2, TO_DATE('2024-06-21', 'YYYY-MM-DD'), 15.75, 1);

INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion, estado) 
VALUES (3, 3, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 17.00, 1);

INSERT INTO Acta_Calificacion (id_alumno, id_curso, fecha_evaluacion, calificacion, estado) 
VALUES (4, 4, TO_DATE('2024-06-23', 'YYYY-MM-DD'), 16.25, 1);


-- Confirmar los cambios
COMMIT;
