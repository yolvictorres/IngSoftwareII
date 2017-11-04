/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.DAOEmpleo;
import Acceso.DAOPersona;
import Modelo.Empleo;
import Modelo.Persona;
import Modelo.Postulados;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

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
            Postulados postulados = new Postulados();
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
                } else if (request.getParameter("Postularse") != null) {
                    postulados.setCodigoEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    postulados.setCodigoEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
                    postulados.setCodigoPersona(Integer.parseInt(request.getParameter("idPersona")));
                    postulados.setEstadoEnvio(Integer.parseInt(request.getParameter("Estadoe")));
                    postulados.setEstadoPostulados(Integer.parseInt(request.getParameter("Estadop")));
                    postulados.setEstadoNotificacion(Integer.parseInt(request.getParameter("Estadon")));
                    respuesta = dao.postular(postulados);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("empleos.jsp");
                } else if (request.getParameter("AceptarPostulado") != null) {
                    postulados.setEstadoPostulados(Integer.parseInt(request.getParameter("Estadop")));
                    postulados.setCodigoPersona(Integer.parseInt(request.getParameter("idPersona")));
                    postulados.setCodigoEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    postulados.setMensaje(request.getParameter("Mensaje"));
                    respuesta = dao.aceptarPostulado(postulados);
                    request.setAttribute("respuesta", respuesta);
                    postulados.setSmtpServ("smtp.gmail.com");
                    DAOPersona daoper = new DAOPersona();
                    List<Persona> p = daoper.consultarXID(postulados.getCodigoPersona());
                    for (Persona per : p) {
                        if (per.getIdPersona() == postulados.getCodigoPersona()) {
                            postulados.setTo(per.getCorreoPersona());
                        }
                    }
                    System.out.println("correo destino: " + postulados.getTo());
                    postulados.setSubject("Respuesta Postulación");
                    postulados.setFrom("ingsoftware2kl@gmail.com");                  
                    
                    Properties props = System.getProperties();
                    // -- Attaching to default Session, or we could start a new one --
                    props.put("mail.transport.protocol", "smtp");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", postulados.getSmtpServ());
                    props.put("mail.smtp.auth", "true");
                    Authenticator auth = new SMTPAuthenticator();
                    Session session = Session.getInstance(props, auth);
                    // -- Create a new message --
                    Message msg = new MimeMessage(session);
                    // -- Set the FROM and TO fields --
                    msg.setFrom(new InternetAddress(postulados.getFrom()));
                    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(postulados.getTo(), false));
                    msg.setSubject(postulados.getSubject());
                    //msg.setText(postulados.getMensaje());
                    MimeMultipart content = new MimeMultipart("related");
                    // ContentID is used by both parts
                    //String cid = ContentIdGenerator.getContentId();

                    // HTML part
                    MimeBodyPart textPart = new MimeBodyPart();
                    textPart.setText("<html><head>"
                            + "<title>This is not usually displayed</title>"
                            + "</head>\n"
                            + "<body>"
                            + "<div><b>"+postulados.getMensaje()+"</b></div>\n\n"
                            + "<div><img src=\"cid:image"
                            + "\" /></div>\n",
                            "US-ASCII", "html");
                    content.addBodyPart(textPart);

                    // Image part
                    MimeBodyPart imagePart = new MimeBodyPart();
                    imagePart.setContentID("image");
                    imagePart.attachFile("C:\\Users\\diego\\Documents\\IngSoftwareIID\\Camello\\web\\images\\logoCamello.png");
                    imagePart.setDisposition(MimeBodyPart.INLINE);
                    content.addBodyPart(imagePart);

                    msg.setContent(content, "text/html; charset=utf-8");
 
                    // -- Set some other header information --
                    msg.setHeader("MyMail", "Mr. XYZ");
                    msg.setSentDate(new Date());
                    // -- Send the message --
                    Transport.send(msg);
                    System.out.println("Message sent to " + postulados.getTo() + " OK.");
                    rd = request.getRequestDispatcher("postulados.jsp");
                } else if (request.getParameter("RechazarPostulado") != null) {
                    postulados.setSmtpServ("smtp.gmail.com");
                    postulados.setEstadoPostulados(Integer.parseInt(request.getParameter("Estadop")));
                    postulados.setCodigoPersona(Integer.parseInt(request.getParameter("idPersona")));
                    postulados.setCodigoEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    postulados.setMensaje(request.getParameter("Mensaje"));
                    respuesta = dao.aceptarPostulado(postulados);
                    request.setAttribute("respuesta", respuesta);
                    DAOPersona daoper = new DAOPersona();
                    List<Persona> p = daoper.consultarXID(postulados.getCodigoPersona());
                    for (Persona per : p) {
                        if (per.getIdPersona() == postulados.getCodigoPersona()) {
                            postulados.setTo(per.getCorreoPersona());
                        }
                    }
                    System.out.println("correo destino: " + postulados.getTo());
                    postulados.setSubject("Respuesta Postulación");
                    postulados.setFrom("ingsoftware2kl@gmail.com");                    
                    
                    Properties props = System.getProperties();
                    // -- Attaching to default Session, or we could start a new one --
                    props.put("mail.transport.protocol", "smtp");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", postulados.getSmtpServ());
                    props.put("mail.smtp.auth", "true");
                    Authenticator auth = new SMTPAuthenticator();
                    Session session = Session.getInstance(props, auth);
                    // -- Create a new message --
                    Message msg = new MimeMessage(session);
                    // -- Set the FROM and TO fields --
                    msg.setFrom(new InternetAddress(postulados.getFrom()));
                    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(postulados.getTo(), false));
                    msg.setSubject(postulados.getSubject());
                    //msg.setText(postulados.getMensaje());
                    MimeMultipart content = new MimeMultipart("related");
                    // ContentID is used by both parts
                    //String cid = ContentIdGenerator.getContentId();

                    // HTML part
                    MimeBodyPart textPart = new MimeBodyPart();
                    textPart.setText("<html><head>"
                            + "<title>This is not usually displayed</title>"
                            + "</head>\n"
                            + "<body>"
                            + "<div><b>"+postulados.getMensaje()+"</b></div>\n\n"
                            + "<div><img src=\"cid:image"
                            + "\" /></div>\n",
                            "US-ASCII", "html");
                    content.addBodyPart(textPart);

                    // Image part
                    MimeBodyPart imagePart = new MimeBodyPart();
                    imagePart.setContentID("image");
                    imagePart.attachFile("C:\\Users\\diego\\Documents\\IngSoftwareIID\\Camello\\web\\images\\logoCamello.png");
                    imagePart.setDisposition(MimeBodyPart.INLINE);
                    content.addBodyPart(imagePart);

                    msg.setContent(content, "text/html; charset=utf-8");
 

                    // -- Set some other header information --
                    msg.setHeader("MyMail", "Mr. XYZ");
                    msg.setSentDate(new Date());
                    // -- Send the message --
                    Transport.send(msg);
                    System.out.println("Message sent to" + postulados.getTo() + " OK.");
                    rd = request.getRequestDispatcher("postulados.jsp");
                } else if (request.getParameter("NotVista") != null) {
                    postulados.setEstadoNotificacion(Integer.parseInt(request.getParameter("Estadon")));
                    postulados.setCodigoPersona(Integer.parseInt(request.getParameter("idPersona")));
                    postulados.setCodigoEmpleo(Integer.parseInt(request.getParameter("idEmpleo")));
                    respuesta = dao.QuitarNotificacion(postulados);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("notificaciones.jsp");
                }
            } catch (Exception e) {
                System.out.println("Exception " + e);
                out.println("Exception " + e);
            }

            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println("Exception " + e);
        }
    }
// Also include an inner class that is used for authentication purposes

    private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = "ingsoftware2kl@gmail.com";           // specify your email id here (sender's email id)
            String password = "sebyoldie";                                      // specify your password here
            return new PasswordAuthentication(username, password);
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
