<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Escuela" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Escuelas</title>
        <style>
        /* Estilos Globales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-top: 20px;
            font-size: 2.5em;
        }

        /* Tabla de Listado */
        table {
            width: 90%;
            max-width: 900px;
            margin: 30px auto;
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #2980b9;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        tr:hover {
            background-color: #d6eaf8;
        }

        td a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        td a:hover {
            color: #1abc9c;
        }

        /* Mensaje de No Datos */
        p {
            text-align: center;
            font-size: 1.2em;
            color: #e74c3c;
            margin-top: 30px;
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
