/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.Consultas;
import Modelo.Empresa;
import Modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IAN
 */
public class ServletConsultas extends HttpServlet {

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
            
            Consultas cons = new Consultas();
            Empresa empresa = new Empresa();
            Persona persona = new Persona();
            List<Persona> per = new ArrayList<>();
            List<Empresa> empr = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            try {
                if (request.getParameter("btniniciar") != null) {
                    HttpSession sesion = request.getSession(true);
                    String correo = request.getParameter("correo");
                    String clave = request.getParameter("clave");
                    empresa.setCorreoEmpresa(correo);
                    empresa.setClaveEmpresa(clave);
                    List<Empresa> x = cons.validarEmpresa(empresa);
                    persona.setCorreoPersona(correo);
                    persona.setClavePersona(clave);
                    List<Persona> z = cons.validarPersona(persona);
                    if (x.size() > 0) {
                        for (Empresa e : x) {
                            sesion.setAttribute("nombre", e.getNombreEmpresa());
                            sesion.setAttribute("id", e.getIdEmpresa());
                        }
                        response.sendRedirect("inicio.jsp");
                    } 
                    if (z.size() > 0) {
                        for (Persona p : z) {
                            sesion.setAttribute("nombre", p.getNombresPersona());
                            sesion.setAttribute("id", p.getIdPersona());
                        }
                        response.sendRedirect("inicio.jsp");
                    } else {
                        out.println("<!DOCTYPE html>");
                        out.println("<script type='text/javascript'>  alert('El usuario no existe. o la contraseña es incorrecta!');</script>");
                        out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/Camello/index.jsp'>");
                    }
                }
            } catch (IOException | NumberFormatException e) {

            }

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
