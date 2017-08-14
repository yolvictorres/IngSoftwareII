/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.DAOPersona;
import Modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
public class ServeltPersona extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            DAOPersona dao = new DAOPersona();
            Persona persona = new Persona();
            List<Persona> per = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
//            try {
//                 if (request.getParameter("btniniciar") != null) {
//                    HttpSession sesion = request.getSession(true);
//                    String u =request.getParameter("usuario");
//                    String contra = request.getParameter("contrasena");
//                    usuario.setUsuario(u);
//                    usuario.setContra(contra);
//                    List<usuarios> y = dao.autenticar(usuario);
//                    if (y.size() > 0) {
//                        for (usuarios usu : y) {
//                            sesion.setAttribute("usuario", usu.getUsuario());
//                            sesion.setAttribute("id", usu.getId_usuario());
//                            sesion.setAttribute("nivel", usu.getNivel());
//                        }
//                        response.sendRedirect("index.jsp");
//                    } else {
//                        out.println("<!DOCTYPE html>");
//                        out.println("<script type='text/javascript'>  alert('El usuario no existe. o contraseña incorrecta!');</script>");
//                        out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/FutbolColombia/iniciarSesion.jsp'>");
//                    }
//
//                } 
//            } catch (IOException | NumberFormatException e) {
//
//            }

            rd.forward(request, response);
            
        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
