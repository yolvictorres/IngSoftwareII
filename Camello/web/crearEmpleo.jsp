
<%@page import="Modelo.Salario"%>
<%@page import="Modelo.Cargo"%>
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
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
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
        <div class="col-md-2"></div>
        <%if (request.getAttribute("respuesta") != null) {%>
        <div class="alert alert-success">
            <center> El empleo se creó<strong> exitosamente!</strong> </center>
        </div>
        <b><center>**Espere a que la página se recargue**</center></b> 
                <% }%>
        <div class="col-md-8">
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
                    <div>
                        <select name="idCargo" form="crearEmpl" class="form-control inputSection">                       
                            <%
                                List<Cargo> car = cons.consultarCargo();
                                for (Cargo c : car) {
                            %>  
                            <option value="<%=c.getIdCargo()%>"><%=c.getNombreCargo()%></option>                      
                            <% }%>
                        </select>
                    </div>
                    <div>
                        <select name="idSalario" form="crearEmpl" class="form-control inputSection">                       
                            <%
                                List<Salario> sal = cons.consultarSalario();
                                for (Salario s : sal) {
                            %>  
                            <option value="<%=s.getIdSalario()%>"><%=s.getSalario()%></option>                      
                            <% }%>
                        </select>
                    </div>
                    <div><input name="experiencia" placeholder="Experiencia requerida" class="form-control inputSection" type="text" required=""/></div><br>
                    <div>
                        <center><input type="submit" value="Crear" class="btn btn-primary" name="crearEmpleo"/></center>
                        <center><input type="submit" value="Cancelar" class="btn btn-default" formaction="empleos.jsp" formnovalidate/></center>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-2"></div>
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
