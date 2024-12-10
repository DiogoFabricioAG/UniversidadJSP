<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Javas.ActaCalificacionDTO" %>
<html>
<head>
    <title>Acta de Calificaciones</title>
</head>
<body>
    <h1>Acta de Calificaciones</h1>

    <h3>Alumno: ${nombreAlumno} (DNI: ${dniAlumno})</h3>

    <%
        List<ActaCalificacionDTO> actasCalificaciones = (List<ActaCalificacionDTO>) request.getAttribute("actasCalificaciones");
        if (actasCalificaciones != null && !actasCalificaciones.isEmpty()) {
    %>
        <table border="1" cellpadding="5" cellspacing="0">
            <thead>
                <tr>
                    <th>ID Curso</th>
                    <th>Nombre Curso</th>
                    <th>Código Curso</th>
                    <th>Fecha de Evaluación</th>
                    <th>Calificación</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ActaCalificacionDTO acta : actasCalificaciones) {
                %>
                    <tr>
                        <td><%= acta.getIdCurso() %></td>
                        <td><%= acta.getNombreCurso() %></td>
                        <td><%= acta.getCodigoCurso() %></td>
                        <td><%= acta.getFechaEvaluacion() %></td>
                        <td><%= acta.getCalificacion() %></td>
                        <td><%= acta.getEstado() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <p>No se encontraron calificaciones para este alumno.</p>
    <%
        }
    %>
</body>
</html>
