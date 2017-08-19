<%-- 
    Document   : detallesEmpleo
    Created on : 18-ago-2017, 20:29:04
    Author     : IAN
--%>

<%@page import="Modelo.Jornada"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Empleo"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOEmpleo"%>
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
        <link href="css/modern-business.css" rel="stylesheet">
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
        <%
            if (sesion.getAttribute("idEmpresa") != null) {
        %>

        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <center><h1>Detalles del empleo</h1></center>

            <%
                DAOEmpleo daoem = new DAOEmpleo();
                Empleo empl = new Empleo();
                empl.setIdEmpleo(Integer.parseInt(request.getParameter("id")));
                List<Empleo> y = daoem.consultarId(empl.getIdEmpleo());
                for (Empleo empleo : y) {
            %>  
            <table class="table table-bordered">
                <thead>                
                <th>Empresa</th>
                </thead>
                <tbody>                
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarId(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=empresa.getNombreEmpresa()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Ciudad</th>
                </thead>
                <tbody>                
                    <%
                        Consultas cons = new Consultas();
                        List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                        for (Ciudad ciudad : z) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=ciudad.getNombreCiudad()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Jornada</th>
                </thead>
                <tbody>                
                    <%
                        List<Jornada> j = cons.consultarJornadaId(empleo.getIdCiudad());
                        for (Jornada jornada : j) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=jornada.getNombreJornada()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Detalles</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getDetalles()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Cargo</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getCargo()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Experiencia Requerida</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getExperiencia()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <%  }%>
        </div>
        <div class="col-md-2">
        </div>

        <%
            }
            if (sesion.getAttribute("idPersona") != null) {
        %>

        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <center><h1>Detalles del empleo</h1></center>

            <%
                DAOEmpleo daoem = new DAOEmpleo();
                Empleo empl = new Empleo();
                empl.setIdEmpleo(Integer.parseInt(request.getParameter("id")));
                List<Empleo> y = daoem.consultarId(empl.getIdEmpleo());
                for (Empleo empleo : y) {
            %>  
            <table class="table table-bordered">
                <thead>                
                <th>Empresa</th>
                </thead>
                <tbody>                
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarId(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=empresa.getNombreEmpresa()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Ciudad</th>
                </thead>
                <tbody>                
                    <%
                        Consultas cons = new Consultas();
                        List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                        for (Ciudad ciudad : z) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=ciudad.getNombreCiudad()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Jornada</th>
                </thead>
                <tbody>                
                    <%
                        List<Jornada> j = cons.consultarJornadaId(empleo.getIdCiudad());
                        for (Jornada jornada : j) {
                    %>
                    <tr><center>      
                    <td><center><a ><%=jornada.getNombreJornada()%></a></center></td>
                        <%  }%>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Detalles</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getDetalles()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Cargo</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getCargo()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <table class="table table-bordered">
                <thead>                
                <th>Experiencia Requerida</th>
                </thead>
                <tbody>                
                    <tr><center>      
                    <td><center><a ><%=empleo.getExperiencia()%></a></center></td>
                    </tr>              
                    </tbody> 
            </table>
            <%  }%>
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
