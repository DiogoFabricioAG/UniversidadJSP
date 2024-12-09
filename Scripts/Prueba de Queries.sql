-- 1. Lista de alumnos matriculados por periodo y sección

SELECT 
    p.nombre AS periodo,
    s.codigo_seccion AS seccion,
    dp.nombre || ' ' || dp.apellido AS nombre_alumno,
    e.nombre_escuela AS escuela
FROM 
    Matricula m
JOIN 
    Alumnos a ON m.id_alumno = a.id_alumno
JOIN 
    Dato_Personales dp ON a.id_persona = dp.id_persona
JOIN 
    Seccion s ON m.id_seccion = s.id_seccion
JOIN 
    Periodo p ON m.id_periodo = p.id
JOIN 
    Escuela e ON a.id_escuela = e.id_escuela
ORDER BY 
    p.nombre, s.codigo_seccion, nombre_alumno;


-- 2. Profesores asignados a cursos y secciones

SELECT 
    dp.nombre || ' ' || dp.apellido AS nombre_profesor,
    c.nombre_curso,
    s.codigo_seccion,
    p.nombre AS periodo
FROM 
    Seccion s
JOIN 
    Profesores prof ON s.id_profesor = prof.id_profesor
JOIN 
    Dato_Personales dp ON prof.id_persona = dp.id_persona
JOIN 
    Cursos c ON s.id_curso = c.id_curso
JOIN 
    Periodo p ON s.id_periodo = p.id
ORDER BY 
    p.nombre, c.nombre_curso, nombre_profesor;

-- 3. Promedio de calificaciones por curso

SELECT 
    c.nombre_curso,
    AVG(ac.calificacion) AS promedio_calificacion
FROM 
    Acta_Calificacion ac
JOIN 
    Cursos c ON ac.id_curso = c.id_curso
GROUP BY 
    c.nombre_curso
ORDER BY 
    promedio_calificacion DESC;



-- 4. Cantidad de alumnos por estado

SELECT 
    ea.nombre AS estado_alumno,
    COUNT(a.id_alumno) AS cantidad_alumnos
FROM 
    Alumnos a
JOIN 
    Estado_Alumno ea ON a.estado = ea.id
GROUP BY 
    ea.nombre
ORDER BY 
    cantidad_alumnos DESC;

-- 5. Requisitos de cursos
 
SELECT 
    c1.nombre_curso AS curso_principal,
    c2.nombre_curso AS curso_requerido
FROM 
    Requisitos r
JOIN 
    Cursos c1 ON r.id_curso_princ = c1.id_curso
JOIN 
    Cursos c2 ON r.id_curso_requer = c2.id_curso
ORDER BY 
    c1.nombre_curso;

-- 6. Cantidad de cursos por plan de estudios

SELECT 
    pe.cod_plan AS codigo_plan,
    COUNT(c.id_curso) AS cantidad_cursos
FROM 
    Cursos c
JOIN 
    Plan_Estudios pe ON c.id_plan = pe.id_plan
GROUP BY 
    pe.cod_plan
ORDER BY 
    cantidad_cursos DESC;

-- 7. Escoger el plan ACtualizado para la inscripción del usuario.

SELECT ID_PLAN 
FROM   Plan_Estudios
WHERE ID_ESCUELA = 3
ORDER BY AÑO_CREACION DESC
FETCH FIRST 1 ROWS ONLY;

SELECT * FROM ALUMNOS;