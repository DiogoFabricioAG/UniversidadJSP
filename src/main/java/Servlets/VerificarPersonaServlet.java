/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
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

    private static final String ERROR_DB = "Error en la base de datos.";
    private static final String ERROR_DATOS = "Datos inválidos. Complete todos los campos.";
    private static final String ERROR_NO_ENCONTRADO = "No se encontró ninguna persona con los datos ingresados.";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCodigo = request.getParameter("codigo");
        String dni = request.getParameter("dni");
        String id = request.getParameter("id"); 

        if (idCodigo == null || dni == null || idCodigo.trim().isEmpty() || dni.trim().isEmpty()) {
            request.setAttribute("mensaje", ERROR_DATOS);
            request.getRequestDispatcher("verificarpersona.jsp?id=" + (id != null ? id : "")).forward(request, response);
            return;
        }

        boolean personaValida = false;

        try (Connection conn = ConexionDB.obtenerConexion()) {
            String sql = "SELECT COUNT(*) FROM Alumnos a "
                       + "INNER JOIN Dato_Personales dp ON a.id_persona = dp.id_persona "
                       + "WHERE a.id_codigo = ? AND dp.dni = ?";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, idCodigo.trim());
                ps.setString(2, dni.trim());

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        personaValida = true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", ERROR_DB);
            request.getRequestDispatcher("verificarpersona.jsp?id=" + id).forward(request, response);
            return;
        }

        if (personaValida) {
            if ("2".equals(id)) {
                response.sendRedirect("ActasCalificacionServlet?id_codigo=" + idCodigo + "&dni=" + dni);
            } else {
                response.sendRedirect("MatriculaServlet?id_codigo=" + idCodigo + "&dni=" + dni);
            }
        } else {
            request.setAttribute("mensaje", ERROR_NO_ENCONTRADO);
            request.getRequestDispatcher("verificarpersona.jsp?id=" + id).forward(request, response);
        }
    }
}
