-- Inserts para Facultad
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Arquitectura, Urbanismo y Arte');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Ambiental');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Industrial y de Sistemas');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Eléctrica y Electrónica');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería de Petróleo, Gas Natural y Petroquímica');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Química y Textil');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ciencias');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Geológica Minera y Metalúrgica');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Civil');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Económica, Estadística y Ciencias Sociales');
INSERT INTO Facultad (nombre_facultad) VALUES ('Facultad de Ingeniería Mecánica');

-- Inserts para Sexo
INSERT INTO Sexo (nombre) VALUES ('Masculino');
INSERT INTO Sexo (nombre) VALUES ('Femenino');
INSERT INTO Sexo (nombre) VALUES ('Otro');

-- Inserts para Ubigeo
INSERT INTO Ubigeo (nombre) VALUES ('Lima');
INSERT INTO Ubigeo (nombre) VALUES ('Arequipa');
INSERT INTO Ubigeo (nombre) VALUES ('Cusco');
INSERT INTO Ubigeo (nombre) VALUES ('Trujillo');
INSERT INTO Ubigeo (nombre) VALUES ('Chiclayo');
INSERT INTO Ubigeo (nombre) VALUES ('Callao');
INSERT INTO Ubigeo (nombre) VALUES ('Huancayo');
INSERT INTO Ubigeo (nombre) VALUES ('Huancavelica');
INSERT INTO Ubigeo (nombre) VALUES ('Piura');
INSERT INTO Ubigeo (nombre) VALUES ('Tacna');

-- Inserts para Estado_Acta
INSERT INTO Estado_Acta (nombre) VALUES ('Aprobado');
INSERT INTO Estado_Acta (nombre) VALUES ('Desaprobado');
INSERT INTO Estado_Acta (nombre) VALUES ('Pendiente');

-- Inserts para Periodo
INSERT INTO Periodo (nombre) VALUES ('2024-1');
INSERT INTO Periodo (nombre) VALUES ('2024-2');
INSERT INTO Periodo (nombre) VALUES ('2025-1');
INSERT INTO Periodo (nombre) VALUES ('2025-2');

-- Inserts para Estado_Alumno
INSERT INTO Estado_Alumno (nombre) VALUES ('Activo');
INSERT INTO Estado_Alumno (nombre) VALUES ('Inactivo');
INSERT INTO Estado_Alumno (nombre) VALUES ('Graduado');
INSERT INTO Estado_Alumno (nombre) VALUES ('Expulsado');

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


-- Confirmar los cambios
COMMIT;

select * from Dato_Personales;
select * from ALUMNOS;

INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) VALUES ((SELECT id_persona FROM Dato_Personales WHERE dni = '71434915'), 2, '20221109A', 1);

SELECT id_persona FROM Dato_Personales WHERE dni = '71434915';