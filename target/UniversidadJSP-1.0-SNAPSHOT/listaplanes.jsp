<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.PlanEstudios" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Planes de Estudio</title>
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
            a {
                text-decoration: none;
                color: white;
                background-color: #4CAF50;
                padding: 5px 10px;
                border-radius: 5px;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Planes de Estudio</h1>

        <%
            List<PlanEstudios> planes = (List<PlanEstudios>) request.getAttribute("planes");

            if (planes != null && !planes.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID Plan</th>
                    <th>Código Plan</th>
                    <th>Año de Creación</th>
                    <th>ID Escuela</th>
                    <th>Acción</th>
                </tr>
                <%
                    for (PlanEstudios plan : planes) {
                %>
                <tr>
                    <td><%= plan.getIdPlan() %></td>
                    <td><%= plan.getCodPlan() %></td>
                    <td><%= plan.getAnioCreacion() %></td>
                    <td><%= plan.getIdEscuela() %></td>
                    <td>
                        <a href="CursoServlet?id_plan=<%= plan.getIdPlan() %>">Ver Cursos</a>
                    </td>
                </tr>
                <% 
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No hay planes de estudio disponibles para esta escuela.</p>
        <%
            }
        %>
    </body>
</html>

