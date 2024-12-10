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

@WebServlet(name = "VerificarPersonaServlet", urlPatterns = {"/VerificarPersonaServlet"})
public class VerificarPersonaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCodigo = request.getParameter("codigo");
        String dni = request.getParameter("dni");

        boolean personaValida = false;
        System.out.println("Valor obtenido: "+idCodigo + dni);
        if (idCodigo != null && dni != null && !idCodigo.isEmpty() && !dni.isEmpty()) {
            try (Connection conn = ConexionDB.obtenerConexion()) {

                String sql = "SELECT COUNT(*) FROM Alumnos a "
                           + "INNER JOIN Dato_Personales dp ON a.id_persona = dp.id_persona "
                           + "WHERE a.id_codigo = ? AND dp.dni = ?";
                
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, idCodigo);
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
            response.sendRedirect("MatriculaServlet?id_codigo=" + idCodigo + "&dni=" + dni);
        } else {
            
            request.setAttribute("mensaje", "No se encontró ninguna persona con los datos ingresados.");
            request.getRequestDispatcher("verificarpersona.jsp").forward(request, response);
        }
    }
}
