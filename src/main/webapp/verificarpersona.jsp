<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verificación de Persona</title>
</head>
<body>
    <h1>Verificación de Persona</h1>
    <form action="VerificarPersonaServlet" method="post">
        <label for="codigo">Código de Alumno:</label>
        <input type="text" name="codigo" id="codigo" required><br><br>

        <label for="dni">DNI:</label>
        <input type="text" name="dni" id="dni" required><br><br>

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
