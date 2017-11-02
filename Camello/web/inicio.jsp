<%@page import="Acceso.Consultas"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOPersona"%>
<%@page import="Acceso.DAOPublicacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Inicio</title>
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
            String nombreEmpresa = null, nombrePersona = null, correoPersona = null;

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
                        <!--<a class="navbar-brand" href="inicio.jsp"> Camello</a>-->
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
                DAOEmpresa empresa = new DAOEmpresa();
                List<Empresa> empr = empresa.consultarXID(Integer.parseInt(idEmpresa));
        %>
        <div class="col-md-2">
            <div class="well">
                <%
                    for (Empresa e : empr) {
                        if (e.getRutaLogo() == null) {
                %>
                <input type="button" name="edit" value="Completar perfil" class="btn btn-primary active" id="button" onclick="location.href = 'completarEmpresa.jsp?id=' + (<%=idEmpresa%>);">                     
                <% } else {
                %>
                <input type="button" name="edit" value="Perfil completo" class="btn btn-primary disabled" id="button" onclick="location.href = ">
                <%
                        }
                    }%>
            </div>
        </div>
        <div class="col-md-8">
            <center><h1>Bienvenido <%=nombreEmpresa%></h1></center>
        </div>
        <div class="col-md-2">
        </div>




        <%
            }
            if (sesion.getAttribute("idPersona") != null) {
                DAOPersona persona = new DAOPersona();
                List<Persona> per = persona.consultarXID(Integer.parseInt(idPersona));
        %>
        <div class="col-md-3">   
            <div class="well">
                <%
                    for (Persona p : per) {
                        if (p.getRutaFoto() == null | p.getRutaHojadevida() == null) {
                %>
                <input type="button" name="edit" value="Completar perfil" class="btn btn-primary active" id="button" onclick="location.href = 'completarPersona.jsp?id=' + (<%=idPersona%>);">                     
                <% } else {
                %>
                <input type="button" name="edit" value="Perfil completo" class="btn btn-primary disabled" id="button" onclick="location.href = ">
                <%
                        }
                    }%>

            </div>
            <h5><b>publica lo que quieras</b></h5>
            <div class="col-md-6">
                <form action="ServletPublicacion" method="post" id="crearPubli" name="crearPubli">    
                    <%
                        int a = 1, b = 999999999;
                        double idPublire = Math.round(Math.random() * (b - a) + (a));
                        int idPublir = (int) idPublire;
                     %>
                    <div><input type="hidden" name="idPublicacion" value="<%=idPublir%>" class="form-control inputSection"/></div>
                    <div><input type="hidden" name="idPersona" value="<%=sesion.getAttribute("idPersona").toString()%>" class="form-control inputSection"/></div>
                    <div><input name="detalles" placeholder="Detalles" class="form-control inputSection" type="text" required=""/></div>
                    <div><input type="submit" value="Crear" class="btn btn-primary" name="crearPublicacion"/></div>
                    <!--<center><input type="submit" value="Cancelar" class="btn btn-default" formaction="inicio.jsp" formnovalidate/></center>-->
                </form>
            </div>
        </div>                    
        <div class="col-md-7">
            <center><h1>Bienvenido <%=nombrePersona%></h1></center><br>
            <div class="row">
                <div class="panel panel-info">
                    <center><h5><strong>Camello</strong> te sugiere los siguientes empleos:</h></center>
                </div>
            </div>
            <div id="sug" class="panel panel-default">
                <table class="table table-hover table-condensed table-sm table-striped">
                    <thead>                
                    <th>Empresa</th>
                    <th>Ciudad</th>
                    <th>Cargo</th>
                    <th>Salario</th>                
                    <th colspan="2">Acciones</th>
                    </thead>
                    <tbody>  
                        <%
                            DAOEmpleo daoem = new DAOEmpleo();
                            List<Empleo> y = daoem.consultarIntereses(Integer.parseInt(idPersona));
                            for (Empleo empleo : y) {
                        %>
                        <tr><center>   
                        <%
                            Consultas cons = new Consultas();
                            DAOEmpresa daoe = new DAOEmpresa();
                            List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                            for (Empresa empresa : x) {
                        %>
                        <td class="col-md-2"><%= empresa.getNombreEmpresa()%></td>  
                        <%  }%>
                        <%
                            List<Ciudad> ci = cons.consultarCiudadId(empleo.getIdCiudad());
                            for (Ciudad ciudad : ci) {
                        %>     
                        <td class="col-md-3"><p ><%=ciudad.getNombreCiudad()%></p></td>
                            <%  }%>
                            <%
                                List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                                for (Cargo cargo : c) {
                            %>     
                        <td class="col-md-3"><p ><%=cargo.getNombreCargo()%></p></td>
                            <%  }%>
                            <%
                                List<Salario> s = cons.consultarSalarioId(empleo.getIdSalario());
                                for (Salario salario : s) {
                            %>     
                        <td class="col-md-3"><p ><%=salario.getSalario()%></p></td>
                            <%  }%>
                        <td class="col-md-1"><input type="button" name="edit" value="Ver" class="btn btn-primary" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>    
                        <td class="col-md-1">
                            <%
                                int idEmpleo = (empleo.getIdEmpleo());
                                int idPerson = Integer.parseInt(idPersona);
                                int postul = daoem.verificarPostulado(idPerson, idEmpleo);
                                if (postul == 0) {
                            %>
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
                                <input name="Estadon" value="0" type="hidden" />                                                      
                                <input name="idPersona" value="<%=sesion.getAttribute("idPersona")%>"  type="hidden" />         
                                <input type="submit" name="Postularse" value="Postularse" class="btn btn-default" />
                            </form>
                        </td> 
                        <% } else {
                        %>
                        <input type="button" name="edit" value="Postulado" class="btn btn-default disabled" id="button">
                        <% } %>
                        </tr>    
                        <%  }%>
                        </tbody> 
                        </table>
                        </div>
                        <center><h5>publicaciones de personas</h5></center>
                        <div id="sug" class="panel panel-default">

                            <table class="table table-hover table-condensed table-sm table-striped">
                                <thead>                
                                <th>Usuario</th>
                                <th>Detalle</th>
                                </thead>
                                <tbody>
                                    <%
                                        DAOPublicacion daopublicacion = new DAOPublicacion();
                                        List<Publicacion> pu = daopublicacion.consultar();
                                        for (Publicacion publicacion : pu) {
                                    %>
<tr>

                                    <%
                                        DAOPersona daop = new DAOPersona();
                                        List<Persona> x = daop.consultarXID(publicacion.getIdUsuario());
                                        for (Persona p : x) {
                                    %>
                                    
                                        <td class="col-md-4"><center><p><%=p.getNombresPersona()%></p></center></td>
                                        <%}%>
                                <td class="col-md-4"><p><%=publicacion.getDetalle()%></p></td>
                                </tr>
                                <%  }%>
                                </tbody>
                            </table>
                            
                        </div>

                        <div class="col-md-2">
                        </div>

                        </div>
                        <%
                            }
                        %>
                        </body>
                        </html>
