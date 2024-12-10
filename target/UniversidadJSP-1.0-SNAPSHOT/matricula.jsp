<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Javas.CursoDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Matricula de Cursos</title>
    <style>
        /* Estilos Globales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1, h3, h4 {
            text-align: center;
            color: #2c3e50;
        }

        h1 {
            margin-top: 20px;
            font-size: 2.5em;
        }

        h3, h4 {
            font-size: 1.4em;
            margin: 10px 0;
        }

        /* Contenedor del formulario */
        form {
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Cursos disponibles */
        div {
            margin: 15px 0;
            display: flex;
            align-items: center;
            font-size: 1.1em;
            background-color: #f8f8f8;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        div:hover {
            background-color: #eaf2ff;
        }

        input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
            cursor: pointer;
        }

        /* Botón de envío */
        button {
            display: block;
            width: 30%;
            margin: 20px auto;
            padding: 10px;
            font-size: 1.1em;
            color: #fff;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1abc9c;
        }

        /* Mensaje sin cursos */
        p {
            text-align: center;
            font-size: 1.2em;
            color: #e74c3c;
        }
    </style>

</head>
<body>
    <h1>Matriculación de Cursos</h1>
    
    <h3>Alumno: ${alumno.nombre} ${alumno.apellido} (${alumno.dni})</h3>
    <h4>Plan de estudios: ${alumno.idPlanEstudios}</h4>
    
    <form action="ConfirmarMatriculaServlet" method="POST">
        <input type="hidden" name="idPersona" value="${alumno.idAlumno}">
        
        <h4>Selecciona los cursos y secciones:</h4>
        
        <% 
            List<CursoDTO> cursosSecciones = (List<CursoDTO>) request.getAttribute("cursosSecciones");
            if (cursosSecciones != null && !cursosSecciones.isEmpty()) {
                for (CursoDTO cursoSeccion : cursosSecciones) {
        %>
            <div>
                <input type="checkbox" name="cursosSeleccionados" value="<%= cursoSeccion.getIdCurso() %>">
                <%= cursoSeccion.getNombreCurso() %> - 
                <%= cursoSeccion.getCodigoCurso() %> - 
                <%= cursoSeccion.getCreditos() %> créditos - 
                Sección: <%= cursoSeccion.getCodigoSeccion() %>
            </div>
        <% 
                }
            } else { 
        %>
            <p>No hay cursos disponibles para matricular.</p>
        <% 
            }
        %>
        
        <button type="submit">Matricular</button>
    </form>
</body>
</html>
