/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Javas.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Javas.Facultad;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;


@WebServlet(name = "FacultadServlet", urlPatterns = {"/FacultadServlet"})
public class FacultadServlet extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Facultad> facultades = new ArrayList<>();
        String sql = "SELECT * FROM Facultad";

        try (Connection conn = ConexionDB.obtenerConexion()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                Facultad facultad = new Facultad(
                    rs.getInt("id_facultad"),
                    rs.getString("nombre_facultad")
                );
                facultades.add(facultad);
            }
            
            request.setAttribute("productos", facultades);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/listafacultades.jsp");
            dispatcher.forward(request, response);
        }
        catch(SQLException e){
            e.printStackTrace();
            throw new ServletException("Error al obtener las Facultades", e);

        }
    }

    
}
