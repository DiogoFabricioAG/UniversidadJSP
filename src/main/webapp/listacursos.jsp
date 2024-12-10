<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Curso" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Cursos</title>
        <style>
        /* Estilos Globales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-top: 20px;
            font-size: 2em;
        }

        /* Tabla de Cursos */
        table {
            width: 90%;
            max-width: 800px;
            margin: 30px auto;
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: #ffffff;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #dfe6e9;
        }

        td {
            color: #555;
        }

        /* Mensaje de No Datos */
        p {
            text-align: center;
            font-size: 1.2em;
            margin-top: 30px;
            color: #e74c3c;
        }
    </style>

    </head>
    <body>
        <h1>Cursos del Plan de Estudios</h1>

        <%
            // Obtener la lista de cursos desde el servlet
            List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");

            if (cursos != null && !cursos.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Nombre Curso</th>
                    <th>Código Curso</th>
                    <th>ID Plan</th>
                    <th>Créditos</th>
                </tr>
                <%
                    for (Curso curso : cursos) {
                %>
                <tr>
                    <td><%= curso.getNombreCurso() %></td>
                    <td><%= curso.getCodigoCurso() %></td>
                    <td><%= curso.getIdPlan() %></td>
                    <td><%= curso.getCreditos() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No hay cursos disponibles para este plan de estudios.</p>
        <%
            }
        %>
    </body>
</html>
