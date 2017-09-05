<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Empleo"%>
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
        <link href="css/modern-business.css" rel="stylesheet">
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
                            <%
                                if (sesion.getAttribute("idPersona") != null) {
                            %>
                            <li>
                                <a href="mired.jsp">Mired</a>
                            </li> 
                            <%
                                }
                            %>

                            <li class="dropdown">
                                <% if (sesion.getAttribute("idEmpresa") != null) {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=nombreEmpresa%> <b class="caret"></b></a>
                                    <% } else {%>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=nombrePersona%> <b class="caret"></b></a>
                                    <% }%>
                                <ul class="dropdown-menu">
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
            <center><h1>Empleos Publicados</h1></center>
                <%if (request.getAttribute("respuesta") != null) {%>
            <div class="alert alert-success">
                <center> El empleo se editó<strong> correctamente!</strong> </center>
            </div>
            <b><center>**Espere a que la página se recargue**</center></b> 

            <% }%>
            <input type="button" name="edit" value="Crear Empleo" class="button" id="button" onclick="location.href = 'crearEmpleo.jsp'">
            <%
                DAOEmpleo daoem = new DAOEmpleo();
                int id = Integer.parseInt(idEmpresa);
                List<Empleo> y = daoem.consultarIdE(id);
                for (Empleo empleo : y) {
            %>
            <table class="table table-bordered">
                <thead>                               
                <th>Cargo</th>
                <th>Ciudad</th>
                <th>Detalles</th>
                <th>Editar</th>
                </thead>
                <tbody>                
                    <tr><center>                                               
                    <td class="col-md-4"><center><a ><%=empleo.getCargo()%></a></center></td> 
                        <%
                            Consultas cons = new Consultas();
                            List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                            for (Ciudad ciudad : z) {
                        %>     
                    <td class="col-md-4"><center><a ><%=ciudad.getNombreCiudad()%></a></center></td>
                        <%  }%>
                    <td class="col-md-1"><input type="button" name="edit" value="Ver" class="button" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    <td class="col-md-1"><input type="button" name="edit" value="Editar" class="button" id="button" onclick="location.href = 'editarEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    </tr>              

                    </tbody> 
            </table>
            <%  }%>
            <%
                if (y.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p> Aún no has publicado empleos, has click en el botón <strong>Crear Empleo</strong> y comienza ahora.</p>            
            </div>            
            <% }%>
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
            <center><h1>Encuentra empleo</h1></center>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="form-control input-lg" placeholder="Buscar" />
                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-sm" type="button">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                DAOEmpleo daoem = new DAOEmpleo();
                List<Empleo> y = daoem.consultar();
                for (Empleo empleo : y) {
            %>
            <table class="table table-bordered">
                <thead>                
                <th>Empresa</th>
                <th>Cargo</th>
                <th>Detalles</th>
                </thead>
                <tbody>  
                    <tr><center>   
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <td class="col-md-5"><center><a ><%=empresa.getNombreEmpresa()%></a></center></td>   
                        <%  }%>
                    <td class="col-md-5"><center><a ><%=empleo.getCargo()%></a></center></td> 
                    <td class="col-md-1"><input type="button" name="edit" value="Ver" class="button" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>  
                    </tr>                                 
                    </tbody> 
            </table>
            <%  }%>
            <%
                if (y.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p> Aún no se han publicado empleos, porfavor vuelve más tarde.</p>            
            </div>            
            <% }%>

            <div class="center-block"> 
                <center>
                    <ul class="pagination pagination-lg">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </center>
            </div>

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