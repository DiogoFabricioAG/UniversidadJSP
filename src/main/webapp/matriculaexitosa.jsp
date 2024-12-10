<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Javas.CursoDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Matricula Exitosa</title>
</head>
<body>
    <h1>Matriculación Exitosa</h1>
    
    <p>¡Felicidades! La matrícula ha sido completada con éxito.</p>
    
    <h3>Detalles de la matrícula:</h3>
    <ul>
        <li><strong>Alumno:</strong> ${alumno.nombre} ${alumno.apellido} (${alumno.dni})</li>
        <li><strong>Plan de estudios:</strong> ${alumno.idPlanEstudios}</li>
        <li><strong>Secciones matriculadas:</strong></li>
        <ul>
            <% 
                List<CursoDTO> cursosSeleccionados = (List<CursoDTO>) request.getAttribute("cursosSeleccionados");
                if (cursosSeleccionados != null && !cursosSeleccionados.isEmpty()) {
                    for (CursoDTO curso : cursosSeleccionados) {
            %>
                <li>
                    <%= curso.getNombreCurso() %> - 
                    <%= curso.getCodigoCurso() %> - 
                    Sección: <%= curso.getCodigoSeccion() %>
                </li>
            <% 
                    }
                } else { 
            %>
                <li>No se han seleccionado cursos.</li>
            <% 
                }
            %>
        </ul>
    </ul>
    
    <p>Para cualquier duda, por favor comunícate con la administración.</p>
    
    <a href="index.jsp">Volver al inicio</a>
</body>
</html>
