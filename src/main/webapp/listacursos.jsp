<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Curso" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Cursos</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            table {
                width: 70%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            p {
                text-align: center;
                color: red;
                font-weight: bold;
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
