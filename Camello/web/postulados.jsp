<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Modelo.Postulados"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Persona"%>
<%@page import="Acceso.DAOPersona"%>
<%@page import="Modelo.Empleo"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mail" scope="session" class="Modelo.Postulados"/>
<jsp:setProperty name="mail" property="to" param="correoPersona" />
<jsp:setProperty name="mail" property="from" value="ingsoftware2kl@gmail.com" />
<jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />
<jsp:setProperty name="mail" property="subject" value="Respuesta Postulación" />
<jsp:setProperty name="mail" property="message" param="Mensaje" />

<!DOCTYPE html>
<html>
    <head>        
        <title>Postulados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

            if (sesion.getAttribute("idEmpresa") != null && sesion.getAttribute("nombreEmpresa") != null) {

                if (sesion.getAttribute("idEmpresa") != null && sesion.getAttribute("nombreEmpresa") != null) {
                    idEmpresa = sesion.getAttribute("idEmpresa").toString();
                    nombreEmpresa = sesion.getAttribute("nombreEmpresa").toString();
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
                                            n =daop.numeroNotificacionMiRed(idPerson)+n;
                                            n = daoem.verificarNotificaciones(idPerson)+n;
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
        <div class="col-md-3">
            <div class="panel panel-default ">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="postulados.jsp">Postulados</a></li>
                    <li><a href="preseleccionados.jsp">Pre-seleccionados</a></li>
                    <li><a href="rechazados.jsp">Rechazados</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-heading"> <center><h1>Postulados</h1></center></div><br>
            <div class="panel panel-default">
                <table id="table12" class="table table-striped table-hover" >
                    <tr></tr>
                    <tbody>
                        <%
                            DAOEmpleo daoem = new DAOEmpleo();
                            DAOEmpresa daoemp = new DAOEmpresa();
                            DAOPersona daoper = new DAOPersona();
                            int idEmpres = (Integer.parseInt(idEmpresa));
                            List<Postulados> p = daoem.mostrarNuevosPostulados(0, idEmpres);
                            for (Postulados postulado : p) {
                                List<Empleo> em = daoem.consultarIdP(postulado.getCodigoEmpleo());
                                for (Empleo empleo : em) {
                        %>
                        <tr>
                            <%
                                List<Persona> per = daoper.consultarXID(postulado.getCodigoPersona());
                                for (Persona person : per) {
                            %>
                            <td class="col-md-7">Se ha postulado <b><%=person.getNombresPersona()%> <%=person.getApellidosPersona()%></b> al empleo <b><%=empleo.getDetalles()%></b></td>
                            <td class="col-md-1"><input type="button" name="" value="Perfil" class="btn btn-primary " id="button" onclick="location.href = 'verPersona.jsp?id=' + (<%=person.getIdPersona()%>);"></td>
                            <td class="col-md-1"><input type="button" name="" value="Hoja de vida" class="btn btn-primary " id="button" onclick="javascipt:window.open('<%=person.getRutaHojadevida()%>');"></td>
                            <td class="col-md-1">
                                <form action="ServletEmpleo" method="post" id="aceptar" name="aceptar">                                      
                                    <input name="Estadop" value="1" type="hidden" />
                                    <input name="idEmpleo" value="<%=empleo.getIdEmpleo()%>" type="hidden" />
                                    <input name="idPersona" value="<%=postulado.getCodigoPersona()%>" type="hidden" />
                                    <%
                                        List<Empresa> g = daoemp.consultarXID(idEmpres);
                                        for (Empresa empre : g) {
                                    %>
                                    <input name="Mensaje" value="<%=empre.getNombreEmpresa()%> te preselecciono para el empleo <%=empleo.getDetalles()%>" type="hidden" />
                                    <%
                                        }
                                    %>        
                                    <input type="submit" name="AceptarPostulado" value="Aceptar" class="btn btn-primary" />
                                </form>
                            </td>
                            <td class="col-md-1">
                                <form action="ServletEmpleo" method="post" id="aceptar" name="aceptar">                                      
                                    <input name="Estadop" value="2" type="hidden" />
                                    <input name="idEmpleo" value="<%=empleo.getIdEmpleo()%>" type="hidden" />
                                    <input name="idPersona" value="<%=postulado.getCodigoPersona()%>" type="hidden" />
                                    <input name="correoPersona" value="<%=person.getCorreoPersona()%>" type="hidden" />
                                    <%
                                        List<Empresa> t = daoemp.consultarXID(idEmpres);
                                        for (Empresa empre : t) {
                                    %>
                                    <input name="Mensaje" value="<%=empre.getNombreEmpresa()%> ha rechazado tu solicitud para el empleo <%=empleo.getDetalles()%>" type="hidden" />
                                    <%
                                        }
                                    %>        
                                    <input type="submit" name="RechazarPostulado" value="Rechazar" class="btn btn-default" />
                                </form>
                            </td>
                            <%
                                }
                            %>

                            <%
                                }
                            %>
                        </tr>
                        <%                    }
                        %>
                    </tbody>
                </table>
                <script language="javascript" type="text/javascript">
                    //<![CDATA[  
                    var table12_Props = {
                        paging: true,
                        paging_length: 3,
                        results_per_page: ['# Empleos por página', [3, 6, 9]],
                        rows_counter: true,
                        rows_counter_text: "Rows:",
                        highlight_keywords: true,
                        on_keyup: true,
                        on_keyup_delay: 1500,
                        single_search_filter: true,
                        selectable: true,
                        refresh_filters: true
                    };
                    var tf12 = setFilterGrid("table12", table12_Props);
                    //]]>  
                </script> 
                <%
                    if (p.size() == 0) {
                %>
                <div class="alert alert-warning">
                    <p>No hay <strong>nuevos postulados</strong> revisa más tarde.</p>            
                </div>            
                <% }%>
            </div>
        </div>
        <div class="col-md-3">
        </div>
        <%
            }
        %>
    </body>
</html>
