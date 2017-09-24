
<%@page import="Modelo.Jornada"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Persona"%>
<%@page import="Acceso.DAOPersona"%>
<%@page import="Modelo.Empleo"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Completar perfil</title>
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
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <center><h1>Completar perfil</h1></center>
                <%
                    DAOPersona daop = new DAOPersona();
                    Persona persona = new Persona();
                    persona.setIdPersona(Integer.parseInt(request.getParameter("id")));
                    List<Persona> y = daop.consultarXID(persona.getIdPersona());
                    for (Persona person : y) {
                        if (person.getRutaFoto() == null) {
                %>
            <form  enctype="multipart/form-data" action="ServletSubirImagen" method="post" id="completarEmpl" name="completarPer">   
                <label>Seleccione una imagen de perfil: </label><br>
                <input type="file" name="fileName"> 
                <input name="idPersona" value="<%=Integer.parseInt(request.getParameter("id"))%>" type="hidden" />
                <div>
                    <input type="submit" value="Guardar imagen" class="btn btn-success" name="SubirFoto"/>
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="inicio.jsp" formnovalidate/>
                </div>
            </form>
            <%
            } else {
            %>
            <div class="panel-heading">
               <input type="button" name="edit" value="Imagen guardada" class="btn btn-primary disabled" id="button" onclick="location.href = ">
            </div>
            
            <%
                }
                if (person.getRutaHojadevida() == null) {
            %>
            <form  enctype="multipart/form-data" action="ServletSubirDocumento" method="post" >   
                <label>Seleccione el documento de su hoja de vida en pdf: </label><br>
                <input type="file" name="fileName"> 
                <input name="idPersona" value="<%=Integer.parseInt(request.getParameter("id"))%>" type="hidden" />
                <div>
                    <input type="submit" value="Guardar" class="btn btn-success" name="SubirDocumento"/>
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="inicio.jsp" formnovalidate/>
                </div>
            </form>
            <% } else {

            %>
            <br>
            
             <div>
                <input type="button" name="edit" value="Documento guardado" class="btn btn-primary disabled" id="button" onclick="location.href = ">
            </div>          
            <%        }
                }
            %>

        </div>
        <div class="col-md-2">
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
