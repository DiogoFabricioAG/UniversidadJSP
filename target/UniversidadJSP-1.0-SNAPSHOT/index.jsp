<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Javas.ConexionDB" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prueba Conexión Oracle</title>
</head>
<body>
    <h1>Prueba de Conexión a Oracle</h1>

    <%
        Connection conexion = null;
        try {
            // Obtener conexión
            conexion = ConexionDB.obtenerConexion();
            
            // Ejemplo de consulta SQL
            String sql = "SELECT * FROM Facultad";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            out.println("<table border='1'>");
            out.println("<tr><th>ID Facultad</th><th>Nombre</th><th>Descripción</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id_facultad") + "</td>");
                out.println("<td>" + rs.getString("nombre_facultad") + "</td>");
                out.println("<td>" + rs.getString("descripcion") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Cerrar conexión
            ConexionDB.cerrarConexion(conexion);
        }
    %>
</body>
</html>