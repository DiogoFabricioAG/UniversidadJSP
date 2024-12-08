-- Lenguaje PL/SQL : Borrar las tablas si existen.
BEGIN
   FOR tabla IN (SELECT table_name 
                 FROM user_tables 
                 WHERE table_name IN (
                     'ACTA_CALIFICACION', 'MATRICULA', 'REQUISITOS', 'SECCION', 
                     'CURSOS', 'PLAN_ESTUDIOS', 'ALUMNOS', 'PROFESORES', 
                     'DATO_PERSONALES', 'DPTO_ACADEMICO', 'ESCUELA', 
                     'ESTADO_ALUMNO', 'PERIODO', 'ESTADO_ACTA', 'UBIGEO', 
                     'SEXO', 'FACULTAD'
                 )) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || tabla.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;