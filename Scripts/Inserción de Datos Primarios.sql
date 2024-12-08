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

-- Confirmar los cambios
COMMIT;
