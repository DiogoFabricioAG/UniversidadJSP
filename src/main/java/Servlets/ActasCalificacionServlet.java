/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.ActaCalificacionDTO;
import Javas.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diogo
 */
@WebServlet(name = "ActasCalificacionServlet", urlPatterns = {"/ActasCalificacionServlet"})
public class ActasCalificacionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCodigo = request.getParameter("id_codigo");
        String dni = request.getParameter("dni");

        if (idCodigo == null || dni == null || idCodigo.isEmpty() || dni.isEmpty()) {
            response.sendRedirect("error.jsp?mensaje=Datos inválidos.");
            return;
        }

        try (Connection conn = ConexionDB.obtenerConexion()) {
            // Consulta para obtener datos del alumno
            String sqlAlumno = "SELECT a.id_alumno, p.nombre, p.apellido, p.dni " +
                              "FROM Alumnos a " +
                              "JOIN Dato_Personales p ON a.id_persona = p.id_persona " +
                              "WHERE a.id_codigo = ? AND p.dni = ?";

            try (PreparedStatement psAlumno = conn.prepareStatement(sqlAlumno)) {
                psAlumno.setString(1, idCodigo);
                psAlumno.setString(2, dni);
                ResultSet rsAlumno = psAlumno.executeQuery();

                if (rsAlumno.next()) {
                    int idAlumno = rsAlumno.getInt("id_alumno");

                    // Consulta para obtener las calificaciones del alumno
                    String sqlActa = "SELECT ac.id_curso, c.nombre_curso, c.codigo_curso, ac.fecha_evaluacion, ac.calificacion, e.nombre AS estado " +
                                     "FROM Acta_Calificacion ac " +
                                     "JOIN Cursos c ON ac.id_curso = c.id_curso " +
                                     "JOIN Estado_Acta e ON ac.estado = e.id " +
                                     "WHERE ac.id_alumno = ?";

                    try (PreparedStatement psActa = conn.prepareStatement(sqlActa)) {
                        psActa.setInt(1, idAlumno);
                        ResultSet rsActa = psActa.executeQuery();

                        List<ActaCalificacionDTO> actasCalificaciones = new ArrayList<>();
                        while (rsActa.next()) {
                            ActaCalificacionDTO acta = new ActaCalificacionDTO(
                                rsActa.getInt("id_curso"),
                                rsActa.getString("nombre_curso"),
                                rsActa.getString("codigo_curso"),
                                rsActa.getString("fecha_evaluacion"),
                                rsActa.getDouble("calificacion"),
                                rsActa.getString("estado")
                            );
                            actasCalificaciones.add(acta);
                        }

                        // Pasar datos al JSP
                        request.setAttribute("nombreAlumno", rsAlumno.getString("nombre") + " " + rsAlumno.getString("apellido"));
                        request.setAttribute("dniAlumno", rsAlumno.getString("dni"));
                        request.setAttribute("actasCalificaciones", actasCalificaciones);
                        request.getRequestDispatcher("actacalificacion.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("error.jsp?mensaje=Alumno no encontrado.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?mensaje=Error de base de datos.");
        }
    }
}
