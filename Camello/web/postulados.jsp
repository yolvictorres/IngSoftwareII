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
                                <a href="postulados.jsp">                                    
                                    <i class="pe-7s-note2 pe-2x pe-va">
                                        <%
                                            int idEmpres = (Integer.parseInt(idEmpresa));
                                            DAOEmpleo daoem = new DAOEmpleo();
                                            int n = daoem.notificarNuevosPostulados(idEmpres);
                                        %>
                                        <span class="badge red"><%=n%></span>  
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

        </div>
        <div class="col-md-7">
            <div class="panel-heading"> <center><h1>Postulados</h1></center></div><br>
            <div class="panel panel-default">
                <table id="table12" class="table table-striped table-hover" >
                    <tr></tr>
                    <tbody>
                        <%
                            DAOEmpleo daoem = new DAOEmpleo();
                            DAOPersona daoper = new DAOPersona();
                            int idEmpres = (Integer.parseInt(idEmpresa));
                            List<Postulados> p = daoem.verificarNuevosPostulados(idEmpres);
                            for (Postulados postulado : p) {
                                List<Empleo> em = daoem.consultarIdP(postulado.getCodigoEmpleo());
                                for (Empleo empleo : em) {
                        %>
                        <tr>
                            <%
                                List<Persona> per = daoper.consultarXID(postulado.getCodigoPersona());
                                for (Persona person : per) {
                            %>
                            <td class="col-md-6">Se ha postulado <b><%=person.getNombresPersona()%> <%=person.getApellidosPersona()%></b> al empleo <b><%=empleo.getDetalles()%></b></td>
                            <td class="col-md-2"><input type="button" name="" value="Hoja de vida" class="btn btn-primary " id="button" onclick="javascipt:window.open('<%=person.getRutaHojadevida()%>');"></td>
                            <td class="col-md-2">
                                <form action="ServletEmpleo" method="post" id="postular" name="postular">
                                    <input name="idEmpleo" value="<%=empleo.getIdEmpleo()%>" type="hidden" />
                                    <%
                                        List<Empleo> W = daoem.consultar();
                                        for (Empleo emple : W) {
                                    %>
                                    <input name="idEmpresa" value="<%=empleo.getIdEmpresa()%>" type="hidden" />
                                    <%
                                        }
                                    %>                         
                                    <input name="Estadoe" value="0" type="hidden" />
                                    <input name="Estadop" value="0" type="hidden" />
                                    <input name="idPersona" value="<%=sesion.getAttribute("idPersona")%>"  type="hidden" />         
                                    <input type="submit" name="AceptarPostulado" value="Aceptar" class="btn btn-primary" />
                                </form>
                            </td>
                            <td class="col-md-2">
                                <form action="ServletEmpleo" method="post" id="postular" name="postular">
                                    <input name="idEmpleo" value="<%=empleo.getIdEmpleo()%>" type="hidden" />
                                    <%
                                        List<Empleo> y = daoem.consultar();
                                        for (Empleo emple : y) {
                                    %>
                                    <input name="idEmpresa" value="<%=empleo.getIdEmpresa()%>" type="hidden" />
                                    <%
                                        }
                                    %>                         
                                    <input name="Estadoe" value="0" type="hidden" />
                                    <input name="Estadop" value="0" type="hidden" />
                                    <input name="idPersona" value="<%=sesion.getAttribute("idPersona")%>"  type="hidden" />         
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
            </div>
        </div>
        <div class="col-md-3">
        </div>
        <%
            }
        %>
    </body>
</html>
