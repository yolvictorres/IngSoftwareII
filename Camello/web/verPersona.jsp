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
        <title>Mired</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <% if (request.getAttribute("respuesta") != null) {%>
        <meta http-equiv="refresh" content="3;URL=empleos.jsp">      
        <% }%>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
        <link rel="stylesheet" type="text/css" href="TableFilter/filtergrid.css">
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="js/BuscadorTabla.js"></script>
        <script type="text/javascript" language="javascript" src="TableFilter/tablefilter.js"></script>  
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
            </div><br>                
            <% } else {%>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="<%=person.getRutaFoto()%>" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div><br>
            <% }%>
            <div class="panel panel-default">
                <table class="table table-bordered table-striped">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><p>Nombres:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getNombresPersona()%></p></center></td>                              
                    </tr>               
                    <tr>
                        <td class="col-md-2"><center><p >Apellidos:</p></center></td> 
                    <td class="col-md-4"><center><p><%=person.getApellidosPersona()%></p></center></td>                              
                    </tr>                
                    <tr>
                        <td class="col-md-2"><center><p >Correo Electronico:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getCorreoPersona()%></p></center></td>                              
                    </tr>                
                    <tr>
                        <td class="col-md-2"><center><p>Telefono:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getTelefono()%></p></center></td>                              
                    </tr>                 
                    <tr>
                        <td class="col-md-2"><center><p>Fecha de nácimiento:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getEdad()%></p></center></td>                              
                    </tbody> 
                    <tr>
                        <td class="col-md-2"><center><p>Hoja de vida:</p></center></td> 
                    <td class="col-md-4"><center><input type="button" name="edit" value="Ver" class="btn btn-primary btn-sm" id="button" onclick="javascipt:window.open('<%=person.getRutaHojadevida()%>');"></center>
                    </td>                              
                    </tbody> 
                </table>
            </div>            
            <br>
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
            <%
                DAOPersona daop = new DAOPersona();
                int idPerson = (Integer.parseInt(idPersona));
                int idAmigo = Integer.parseInt(request.getParameter("id"));
                int postul = daop.verificarSolicitud(idPerson, idAmigo, 0);
                int postu = daop.solicitudesPendientes(idPerson, idAmigo, 0);
                int post = daop.verificarAmigos(idPerson, idAmigo, 1);
                if (post == 1) {
            %>
            <center>
                <button  id="postul" class="btn btn-default disabled btn-sm" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Unido a Mi Red"><i class="pe-7s-users pe-2x pe-va"></i></button>
            </center>
            <%
            } else if (postu == 1) {
            %>
            <center>
                <button id="postul" class="btn btn-default disabled btn-sm" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Solicitud pendiente"><i class="pe-7s-add-user pe-2x pe-va"></i></button>
            </center>

            <%
            } else if (postul == 0) {
            %>           

            <center>
                <form action="ServletPersona" method="post" id="amigoS" name="amigoS">                                      
                    <input name="EstadoS" value="0" type="hidden" />
                    <input name="Notificacion" value="0" type="hidden" />
                    <input name="idPersona" value="<%=idPerson%>" type="hidden" />
                    <input name="idAmigo" value="<%=idAmigo%>" type="hidden" />      
                    <button type="submit" name="AmigoS" class="btn btn-primary btn-sm" id="postul" data-toggle="tooltip" data-placement="right" title="" data-original-title="Enviar Solicitud"><i class="pe-7s-add-user pe-2x pe-va"></i></button>                       
                </form>
            </center>

            <% } else {%>
            <center>
                <button id="postul" class="btn btn-primary disabled btn-sm" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Solicitud enviada"><i class="pe-7s-add-user pe-2x pe-va"></i></button>
            </center>

            <% } %>
        </div>
        <div class="col-md-8">            

            <%

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
            </div><br>                
            <% } else {%>
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <center><img src="<%=person.getRutaFoto()%>" alt="usuariopersona" class="img-circle"></center>
                </div>
                <div class="col-md-3">
                </div>                
            </div><br>
            <% }%>
            <div class="panel panel-default">
                <table class="table table-bordered table-striped">
                    <tbody>                
                        <tr>
                            <td class="col-md-2"><center><p>Nombres:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getNombresPersona()%></p></center></td>                              
                    </tr>               
                    <tr>
                        <td class="col-md-2"><center><p >Apellidos:</p></center></td> 
                    <td class="col-md-4"><center><p><%=person.getApellidosPersona()%></p></center></td>                              
                    </tr>                
                    <tr>
                        <td class="col-md-2"><center><p >Correo Electronico:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getCorreoPersona()%></p></center></td>                              
                    </tr>                
                    <tr>
                        <td class="col-md-2"><center><p>Telefono:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getTelefono()%></p></center></td>                              
                    </tr>                 
                    <tr>
                        <td class="col-md-2"><center><p>Fecha de nácimiento:</p></center></td> 
                    <td class="col-md-4"><center><p ><%=person.getEdad()%></p></center></td>                              
                    </tbody> 
                    <tr>
                        <td class="col-md-2"><center><p>Hoja de vida:</p></center></td> 
                    <td class="col-md-4"><center><input type="button" name="edit" value="Ver" class="btn btn-primary btn-sm" id="button" onclick="javascipt:window.open('<%=person.getRutaHojadevida()%>');"></center>
                    </td>                              
                    </tbody> 
                </table>
            </div>            
            <br>
            <%
                }
            %>

        </div>
        <div class="col-md-2">
        </div>
        <%
            }
        %>

    </body>
</html>
