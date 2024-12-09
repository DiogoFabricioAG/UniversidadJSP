package Servlets;

import Javas.ConexionDB;
import Javas.Escuela;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EscuelaServlet", urlPatterns = {"/EscuelaServlet"})
public class EscuelaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idFacultadParam = request.getParameter("id_facultad");
        int idFacultad = 0;

        if (idFacultadParam != null && !idFacultadParam.isEmpty()) {
            try {
                idFacultad = Integer.parseInt(idFacultadParam);
            } catch (NumberFormatException e) {
                throw new ServletException("ID de facultad no válido", e);
            }
        }

        List<Escuela> escuelas = new ArrayList<>();
        
        String sql = "SELECT * FROM Escuela WHERE id_facultad = ?";

        try (Connection conn = ConexionDB.obtenerConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, idFacultad); 
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Escuela escuela = new Escuela(
                    rs.getInt("id_escuela"),        
                    rs.getString("nombre_escuela"), 
                    rs.getInt("id_facultad")        
                );
                escuelas.add(escuela);
            }

            request.setAttribute("escuelas", escuelas);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/listaescuelas.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al obtener las escuelas", e);
        }
    }
}
