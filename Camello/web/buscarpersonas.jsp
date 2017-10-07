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
        <title>Buscar Personas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <% if (request.getAttribute("respuestasol") != null) {%>
        <meta http-equiv="refresh" content="1;URL=buscarpersonas.jsp">      
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
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String idEmpresa = null, idPersona = null;
            String nombreEmpresa = null, nombrePersona = null;

            if (sesion.getAttribute("idPersona") != null && sesion.getAttribute("nombrePersona") != null) {

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
                            <%                                if (sesion.getAttribute("idPersona") != null) {
                            %>
                            <li>
                                <a href="mired.jsp"><i class="pe-7s-users pe-2x pe-va"></i></a>
                            </li> 
                            <li>    
                                <a href="notificaciones.jsp">                                    
                                    <i class="pe-7s-bell pe-2x pe-va">
                                        <%
                                            int idPerson = (Integer.parseInt(idPersona));
                                            DAOEmpleo daoem = new DAOEmpleo();
                                            int n = 0;
                                            n = daoem.verificarNotificaciones(idPerson);
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
            if (sesion.getAttribute("idPersona") != null) {
        %>

        <div class="col-md-3">
            <div class="panel panel-default ">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="buscarpersonas.jsp">Buscar Personas</a></li>
                    <li ><a href="mired.jsp">Mi Red
                            <%DAOPersona daop = new DAOPersona();
                                int idPerson = (Integer.parseInt(idPersona));
                                int mired = daop.numeroUnidosAMiRed(idPerson);
                                int SolicitudesP = daop.numeroSolicitudesPendientes(idPerson, 0);
                            %>
                            <span class="badge"><%=mired%></span></a>
                        </a></li>
                    <li >
                        <a href="solicitudespendientes.jsp">Solicitudes Pendientes     
                            <span class="badge"><%=SolicitudesP%></span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-7">
            <center><h1>Buscar Personas</h1></center><br>
            <center>
                <div>                
                    <p>
                        <label><i class="pe-7s-search pe-2x pe-va"></i></label>
                        <input id="searchTerm" type="text" onkeyup="doSearch()" placeholder=" Buscar personas " />
                    </p>                
                </div>
            </center>
            <br>
            <table id="datos" class="table table-condensed table-bordered table-hover">
                <thead>
                <th>Foto</th>
                <th><center>Nombres</center></th>  
                <th>Solicitar unirse a Mi Red</th>
                </thead>
                <tbody>
                    <jsp:useBean id="cn" class="Acceso.DAOPersona" scope="page"></jsp:useBean>
                    <%
                        ResultSet rs = cn.listar();
                        while (rs.next()) {
                            if (rs.getInt("cod_persona") != idPerson) {
                    %>
                    <tr>

                        <% if (rs.getString("ruta_foto") != null) {%>
                        <td class="col-md-1"><center><a onclick="location.href = 'verPersona.jsp?id=' + (<%=rs.getString("cod_persona")%>);"><img src="<%=rs.getString("ruta_foto")%>" alt="..." class="img-thumbnail"></a></center></td>
                        <% } else {%>
                <td class="col-md-1"><center><a onclick="location.href = 'verPersona.jsp?id=' + (<%=rs.getString("cod_persona")%>);"><img src="images/persona.png" alt="..." class="img-thumbnail"></a></center></td>   
                        <% }%>
                <td class="col-md-5"><center><p onclick="location.href = 'verPersona.jsp?id=' + (<%=rs.getString("cod_persona")%>);"><%=rs.getString("nombres")%> <%=rs.getString("apellidos")%></p></center></td>
                    <%
                        int postul = daop.verificarSolicitud(idPerson, rs.getInt("cod_persona"), 0);
                        int postu = daop.solicitudesPendientes(idPerson, rs.getInt("cod_persona"), 0);
                        if (postu == 1) {
                    %>
                <td class="col-md-1"><center>
                    <input type="button" name="edit" value="Solicitud Pendiente" class="btn btn-default disabled" id="button">
                </center>
                </td>
                <%
                    }else  if (postul == 0) {
                %>           
                <td class="col-md-1"><center>
                    <form action="ServletPersona" method="post" id="amigoS" name="amigoS">                                      
                        <input name="EstadoS" value="0" type="hidden" />
                        <input name="idPersona" value="<%=idPerson%>" type="hidden" />
                        <input name="idAmigo" value="<%=rs.getInt("cod_persona")%>" type="hidden" />      
                        <input type="submit" name="AmigoS" value="Enviar Solicitud" class="btn btn-primary" />
                    </form></center>
                </td>
                <% } else {%>
                <td class="col-md-1"><center>
                    <input type="button" name="edit" value="Solicitud Enviada" class="btn btn-primary disabled" id="button">
                </center>
                </td>
                <% }%>
                </tr>
                <% }
                    }
                %>
                </tbody>
            </table>
            <script language="javascript" type="text/javascript">
//<![CDATA[  
                var table6_Props = {
                    paging: true,
                    paging_length: 3,
                    results_per_page: ['# Empleos por página', [3, 6, 9]],
                    rows_counter: true,
                    rows_counter_text: "Rows:",
                    btn_reset: false,
                    col_0: 'none',
                    col_1: 'none',
                    col_2: 'none',
                    loader: true,
                    loader_text: "Filtering data..."
                };
                var tf6 = setFilterGrid("datos", table6_Props);
//]]>  
            </script> 
        </div>

        <div class="col-md-2">
        </div>
        <%
            }
        %>
    </body>
</html>
