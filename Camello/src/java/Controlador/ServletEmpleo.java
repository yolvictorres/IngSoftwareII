/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.DAOEmpleo;
import Modelo.Empleo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
@WebServlet(name = "ServletEmpleo", urlPatterns = {"/ServletEmpleo"})
public class ServletEmpleo extends HttpServlet {

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
            DAOEmpleo dao = new DAOEmpleo();
            Empleo empleo = new Empleo();
            List<Empleo> empl = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            try {
                if (request.getParameter("crearEmpleo") != null) {
                    empleo.setIdEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    empleo.setIdEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
                    empleo.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
                    empleo.setIdJornada(Integer.parseInt(request.getParameter("idJornada")));
                    empleo.setDetalles(request.getParameter("detalles"));
                    empleo.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
                    empleo.setIdSalario(Integer.parseInt(request.getParameter("idSalario")));
                    empleo.setExperiencia(request.getParameter("experiencia"));
                    respuesta = dao.crear(empleo);
                    request.setAttribute("respuestac", respuesta);
                    rd = request.getRequestDispatcher("empleos.jsp");
                } else if (request.getParameter("editarEmpleo") != null) {
                    empleo.setIdEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    empleo.setIdEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
                    empleo.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
                    empleo.setIdJornada(Integer.parseInt(request.getParameter("idJornada")));
                    empleo.setDetalles(request.getParameter("detalles"));
                    empleo.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
                    empleo.setIdSalario(Integer.parseInt(request.getParameter("idSalario")));
                    empleo.setExperiencia(request.getParameter("experiencia"));
                    respuesta = dao.editar(empleo);
                    request.setAttribute("respuestae", respuesta);
                    rd = request.getRequestDispatcher("empleos.jsp");
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
