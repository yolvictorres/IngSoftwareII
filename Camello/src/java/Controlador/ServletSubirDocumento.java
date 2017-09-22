/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Acceso.DAOEmpresa;
import Acceso.DAOPersona;
import Modelo.Empresa;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Modelo.Persona;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100,// 100 MB
        location = "C:\\Users\\IAN\\Documents\\IngSoftwareIIS\\Camello\\web\\documentos"
)

public class ServletSubirDocumento extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
     */
    private static final String UPLOAD_DIR = "documentos";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        DAOPersona daop = new DAOPersona();
        String uploadFilePath = "C:\\Users\\IAN\\Documents\\IngSoftwareIIS\\Camello\\web" + File.separator + UPLOAD_DIR;
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());
        Persona persona = new Persona();
        String fileName = null;
        String idPersona = (request.getParameter("idPersona"));

        for (Part part : request.getParts()) {
            if (fileName == null) {
                fileName = getFileName(part);
                part.write(idPersona+fileName);
            }
        }
            persona.setRutaHojadevida(UPLOAD_DIR + "/" + idPersona+fileName);
            persona.setIdPersona(Integer.parseInt(idPersona));
            daop.subirDocumento(persona);
            request.setAttribute("message", fileName + " File uploaded successfully!");
            getServletContext().getRequestDispatcher("/completarPersona.jsp?id=" + idPersona).forward(request, response);

    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
