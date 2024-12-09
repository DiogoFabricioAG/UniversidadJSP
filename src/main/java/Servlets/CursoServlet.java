package Servlets;

import Javas.ConexionDB;
import Javas.Curso;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Curso> cursos = new ArrayList<>();

        // Obtener el parámetro id_plan desde la URL
        String idPlanParam = request.getParameter("id_plan");

        if (idPlanParam != null) {
            int idPlan = Integer.parseInt(idPlanParam);

            // Consulta SQL para obtener cursos filtrados por id_plan
            String sql = "SELECT * FROM Cursos WHERE id_plan = ?";

            try (Connection conn = ConexionDB.obtenerConexion();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, idPlan); // Establecer parámetro en la consulta

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Curso curso = new Curso(
                        rs.getInt("id_curso"),          // idCurso
                        rs.getString("nombre_curso"),   // nombreCurso
                        rs.getString("codigo_curso"),   // codigoCurso
                        rs.getInt("id_plan"),           // idPlan
                        rs.getInt("creditos")           // creditos
                    );
                    cursos.add(curso);
                }

                request.setAttribute("cursos", cursos);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/listacursos.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error al obtener los cursos", e);
            }
        } else {
            // Si no se proporciona id_plan, mostrar un mensaje de error
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'id_plan' es requerido.");
        }
    }
}
