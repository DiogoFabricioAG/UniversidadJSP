<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verificación de Persona</title>
    <style>
        /* Estilos Generales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-top: 30px;
            font-size: 2.5em;
        }

        /* Contenedor del formulario */
        form {
            width: 400px;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Etiquetas del formulario */
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.1em;
            color: #555;
        }

        /* Campos de entrada */
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        /* Botón de envío */
        button {
            width: 100%;
            padding: 10px;
            font-size: 1.1em;
            color: #fff;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1abc9c;
        }

        /* Mensajes de error */
        p {
            text-align: center;
            font-size: 1em;
            color: #e74c3c;
            margin-top: 10px;
        }
    </style>

</head>
<body>
    <h1>Verificación de Persona</h1>
    <% 
        // Obtener el parámetro id de la URL
        String id = request.getParameter("id");
    %>
    <form action="VerificarPersonaServlet" method="post">
        <label for="codigo">Código de Alumno:</label>
        <input type="text" name="codigo" id="codigo" required><br><br>

        <label for="dni">DNI:</label>
        <input type="text" name="dni" id="dni" required><br><br>

        <!-- Campo oculto para enviar el id -->
        <input type="hidden" name="id" value="<%= id %>">

        <button type="submit">Verificar</button>
    </form>

    <%-- Mostrar mensaje de error si existe --%>
    <% String mensaje = (String) request.getAttribute("mensaje");
       if (mensaje != null) { %>
        <p style="color:red;"><%= mensaje %></p>
    <% } %>

    <%-- Mostrar error técnico si existe --%>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <p style="color:red;">Error: <%= error %></p>
    <% } %>

</body>
</html>
