package Servlets;

import Javas.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CrearUsuarioServlet", urlPatterns = {"/CrearUsuarioServlet"})
public class CrearUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = ConexionDB.obtenerConexion()) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            int sexo = Integer.parseInt(request.getParameter("sexo"));
            int ubigeo = Integer.parseInt(request.getParameter("ubigeo"));
            String fechaNacimiento = request.getParameter("fecha_nacimiento");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");

            // Insertar en Dato_Personales
            String sqlDatos = "INSERT INTO Dato_Personales (nombre, apellido, dni, sexo, ubigeo, fecha_nacimiento, direccion, telefono, email) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement psDatos = conn.prepareStatement(sqlDatos);
            psDatos.setString(1, nombre);
            psDatos.setString(2, apellido);
            psDatos.setString(3, dni);
            psDatos.setInt(4, sexo);
            psDatos.setInt(5, ubigeo);
            psDatos.setDate(6, java.sql.Date.valueOf(fechaNacimiento));
            psDatos.setString(7, direccion);
            psDatos.setString(8, telefono);
            psDatos.setString(9, email);
            
            ResultSet rs = psDatos.executeQuery();

            int idEscuela = Integer.parseInt(request.getParameter("id_escuela"));
            String idCodigo = request.getParameter("id_codigo");
            int estado = Integer.parseInt(request.getParameter("estado"));

            String sqlAlumno = "INSERT INTO Alumnos (id_persona, id_escuela, id_codigo, estado) VALUES ((SELECT id_persona FROM Dato_Personales WHERE dni = ?), ?, ?, ?)";
            PreparedStatement psAlumno = conn.prepareStatement(sqlAlumno);
            psAlumno.setString(1, dni);
            psAlumno.setInt(2, idEscuela);
            psAlumno.setString(3, idCodigo);
            psAlumno.setInt(4, estado);
            psAlumno.executeUpdate();

            response.sendRedirect("success.jsp"); // Redirigir a una página de éxito
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirigir a una página de error
        }
    }
}