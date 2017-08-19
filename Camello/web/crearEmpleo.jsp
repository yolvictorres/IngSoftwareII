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
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Crear Empleo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link href="css/modern-business.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <% if (request.getAttribute("respuesta") != null) {%>
        <meta http-equiv="refresh" content="3;URL=empleos.jsp">
        <% }%>
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
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="inicio.jsp"><img  class="navbar-brand" src="images/camello.png" style="width: 11%; height: 11%;"/></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="inicio.jsp">Inicio</a>
                            </li> 
                            <li>
                                <a href="empleos.jsp">Empleos</a>
                            </li>                                                          
                            <li class="dropdown">
                                <% if (sesion.getAttribute("idEmpresa") != null) {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=nombreEmpresa%> <b class="caret"></b></a>
                                    <% } else {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=nombrePersona%> <b class="caret"></b></a>
                                    <% }%>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Ver perfil</a>
                                    </li>
                                    <li>
                                        <a href='Sesioncerrada'>Cerrar Sesion</a>
                                    </li>
                                </ul>
                            </li>                  
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
        </div>
        <%if (request.getAttribute("respuesta") != null) {%>
        <div class="alert alert-success">
           <center> El empleo se creó<strong> exitosamente!</strong> </center>
        </div>
        <b><center>**Espere a que la página se recargue**</center></b> 
                <% }%>
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
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="empleos.jsp" formnovalidate/>
                </div>
            </form>
        </div>

        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
