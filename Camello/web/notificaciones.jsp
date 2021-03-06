<%@page import="Modelo.Amigos"%>
<%@page import="Modelo.Postulados"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Notificaciones</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <% if (request.getAttribute("respuesta") != null) {%>
        <meta http-equiv="refresh" content="1;URL=notificaciones.jsp">        
        <% }%>  
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />      
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">      
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css"> 
        <link rel="stylesheet" type="text/css" href="TableFilter/filtergrid.css">
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" language="javascript" src="TableFilter/tablefilter.js"></script>        
        <script type="text/javascript" src="js/bootstrap.min.js"></script>  
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
                        <input type="image" src="images/logoCamello.png" style="width:80%; height:100%; padding-top:5%" formaction="inicio.jsp" />
                        <!--<a class="navbar-brand" href="inicio.jsp">Camello</a>-->
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li >
                                <a href="inicio.jsp"><i class="pe-7s-home pe-2x pe-va"></i></a>
                            </li> 
                            <li>
                                <a href="empleos.jsp"><i class="pe-7s-portfolio pe-2x pe-va"></i></a>                                                                 
                            </li>   
                            <%                                if (sesion.getAttribute("idPersona") != null) {
                            %>
                            <li>
                                <a href="mired.jsp"><i class="pe-7s-users pe-2x pe-va">
                                        <%DAOPersona daop = new DAOPersona();
                                            int idPerson = (Integer.parseInt(idPersona));
                                            int SolicitudesP = daop.numeroSolicitudesPendientes(idPerson, 0);
                                            if (SolicitudesP != 0) {
                                        %>
                                        <span class="badge red"><%=SolicitudesP%></span>  
                                        <% }%>
                                    </i></a>
                            </li> 
                            <li>    
                                <a href="notificaciones.jsp">                                    
                                    <i class="pe-7s-bell pe-2x pe-va">
                                        <%
                                            DAOEmpleo daoem = new DAOEmpleo();
                                            int n = 0;
                                            n = daop.numeroNotificacionMiRed(idPerson) + n;
                                            n = daoem.verificarNotificaciones(idPerson) + n;
                                            if (n != 0) {
                                        %>
                                        <span class="badge red"><%=n%></span>  
                                        <% }%>
                                    </i>
                                </a> 
                            </li> 
                            <%
                            } else {
                            %>
                            <li>    
                                <a href="postulados.jsp">                                    
                                    <i class="pe-7s-note2 pe-2x pe-va">
                                        <%
                                            int idEmpres = (Integer.parseInt(idEmpresa));
                                            DAOEmpleo daoem = new DAOEmpleo();
                                            int n = 0;
                                            n = daoem.notificarNuevosPostulados(idEmpres);
                                            if (n != 0) {
                                        %>
                                        <span class="badge red"><%=n%></span>  
                                        <% }%>
                                    </i>
                                </a> 
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
        </div>
        <div class="col-md-2">
        </div>
        <%            }
            if (sesion.getAttribute("idPersona") != null) {
        %>
        <div class="col-md-3">   
            <div class="well">
                <center><h4>Historial de Notificaciones</h4></center><br>
                <table id="table12" class="table table-striped table-hover table-bordered">
                    <thead></thead>
                    <tbody>                        
                        <%
                            DAOEmpleo daoem = new DAOEmpleo();
                            int idPerson = (Integer.parseInt(idPersona));
                            List<Postulados> ps = daoem.mostrarNotificaciones(idPerson, 1);
                            for (Postulados postulado : ps) {
                        %>
                        <tr>
                            <td class="col-md-7"><%=postulado.getMensaje()%></td>
                        </tr>
                        <% }%>
                        <%
                            DAOPersona daoper = new DAOPersona();
                            List<Amigos> as = daoper.notificarMiRed(idPerson, 1, 1);
                            for (Amigos amigos : as) {
                                int v = amigos.getIdAmigo();
                                List<Persona> amm = daoper.consultarXID(v);
                                for (Persona per : amm) {
                        %>
                        <tr>
                            <td class="col-md-7"><%=per.getNombresPersona()%> <%=per.getApellidosPersona()%> te ha agregado a sus contactos de Mi Red</td>
                            <% }
                                }
                            %>
                        </tr>
                        <%
                            List< Amigos> amm = daoper.notificarMiRed(idPerson, 2, 1);
                            for (Amigos amigos : amm) {
                                int v = amigos.getIdAmigo();
                                List<Persona> ami = daoper.consultarXID(v);
                                for (Persona per : ami) {
                        %>
                        <tr>
                            <td class="col-md-7"><%=per.getNombresPersona()%> <%=per.getApellidosPersona()%> ha rechazado tu solicitud para unirse a Mi Red</td>                        
                        </tr>
                        <% }
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-heading"> <center><h1>Notificaciones</h1></center></div><br>
            <div class="panel panel-default">
                <table id="table12" class="table table-striped table-hover table-bordered">
                    <thead></thead>
                    <tbody>                        
                        <%
                            List<Postulados> p = daoem.mostrarNotificaciones(idPerson, 0);
                            for (Postulados postulado : p) {
                        %>
                        <tr>
                            <td class="col-md-7"><%=postulado.getMensaje()%></td>
                            <td class="col-md-1"><center>
                        <form action="ServletEmpleo" method="post" id="notvista" name="notvista">                                      
                            <input name="Estadon" value="1" type="hidden" />           
                            <input name="idEmpleo" value="<%=postulado.getCodigoEmpleo()%>" type="hidden" />  
                            <input name="idPersona" value="<%=postulado.getCodigoPersona()%>" type="hidden" />                                     
                            <input type="submit" name="NotVista" value="Aceptar" class="btn btn-primary btn-sm" />
                    </center></form>
                    </td>
                    </tr>
                    <% }%>
                    <%
                        List<Amigos> a = daoper.notificarMiRed(idPerson, 1, 0);
                        for (Amigos amigos : a) {
                            int v = amigos.getIdAmigo();
                            List<Persona> am = daoper.consultarXID(v);
                            for (Persona per : am) {
                    %>
                    <tr>
                        <td class="col-md-7"><%=per.getNombresPersona()%> <%=per.getApellidosPersona()%> te ha agregado a sus contactos de Mi Red</td>
                        <td class="col-md-1"><center>
                        <form action="ServletPersona" method="post" >                                      
                            <input name="NotiSol" value="1" type="hidden" />                                             
                            <input name="idPersona" value="<%=idPerson%>" type="hidden" />                                             
                            <input name="idAmigo" value="<%=amigos.getIdAmigo()%>" type="hidden" />                                             
                            <input type="submit" name="NotVista" value="Aceptar" class="btn btn-primary btn-sm" />
                        </form></center>
                    </td>
                    <% }
                        }
                    %>
                    </tr>
                    <%
                        List< Amigos> am = daoper.notificarMiRed(idPerson, 2, 0);
                        for (Amigos amigos : am) {
                            int v = amigos.getIdAmigo();
                            List<Persona> ami = daoper.consultarXID(v);
                            for (Persona per : ami) {
                    %>
                    <tr>
                        <td class="col-md-7"><%=per.getNombresPersona()%> <%=per.getApellidosPersona()%> ha rechazado tu solicitud para unirse a Mi Red</td>
                        <td class="col-md-1"><center>
                        <form action="ServletPersona" method="post" >                                      
                            <input name="NotiSol" value="1" type="hidden" />                                             
                            <input name="idPersona" value="<%=idPerson%>" type="hidden" />                                             
                            <input name="idAmigo" value="<%=amigos.getIdAmigo()%>" type="hidden" />                                             
                            <input type="submit" name="NotVista" value="Aceptar" class="btn btn-primary btn-sm" />
                        </form></center>
                    </td>
                    </tr>
                    <% }
                        }
                    %>

                    </tbody>
                </table>
            </div>
            <%
                if (p.size() == 0 && a.size() == 0 && am.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p>No hay novedades<strong>porfavor</strong> revisa más tarde.</p>            
            </div>            
            <% }%>
        </div>
        <div class="col-md-3">
        </div>


        <%
            }
        %>
    </body>
</html>
