<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Escuela" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Escuelas</title>
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
        <h1>Escuelas de la Facultad</h1>

        <%
            // Obtener la lista de escuelas del Servlet
            List<Escuela> escuelas = (List<Escuela>) request.getAttribute("escuelas");

            if (escuelas != null && !escuelas.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID Escuela</th>
                    <th>Nombre Escuela</th>
                    <th>ID Facultad</th>
                    <th>Acción</th>
                </tr>
                <%
                    for (Escuela escuela : escuelas) {
                %>
                <tr>
                    <td><%= escuela.getIdEscuela() %></td>
                    <td><%= escuela.getNombreEscuela() %></td>
                    <td><%= escuela.getIdFacultad() %></td>
                    <td>
                        <a href="PlanEstudiosServlet?id_escuela=<%= escuela.getIdEscuela() %>">Ver Planes</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No hay escuelas disponibles para esta facultad.</p>
        <%
            }
        %>
    </body>
</html>
