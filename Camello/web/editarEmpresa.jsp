
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
        <title>Editar perfil</title>
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
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <center><h1>Editar perfil</h1></center>

            <form action="ServletEmpresa" method="post" id="editarEmpl" name="editarPer">   

                <%
                    DAOEmpresa daoe = new DAOEmpresa();
                    Empresa empresa = new Empresa();
                    List<Empresa> y = daoe.consultarXID(Integer.parseInt(request.getParameter("id")));
                    for (Empresa empr : y) {
                %>  
                <input name="idEmpresa" value="<%=Integer.parseInt(request.getParameter("id"))%>" type="hidden" />    
                <table class="table table-bordered">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><a >Nombre:</a></center></td> 
                    <td class="col-md-4"><center><div><input name="nombre" value="<%=empr.getNombreEmpresa()%>" class="form-control inputSection" type="text" /></div></center></td>                              
                    </tbody> 
                </table>
                <table class="table table-bordered">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><a >Descripcion:</a></center></td> 
                <td class="col-md-4"><center><div><input name="descripcion" value="<%=empr.getDescripcionEmpresa()%>" class="form-control inputSection" type="text" /></div></center></td>                              
                    </tbody> 
                </table>
                <table class="table table-bordered">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><a >Correo Electronico:</a></center></td> 
                    <td class="col-md-4"><center><div><input name="correo" value="<%=empr.getCorreoEmpresa()%>" class="form-control inputSection" type="email" /></div></center></td>                              
                    </tbody> 
                </table>
                <table class="table table-bordered">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><a >Telefono:</a></center></td> 
                    <td class="col-md-4"><center><div><input name="telefono" value="<%=empr.getTelefonoEmpresa()%>" class="form-control inputSection" type="number" /></div></center></td>                              
                    </tbody> 
                </table>

                <div>
                    <input type="submit" value="Guardar" class="btn btn-success" name="editarEmpresa"/>
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="inicio.jsp" formnovalidate/>
                </div>
                <% }%>
            </form>
        </div>
        <div class="col-md-2">
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
