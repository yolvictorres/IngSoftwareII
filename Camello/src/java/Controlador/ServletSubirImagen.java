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
        location = "C:\\Users\\usuario\\Documents\\IngSoftwareII\\Camello\\web\\images"
)

public class ServletSubirImagen extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
     */
    private static final String UPLOAD_DIR = "images";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        DAOPersona daop = new DAOPersona();
        DAOEmpresa daoe = new DAOEmpresa();
        String uploadFilePath = "C:\\Users\\usuario\\Documents\\IngSoftwareII\\Camello\\web" + File.separator + UPLOAD_DIR;
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());
        Persona persona = new Persona();
        Empresa empresa = new Empresa();
        String fileName = null;
        String idEmpresa = (request.getParameter("idEmpresa"));
        String idPersona = (request.getParameter("idPersona"));
        String f = "";
      
        if (idEmpresa != null) {
             for (Part part : request.getParts()) {
            if (fileName == null) {
                fileName = getFileName(part);
                char[] ar = fileName.toCharArray();
                int n = ar.length - 4;
                for (int i = n; i < ar.length; i++) {
                    f = f + Character.toString(ar[i]);
                }
                part.write("img" + idEmpresa + f);
            }
        }
            empresa.setRutaLogo(UPLOAD_DIR + "\\" + "img" + idEmpresa + f);
            empresa.setIdEmpresa(Integer.parseInt(idEmpresa));
            daoe.subirImagen(empresa);
            request.setAttribute("message", fileName + " File uploaded successfully!");
            getServletContext().getRequestDispatcher("/completarEmpresa.jsp?id=" + idEmpresa).forward(request, response);
        } else {
             for (Part part : request.getParts()) {
            if (fileName == null) {
                fileName = getFileName(part);
                char[] ar = fileName.toCharArray();
                int n = ar.length - 4;
                for (int i = n; i < ar.length; i++) {
                    f = f + Character.toString(ar[i]);
                }
                part.write("img" + idPersona + f);
            }
        }
            persona.setRutaFoto(UPLOAD_DIR + "\\" + "img" + idPersona + f);
            persona.setIdPersona(Integer.parseInt(idPersona));
            daop.subirImagen(persona);
            request.setAttribute("message", fileName + " File uploaded successfully!");
            getServletContext().getRequestDispatcher("/completarPersona.jsp?id=" + idPersona).forward(request, response);
        }

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
