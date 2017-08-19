<%-- 
    Document   : crearEmpleo
    Created on : 16/08/2017, 03:59:55 PM
    Author     : usuario
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Pais"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Modelo.Jornada"%>
<%@page import="Acceso.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Crear Empleo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String idEmpresa = null, idPersona = null;
            String nombreEmpresa = null, nombrePersona = null;

            if (sesion.getAttribute("idEmpresa") != null && sesion.getAttribute("nombreEmpresa") != null || sesion.getAttribute("idPersona") != null && sesion.getAttribute("nombrePersona") != null) {

                if (sesion.getAttribute("idEmpresa") != null && sesion.getAttribute("nombreEmpresa") != null) {
                    idEmpresa = sesion.getAttribute("idEmpresa").toString();
                    nombreEmpresa = sesion.getAttribute("nombreEmpresa").toString();
                }
                if (sesion.getAttribute("idPersona") != null && sesion.getAttribute("nombrePersona") != null) {
                    idPersona = sesion.getAttribute("idPersona").toString();
                    nombrePersona = sesion.getAttribute("nombrePersona").toString();
                }
            } else {
                out.print("<script>location.replace('index.jsp');</script>");
            }
        %>
        <div>
            <nav class="navbar-inverse">
                <div class="container" style="position: relative; width: 30%; right: 30%;">
                    <div>
                        <img src="images/camello.png" style="width: 30%; height: 25%;"/>
                    </div>
                </div>
            </nav>
        </div>
        <div class="jumbotron boxlogin">
            <h2 class="col-lg-12 registerSection">Crear Empleo</h2>
            <form action="ServletEmpleo" method="post" id="crearEmpl" name="crearEmpl">
                <center><label>Formulario Empleo</label></center><br>
                <div>
                    <select name="idCiudad" form="crearEmpl" class="form-control inputSection">                       
                        <%                            
                            int a = 1, b = 999999999;
                            double idEmpre = Math.round(Math.random() * (b - a) + (a));
                            int idEmpr = (int) idEmpre;
                            Consultas cons = new Consultas();
                            List<Ciudad> ciu = cons.consultarCiudad();
                            for (Ciudad c : ciu) {
                        %>  
                        <option value="<%=c.getIdCiudad()%>"><%=c.getNombreCiudad()%></option>                      
                        <% }%>
                    </select>
                </div>
                <div>
                    <select name="idJornada" form="crearEmpl" class="form-control inputSection">                       
                        <%
                            List<Jornada> jor = cons.consultarJornada();
                            for (Jornada j : jor) {
                        %>  
                        <option value="<%=j.getIdJornada()%>"><%=j.getNombreJornada()%></option>                      
                        <% }%>
                    </select>
                </div>
                <div><input type="hidden" name="idEmpleo" value="<%=idEmpr%>" class="form-control inputSection"/></div>
                <div><input type="hidden" name="idEmpresa" value="<%=sesion.getAttribute("idEmpresa").toString()%>" class="form-control inputSection"/></div>
                <div><input name="detalles" placeholder="Detalles" class="form-control inputSection" type="text" required=""/></div>
                <div><input name="cargo" placeholder="Cargo" class="form-control inputSection" type="text" required=""/></div>
                <div><input name="experiencia" placeholder="Experiencia requerida" class="form-control inputSection" type="text" required=""/></div>
                <div>
                    <input type="submit" value="Crear" class="btn btn-success" name="crearEmpleo"/>
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="inicio.jsp" formnovalidate/>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   


    </body>
</html>
