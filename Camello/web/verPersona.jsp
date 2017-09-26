<%@page import="Acceso.DAOPersona"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Empleos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
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
        %>
        <div class="col-md-2">
        </div>
        <div class="col-md-8">

            <%
                DAOPersona daop = new DAOPersona();
                Persona persona = new Persona();
                persona.setIdPersona(Integer.parseInt(request.getParameter("id")));
                List<Persona> y = daop.consultarXID(persona.getIdPersona());
                for (Persona person : y) {
                    if (person.getRutaFoto() == null) {
            %>           
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="images/persona.png" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div>
            <% } else {%>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="<%=person.getRutaFoto()%>" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div>
            <% }%>

            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Nombres:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getNombresPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Apellidos:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getApellidosPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Correo Electronico:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getCorreoPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Telefono:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getTelefono()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Fecha de nacimiento:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getEdad()%></a></center></td>                              
                </tbody> 
            </table>
            <%
                }
            %>
        </div>
        <div class="col-md-2">
        </div>
        <%
        } else if (sesion.getAttribute("idPersona") != null) {
        %>

        <div class="col-md-2">
        </div>
        <div class="col-md-8">                                      
            <%
                DAOPersona daop = new DAOPersona();
                Persona persona = new Persona();
                persona.setIdPersona(Integer.parseInt(request.getParameter("id")));
                List<Persona> y = daop.consultarXID(persona.getIdPersona());
                for (Persona person : y) {
                    if (person.getRutaFoto() == null) {
            %>           
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="images/persona.png" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div>
            <% } else {%>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="<%=person.getRutaFoto()%>" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div>
            <% }%>

            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Nombres:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getNombresPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Apellidos:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getApellidosPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Correo Electronico:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getCorreoPersona()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Telefono:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getTelefono()%></a></center></td>                              
                </tbody> 
            </table>
            <table class="table table-bordered">
                <tbody>                
                    <tr>
                        <td class="col-md-2"><center><a >Fecha de nácimiento:</a></center></td> 
                <td class="col-md-4"><center><a ><%=person.getEdad()%></a></center></td>                              
                </tbody> 
            </table>
            <center>                         
                <input type="button" name="edit" value="Hoja de vida" class="btn btn-primary active" id="button" onclick="javascipt:window.open('<%=person.getRutaHojadevida()%>');">
            </center>
            <%
                }
            %>
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
