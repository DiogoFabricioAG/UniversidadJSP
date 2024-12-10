/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.Alumno;
import Javas.ConexionDB;
import Javas.CursoDTO;
import java.io.IOException;
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

@WebServlet(name = "MatriculaServlet", urlPatterns = {"/MatriculaServlet"})
public class MatriculaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCodigo = request.getParameter("id_codigo");
        String dni = request.getParameter("dni");

        if (idCodigo == null || dni == null || idCodigo.isEmpty() || dni.isEmpty()) {
            response.sendRedirect("error.jsp?mensaje=Datos inválidos.");
            return;
        }

        try (Connection conn = ConexionDB.obtenerConexion()) {
            String sql = "SELECT a.id_alumno, a.id_plan, p.nombre, p.apellido, p.dni, p.email "
                       + "FROM Alumnos a "
                       + "JOIN Dato_Personales p ON a.id_persona = p.id_persona "
                       + "WHERE a.id_codigo = ? AND p.dni = ?";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, idCodigo);
                ps.setString(2, dni);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    Alumno alumno = new Alumno(
                        rs.getInt("id_alumno"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getInt("id_plan")
                    );

                    request.setAttribute("alumno", alumno);

                    String sqlCursos = "SELECT c.id_curso, c.nombre_curso, c.codigo_curso, c.creditos, s.codigo_seccion "
                                        + "FROM Cursos c "
                                        + "JOIN Seccion s ON c.id_curso = s.id_curso "
                                        + "WHERE c.id_plan = ? "
                                        + "AND c.id_curso NOT IN ("
                                        + "    SELECT ac.id_curso "
                                        + "    FROM Acta_Calificacion ac "
                                        + "    WHERE ac.id_alumno = ? AND ac.calificacion >= 11"
                                        + ") "
                                        + "AND s.id_seccion NOT IN ("
                                        + "    SELECT m.id_seccion "
                                        + "    FROM Matricula m "
                                        + "    WHERE m.id_alumno = ?"
                                        + ") "
                                        + "AND ("
                                        + "    NOT EXISTS ("
                                        + "        SELECT 1 FROM Requisitos r "
                                        + "        WHERE r.id_curso_princ = c.id_curso "
                                        + "        AND r.id_curso_requer NOT IN ("
                                        + "            SELECT ac.id_curso "
                                        + "            FROM Acta_Calificacion ac "
                                        + "            WHERE ac.id_alumno = ? AND ac.calificacion >= 11"
                                        + "        )"
                                        + "    )"
                                        + ")";

                    try (PreparedStatement psCursos = conn.prepareStatement(sqlCursos)) {
                        psCursos.setInt(1, alumno.getIdPlanEstudios());
                        psCursos.setInt(2, alumno.getIdAlumno());  
                        psCursos.setInt(3, alumno.getIdAlumno());  
                        psCursos.setInt(4, alumno.getIdAlumno());  

                        ResultSet rsCursos = psCursos.executeQuery();

                        List<CursoDTO> cursosSecciones = new ArrayList<>();
                        while (rsCursos.next()) {
                            CursoDTO cursoSeccion = new CursoDTO(
                                rsCursos.getInt("id_curso"),
                                rsCursos.getString("nombre_curso"),
                                rsCursos.getString("codigo_curso"),
                                rsCursos.getInt("creditos"),
                                rsCursos.getString("codigo_seccion")
                            );
                            cursosSecciones.add(cursoSeccion);
                        }

                        if (cursosSecciones.isEmpty()) {
                            request.setAttribute("mensaje", "No se encontraron cursos disponibles para este plan de estudios.");
                        } else {
                            request.setAttribute("cursosSecciones", cursosSecciones);
                        }

                        request.getRequestDispatcher("matricula.jsp").forward(request, response);
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
