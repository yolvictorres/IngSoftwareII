<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
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
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="inicio.jsp">Camello</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="inicio.jsp"><i class="pe-7s-home pe-2x pe-va"></i></a>
                            </li> 
                            <li>
                                <a href="empleos.jsp"><i class="pe-7s-portfolio pe-2x pe-va"></i></a>
                            </li>   
                            <%
                                if (sesion.getAttribute("idPersona") != null) {
                            %>
                            <li>
                                <a href="mired.jsp"><i class="pe-7s-users pe-2x pe-va"></i></a>
                            </li> 
                            <li>
                                <a href="notificaciones.jsp"><i class="pe-7s-bell pe-2x pe-va"></i></a>
                            </li> 
                            <%
                            } else {
                            %>
                            <li>    
                                <a href="postulados.jsp"><i class="pe-7s-note2 pe-2x pe-va"></i></a> 
                            </li>
                            <%
                                }
                            %>
                            <li class="dropdown ">
                                <% if (sesion.getAttribute("idEmpresa") != null) {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true"><i class="pe-7s-user pe-2x pe-va"></i> <%=nombreEmpresa%><span class="caret"></span></a>
                                    <% } else {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true"><i class="pe-7s-user pe-2x pe-va"></i> <%=nombrePersona%><span class="caret"></span></a>
                                    <% }%>
                                <ul class="dropdown-menu" role="menu">
                                    <%
                                        if (sesion.getAttribute("idPersona") != null) {
                                    %>

                                    <li>
                                        <a onclick="location.href = 'verPersona.jsp?id=' + (<%=idPersona%>);">Ver perfil</a>
                                    </li>
                                    <li>
                                        <a onclick="location.href = 'editarPersona.jsp?id=' + (<%=idPersona%>);">Editar perfil</a>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li>
                                        <a onclick="location.href = 'verEmpresa.jsp?id=' + (<%=idEmpresa%>);">Ver perfil</a>
                                    </li>
                                    <li>
                                        <a onclick="location.href = 'editarEmpresa.jsp?id=' + (<%=idEmpresa%>);">Editar perfil</a>
                                    </li>
                                    <%
                                        }
                                    %>
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
        <%
            if (sesion.getAttribute("idEmpresa") != null) {
                DAOEmpresa empresa = new DAOEmpresa();
                List<Empresa> empr = empresa.consultarXID(Integer.parseInt(idEmpresa));
        %>
        <div class="col-md-2">
            <div class="well">
                <%
                    for (Empresa e : empr) {
                        if (e.getRutaLogo() == null) {
                %>
                <input type="button" name="edit" value="Completar perfil" class="btn btn-primary active" id="button" onclick="location.href = 'completarEmpresa.jsp?id=' + (<%=idEmpresa%>);">                     
                <% } else {
                %>
                <input type="button" name="edit" value="Perfil completo" class="btn btn-primary disabled" id="button" onclick="location.href = ">
                <%
                        }
                    }%>
            </div>
        </div>
        <div class="col-md-8">
            <center><h1>Bienvenido <%=nombreEmpresa%></h1></center>
        </div>
        <div class="col-md-2">
        </div>




        <%
            }
            if (sesion.getAttribute("idPersona") != null) {
                DAOPersona persona = new DAOPersona();
                List<Persona> per = persona.consultarXID(Integer.parseInt(idPersona));
        %>
        <div class="col-md-2">   
            <div class="well">
                <%
                    for (Persona p : per) {
                        if (p.getRutaFoto() == null | p.getRutaHojadevida() == null) {
                %>
                <input type="button" name="edit" value="Completar perfil" class="btn btn-primary active" id="button" onclick="location.href = 'completarPersona.jsp?id=' + (<%=idPersona%>);">                     
                <% } else {
                %>
                <input type="button" name="edit" value="Perfil completo" class="btn btn-primary disabled" id="button" onclick="location.href = ">
                <%
                        }
                    }%>
            </div>
        </div>
        <div class="col-md-8">
            <center><h1>Bienvenido <%=nombrePersona%></h1></center>
        </div>
        <div class="col-md-2">
        </div>


        <%
            }
        %>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
