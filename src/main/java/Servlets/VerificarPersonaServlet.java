/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diogo
 */
@WebServlet(name = "VerificarPersonaServlet", urlPatterns = {"/VerificarPersonaServlet"})
public class VerificarPersonaServlet extends HttpServlet {
   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("email");
        String dni = request.getParameter("dni");

        boolean personaValida = false;

        if (correo != null && dni != null) {
            try (Connection conn = ConexionDB.obtenerConexion()) {
                String sql = "SELECT COUNT(*) FROM Dato_Personales WHERE email = ? AND dni = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, correo);
                    ps.setString(2, dni);

                    ResultSet rs = ps.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        personaValida = true;
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error en la base de datos.");
            }
        }

        if (personaValida) {
            // Redirigir a la página de matrícula con datos prellenados
            response.sendRedirect("matricula.jsp?email=" + correo + "&dni=" + dni);
        } else {
            // Redirigir de vuelta con un mensaje de error
            request.setAttribute("mensaje", "No se encontró ninguna persona con los datos ingresados.");
            request.getRequestDispatcher("verificarPersona.jsp").forward(request, response);
        }
    }
}
