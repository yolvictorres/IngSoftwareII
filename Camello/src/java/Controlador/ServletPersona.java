/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.DAOPersona;
import Modelo.Amigos;
import Modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IAN
 */
@WebServlet(name = "ServletPersona", urlPatterns = {"/ServletPersona"})
public class ServletPersona extends HttpServlet {

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
            Amigos amigos = new Amigos();
            List<Persona> per = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            try {
                if (request.getParameter("crearPersona") != null) {
                    persona.setIdPersona(Integer.parseInt(request.getParameter("cedula")));
                    persona.setNombresPersona(request.getParameter("nombres"));
                    persona.setApellidosPersona(request.getParameter("apellidos"));
                    persona.setCorreoPersona(request.getParameter("correo"));
                    persona.setClavePersona(request.getParameter("clave"));
                    respuesta = dao.crear(persona);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("registroPersona.jsp");
                } else if (request.getParameter("editarPersona") != null) {
                    persona.setIdPersona(Integer.parseInt(request.getParameter("idPersona")));
                    persona.setNombresPersona(request.getParameter("nombres"));
                    persona.setApellidosPersona(request.getParameter("apellidos"));
                    persona.setCorreoPersona(request.getParameter("correo"));
                    persona.setTelefono(Integer.parseInt(request.getParameter("telefono")));
//                    SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");
//                    persona.setEdad(format.parse(request.getParameter("edad")));
                    respuesta = dao.editar(persona);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("inicio.jsp");
                } else if(request.getParameter("AmigoS") != null){
                    amigos.setEstado(Integer.parseInt(request.getParameter("EstadoS")));
                    amigos.setNotificacion(Integer.parseInt(request.getParameter("Notificacion")));
                    amigos.setIdPersona(Integer.parseInt(request.getParameter("idPersona")));
                    amigos.setIdAmigo(Integer.parseInt(request.getParameter("idAmigo")));
                    respuesta = dao.solicitarUnirseAMiRed(amigos);                    
                    request.setAttribute("respuestasol", respuesta);
                    rd = request.getRequestDispatcher("buscarpersonas.jsp");
                } else if(request.getParameter("EstadoAmigo") != null){
                    amigos.setEstado(Integer.parseInt(request.getParameter("EstadoS")));
                    amigos.setIdPersona(Integer.parseInt(request.getParameter("idPersona")));
                    amigos.setIdAmigo(Integer.parseInt(request.getParameter("idAmigo")));
                    respuesta = dao.EstadoAmigo(amigos);                    
                    request.setAttribute("respuestaamigo", respuesta);
                    rd = request.getRequestDispatcher("solicitudespendientes.jsp");
                }else if(request.getParameter("NotVista") != null){
                    amigos.setNotificacion(Integer.parseInt(request.getParameter("NotiSol")));
                    amigos.setIdPersona(Integer.parseInt(request.getParameter("idPersona")));
                    amigos.setIdAmigo(Integer.parseInt(request.getParameter("idAmigo")));
                    respuesta = dao.notificacionVista(amigos);                    
                    request.setAttribute("respuestaamigo", respuesta);
                    rd = request.getRequestDispatcher("notificaciones.jsp");
                }
            } catch (NumberFormatException e) {

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
