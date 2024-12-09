package Servlets;

import Javas.PlanEstudios;
import Javas.ConexionDB;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PlanEstudiosServlet", urlPatterns = {"/PlanEstudiosServlet"})
public class PlanEstudiosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PlanEstudios> planes = new ArrayList<>();

        // Obtener el parámetro id_escuela de la URL
        String idEscuelaParam = request.getParameter("id_escuela");

        if (idEscuelaParam != null) {
            int idEscuela = Integer.parseInt(idEscuelaParam);

            // Consulta SQL para obtener los planes de estudio filtrados por id_escuela
            String sql = "SELECT * FROM Plan_Estudios WHERE id_escuela = ?";

            try (Connection conn = ConexionDB.obtenerConexion();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, idEscuela);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    PlanEstudios plan = new PlanEstudios(
                        rs.getInt("id_plan"),
                        rs.getString("cod_plan"),
                        rs.getInt("año_creacion"),
                        rs.getInt("id_escuela")
                    );
                    planes.add(plan);
                }

                // Enviar la lista de planes al JSP
                request.setAttribute("planes", planes);

                // Redirigir al JSP que mostrará los planes de estudio
                RequestDispatcher dispatcher = request.getRequestDispatcher("/listaplanes.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error al obtener los planes de estudio", e);
            }
        } else {
            // Si no hay parámetro id_escuela, enviar un error 400
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'id_escuela' es requerido.");
        }
    }
}
