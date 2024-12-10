<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Facultad" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facultades</title>
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

        /* Tabla de Listado */
        table {
            width: 80%;
            margin: 30px auto;
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
            background-color: #2980b9;
            color: #ffffff;
            text-transform: uppercase;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e6f7ff;
        }

        /* Botones */
        .button-container button {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease-in-out;
        }

        .button-container button:hover {
            background-color: #1abc9c;
        }

        /* Mensaje de No Datos */
        p {
            font-size: 1.2em;
            text-align: center;
            margin-top: 30px;
            color: #e74c3c;
        }
    </style>

    </head>
    <body>
        <h1>Listado de Facultades</h1>

        <%
            // Obtener la lista de facultades enviada por el Servlet
            List<Facultad> facultades = (List<Facultad>) request.getAttribute("productos");

            if (facultades != null && !facultades.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID Facultad</th>
                    <th>Nombre Facultad</th>
                    <th>Acción</th>
                </tr>
                <%
                    for (Facultad facultad : facultades) {
                %>
                <tr>
                    <td><%= facultad.getId()%></td>
                    <td><%= facultad.getNombre()%></td>
                    <td>
                        <div class="button-container">
                            <form action="EscuelaServlet" method="get">
                                <input type="hidden" name="id_facultad" value="<%= facultad.getId() %>">
                                <button type="submit">Ver Carreras</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% 
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p style="text-align: center; color: red;">No hay facultades disponibles.</p>
        <%
            }
        %>
    </body>
</html>
