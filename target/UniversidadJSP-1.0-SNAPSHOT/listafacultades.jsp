<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Javas.Facultad" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facultades</title>
        <style>
            table {
                width: 50%;
                border-collapse: collapse;
                margin: 20px auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
            h1 {
                text-align: center;
            }
            .button-container form {
                margin: 0;
            }
            button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 14px;
                border-radius: 5px;
            }
            button:hover {
                background-color: #45a049;
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
