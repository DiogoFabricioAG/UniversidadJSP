<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Javas.ActaCalificacionDTO" %>
<html>
<head>
    <title>Acta de Calificaciones</title>
    <style>
        /* Estilos globales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1, h3 {
            text-align: center;
            color: #2c3e50;
        }

        /* Contenedor principal */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Tabla */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #ecf0f1;
            border: 1px solid #bdc3c7;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            text-align: center;
            padding: 12px;
        }

        th {
            background-color: #3498db;
            color: white;
            text-transform: uppercase;
        }

        td {
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        tr:hover td {
            background-color: #d1ecf1;
            cursor: pointer;
        }

        /* Mensaje cuando no hay datos */
        .no-data {
            text-align: center;
            color: #e74c3c;
            font-size: 1.1em;
            margin-top: 20px;
        }

        /* Footer */
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #666;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Acta de Calificaciones</h1>

        <h3>Alumno: ${nombreAlumno} (DNI: ${dniAlumno})</h3>

        <%
            List<ActaCalificacionDTO> actasCalificaciones = (List<ActaCalificacionDTO>) request.getAttribute("actasCalificaciones");
            if (actasCalificaciones != null && !actasCalificaciones.isEmpty()) {
        %>
            <table>
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
            <p class="no-data">No se encontraron calificaciones para este alumno.</p>
        <%
            }
        %>
    </div>
    
    <footer>
        <p>© 2024 Acta de Calificaciones - Sistema Académico</p>
    </footer>
</body>
</html>
