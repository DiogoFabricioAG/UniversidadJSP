<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Javas.CursoDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Matricula de Cursos</title>
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
