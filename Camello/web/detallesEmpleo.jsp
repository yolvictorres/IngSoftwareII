
<%@page import="Modelo.Salario"%>
<%@page import="Modelo.Cargo"%>
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
        <title>Empleos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
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
        <%
            if (sesion.getAttribute("idEmpresa") != null) {
        %>

        <div class="col-md-2">
        </div>
        <div class="col-md-8">

            <br> <center><h1>Detalles del empleo</h1></center><br><br>
            <div class="panel panel-default">
                <%
                    DAOEmpleo daoem = new DAOEmpleo();
                    Empleo empl = new Empleo();
                    empl.setIdEmpleo(Integer.parseInt(request.getParameter("id")));
                    List<Empleo> y = daoem.consultarIdP(empl.getIdEmpleo());
                    for (Empleo empleo : y) {
                %>  
                <table class="table table-bordered table-hover">
                    <tbody>                
                        <%
                            DAOEmpresa daoe = new DAOEmpresa();
                            List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                            for (Empresa empresa : x) {
                        %>
                        <tr><center>   
                        <td class="col-md-3"><center><p >Empresa:</p></center></td>
                        <td class="col-md-4"><center><p ><%=empresa.getNombreEmpresa()%></p></center></td>
                            <%  }%>
                        </tr>           

                        <%
                            Consultas cons = new Consultas();
                            List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                            for (Ciudad ciudad : z) {
                        %>                    
                        <tr>
                            <td class="col-md-3"><center><p >Ciudad:</p></center></td>
                        <td class="col-md-4"><center><p ><%=ciudad.getNombreCiudad()%></p></center></td>
                            <%  }%>    
                        </tr>

                        <%
                            List<Jornada> j = cons.consultarJornadaId(empleo.getIdJornada());
                            for (Jornada jornada : j) {
                        %>                        
                        <tr>
                            <td class="col-md-3"><center><p >Jornada:</p></center></td>
                        <td class="col-md-4"><center><p><%=jornada.getNombreJornada()%></p></center></td>
                                <%  }%>
                        </tr>
                        <tr>                 
                            <td class="col-md-3"><center><p >Descripción:</p></center></td>
                        <td class="col-md-4"><center><p ><%=empleo.getDetalles()%></p></center></td>
                        </tr>             

                        <%
                            List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                            for (Cargo cargo : c) {
                        %>
                        <tr>     
                            <td class="col-md-3"><center><p >Cargo:</p></center></td>
                        <td class="col-md-4"><center><p><%=cargo.getNombreCargo()%></p></center></td>
                                <%  }%>
                        </tr>                                            
                        <%
                            List<Salario> s = cons.consultarSalarioId(empleo.getIdSalario());
                            for (Salario salario : s) {
                        %>
                        <tr>
                            <td class="col-md-3"><center><p >Salario:</p></center></td>
                        <td class="col-md-4"><center><p ><%=salario.getSalario()%></p></center></td>
                            <%  }%>
                        </tr>                           
                        <tr>     
                            <td class="col-md-3"><center><p >Experiencia:</p></center></td>
                        <td><center><p ><%=empleo.getExperiencia()%></p></center></td>
                        </tr>              
                        </tbody> 
                </table>
                <%  }%>
            </div>
        </div>
        <div class="col-md-2">
        </div>

        <%
            }
            if (sesion.getAttribute("idPersona") != null) {
                int idPerson = Integer.parseInt(idPersona);
        %>

        <div class="col-md-2">
            <div class="panel">
                <%
                    DAOEmpleo daoem = new DAOEmpleo();
                    List<Empleo> e = daoem.consultar();
                    int idEmpleo = (Integer.parseInt(request.getParameter("id")));
                    int postul = daoem.verificarPostulado(idPerson, idEmpleo);
                    if (postul == 0) {
                %>
                <form action="ServletEmpleo" method="post" id="postular" name="postular">
                    <input name="idEmpleo" value="<%=idEmpleo%>" type="hidden" />
                    <input name="Estadoe" value="0" type="hidden" />
                    <input name="Estadop" value="0" type="hidden" />
                    <input name="idPersona" value="<%=sesion.getAttribute("idPersona")%>"  type="hidden" />         
                    <input id="postul" type="submit" name="Postularse" value="Postularse" class="btn btn-default" />
                </form>
                </td> 
                </tr>
                <% } else {
                %>
                <input id="postul" type="button" name="edit" value="Postulado" class="btn btn-default disabled" id="button">
                <%
                    }
                %>
            </div>
        </div>
        <div class="col-md-8">

            <br> <center><h1>Detalles del empleo</h1></center><br><br>
            <div class="panel panel-default">
                <%
                    Empleo empl = new Empleo();
                    empl.setIdEmpleo(Integer.parseInt(request.getParameter("id")));
                    List<Empleo> y = daoem.consultarIdP(empl.getIdEmpleo());
                    for (Empleo empleo : y) {
                %>  
                <table class="table table-bordered table-hover">
                    <tbody>                
                        <%
                            DAOEmpresa daoe = new DAOEmpresa();
                            List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                            for (Empresa empresa : x) {
                        %>
                        <tr><center>   
                        <td class="col-md-3"><center><p >Empresa:</p></center></td>
                        <td class="col-md-4"><center><p ><%=empresa.getNombreEmpresa()%></p></center></td>
                            <%  }%>
                        </tr>           

                        <%
                            Consultas cons = new Consultas();
                            List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                            for (Ciudad ciudad : z) {
                        %>                    
                        <tr>
                            <td class="col-md-3"><center><p >Ciudad:</p></center></td>
                        <td class="col-md-4"><center><p ><%=ciudad.getNombreCiudad()%></p></center></td>
                            <%  }%>    
                        </tr>

                        <%
                            List<Jornada> j = cons.consultarJornadaId(empleo.getIdJornada());
                            for (Jornada jornada : j) {
                        %>                        
                        <tr>
                            <td class="col-md-3"><center><p >Jornada:</p></center></td>
                        <td class="col-md-4"><center><p><%=jornada.getNombreJornada()%></p></center></td>
                                <%  }%>
                        </tr>
                        <tr>                 
                            <td class="col-md-3"><center><p >Descripción:</p></center></td>
                        <td class="col-md-4"><center><p ><%=empleo.getDetalles()%></p></center></td>
                        </tr>             

                        <%
                            List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                            for (Cargo cargo : c) {
                        %>
                        <tr>     
                            <td class="col-md-3"><center><p >Cargo:</p></center></td>
                        <td class="col-md-4"><center><p><%=cargo.getNombreCargo()%></p></center></td>
                                <%  }%>
                        </tr>                                            
                        <%
                            List<Salario> s = cons.consultarSalarioId(empleo.getIdSalario());
                            for (Salario salario : s) {
                        %>
                        <tr>
                            <td class="col-md-3"><center><p >Salario:</p></center></td>
                        <td class="col-md-4"><center><p ><%=salario.getSalario()%></p></center></td>
                            <%  }%>
                        </tr>                           
                        <tr>     
                            <td class="col-md-3"><center><p >Experiencia:</p></center></td>
                        <td><center><p ><%=empleo.getExperiencia()%></p></center></td>
                        </tr>              
                        </tbody> 
                </table>
                <%  }%>
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
