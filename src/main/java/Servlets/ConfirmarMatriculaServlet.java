/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.Alumno;
import Javas.ConexionDB;
import Javas.CursoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "ConfirmarMatriculaServlet", urlPatterns = {"/ConfirmarMatriculaServlet"})
public class ConfirmarMatriculaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros enviados desde el formulario
        String idPersona = request.getParameter("idPersona");
        String[] cursosSeleccionados = request.getParameterValues("cursosSeleccionados");

        if (idPersona == null || cursosSeleccionados == null || cursosSeleccionados.length == 0) {
            response.sendRedirect("error.jsp?mensaje=Datos inválidos.");
            return;
        }

        // Fecha de matrícula
        Date fechaMatricula = new Date(); // Puedes personalizar la fecha si lo necesitas.

        try (Connection conn = ConexionDB.obtenerConexion()) {
            // Insertar cada curso seleccionado en la tabla Matricula
            String sql = "INSERT INTO Matricula (id_alumno, id_seccion, id_periodo, fecha_matricula) "
                       + "VALUES (?, ?, (select ID from periodo order by ID DESC FETCH FIRST 1 ROWS ONLY), ?)";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                // Preparar el statement para insertar los datos
                for (String idSeccion : cursosSeleccionados) {
                    ps.setInt(1, Integer.parseInt(idPersona)); // Asignar el id_alumno
                    ps.setInt(2, Integer.parseInt(idSeccion)); // Asignar el id_seccion
                    ps.setDate(3, new java.sql.Date(fechaMatricula.getTime())); // Fecha actual de matrícula

                    // Ejecutar la inserción
                    ps.addBatch();
                }

                // Ejecutar el batch
                int[] resultados = ps.executeBatch();
                // Si el resultado de la ejecución es exitoso, obtener los detalles de los cursos
                if (resultados.length > 0) {
                    // Obtener detalles del alumno
                    String sqlAlumno = "SELECT a.id_alumno, a.id_persona, a.id_plan, p.nombre, p.apellido, p.dni, p.email "
                                       + "FROM Alumnos a "
                                       + "JOIN Dato_Personales p ON a.id_persona = p.id_persona "
                                       + "WHERE a.id_alumno = ?";
                    try (PreparedStatement psAlumno = conn.prepareStatement(sqlAlumno)) {
                        psAlumno.setInt(1, Integer.parseInt(idPersona));
                        ResultSet rsAlumno = psAlumno.executeQuery();
                        if (rsAlumno.next()) {
                            Alumno alumno = new Alumno(
                                rsAlumno.getInt("id_alumno"),
                                rsAlumno.getString("nombre"),
                                rsAlumno.getString("apellido"),
                                rsAlumno.getString("email"),
                                rsAlumno.getString("dni"),
                                rsAlumno.getInt("id_plan")
                            );

                            // Guardar el alumno en el request
                            request.setAttribute("alumno", alumno);

                            // Obtener los cursos matriculados
                            List<CursoDTO> cursosSeleccionadosDTO = new ArrayList<>();
                            for (String idSeccion : cursosSeleccionados) {
                                // Obtener los datos del curso a partir de idSeccion
                                String sqlCurso = "SELECT c.id_curso, c.nombre_curso, c.codigo_curso, c.creditos, s.codigo_seccion "
                                                  + "FROM Cursos c "
                                                  + "JOIN Seccion s ON c.id_curso = s.id_curso "
                                                  + "WHERE s.id_seccion = ?";
                                try (PreparedStatement psCurso = conn.prepareStatement(sqlCurso)) {
                                    psCurso.setInt(1, Integer.parseInt(idSeccion));
                                    ResultSet rsCurso = psCurso.executeQuery();
                                    if (rsCurso.next()) {
                                        CursoDTO curso = new CursoDTO(
                                            rsCurso.getInt("id_curso"),
                                            rsCurso.getString("nombre_curso"),
                                            rsCurso.getString("codigo_curso"),
                                            rsCurso.getInt("creditos"),
                                            rsCurso.getString("codigo_seccion")
                                        );
                                        cursosSeleccionadosDTO.add(curso);
                                    }
                                }
                            }

                            // Guardar los cursos seleccionados en el request
                            request.setAttribute("cursosSeleccionados", cursosSeleccionadosDTO);

                            // Redirigir al JSP de matrícula exitosa
                            request.getRequestDispatcher("matriculaexitosa.jsp").forward(request, response);
                        }
                    }
                } else {
                    response.sendRedirect("error.jsp?mensaje=Error al registrar la matrícula.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?mensaje=Error al registrar la matrícula.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?mensaje=Error de conexión con la base de datos.");
        }
    }
}
