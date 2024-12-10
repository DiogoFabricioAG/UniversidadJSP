<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.PlanEstudios" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Planes de Estudio</title>
        <style>
        /* Estilos Globales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
            font-size: 2.5em;
        }

        /* Tabla */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: #ffffff;
            text-transform: uppercase;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #eaf5ff;
        }

        /* Enlaces */
        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #1abc9c;
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

