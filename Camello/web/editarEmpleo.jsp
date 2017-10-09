
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
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <br><center><h1>Editar empleo</h1></center><br><br>
            <form action="ServletEmpleo" method="post" id="editarEmpl" name="editarEmpl">  
                <%
                    DAOEmpleo daoem = new DAOEmpleo();
                    Empleo empl = new Empleo();
                    empl.setIdEmpleo(Integer.parseInt(request.getParameter("id")));
                    List<Empleo> y = daoem.consultarIdP(empl.getIdEmpleo());
                    for (Empleo empleo : y) {
                %>  
                <input name="idEmpleo" value="<%=Integer.parseInt(request.getParameter("id"))%>" type="hidden" />
                <input name="idEmpresa" value="<%=sesion.getAttribute("idEmpresa")%>"  type="hidden" />                
                <table  class="table edite table-bordered">             
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <tr> 
                        <td class="col-md-3"><center><p>Empresa:</p></center></td>
                    <td class="col-md-4"><center><p ><%=empresa.getNombreEmpresa()%></p></center></td>
                        <%  }%>
                    </tr>              
                    <tr>  
                        <td class="col-md-3"><center><p>Ciudad:</p></center></td>
                    <td class="col-md-4"><select name="idCiudad" form="editarEmpl" class="form-control inputSection">                       
                            <%
                                Consultas cons = new Consultas();
                                List<Ciudad> ciu = cons.consultarCiudad();
                                for (Ciudad c : ciu) {
                                    List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                                    for (Ciudad ciudad : z) {
                                        if (c.getIdCiudad() == ciudad.getIdCiudad()) {
                            %>     
                            <option value="<%=c.getIdCiudad()%>" selected><%=c.getNombreCiudad()%></option>
                            <%  } else {
                            %>
                            <option value="<%=c.getIdCiudad()%>"><%=c.getNombreCiudad()%></option>
                            <% }
                                    }
                                }%>
                            </tr>                  
                            <tr>
                                <td class="col-md-3"><center><p>Jornada:</p></center></td>
                    <td class="col-md-4"> <select name="idJornada" form="editarEmpl" class="form-control inputSection">
                            <%
                                List<Jornada> j = cons.consultarJornadaId(empleo.getIdJornada());
                                for (Jornada jornada : j) {
                                    List<Jornada> jor = cons.consultarJornada();
                                    for (Jornada jo : jor) {
                                        if (jornada.getIdJornada() == jo.getIdJornada()) {
                            %>
                            <option value="<%=jo.getIdJornada()%>" selected><%=jo.getNombreJornada()%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=jo.getIdJornada()%>"><%=jo.getNombreJornada()%></option>                     
                            <%  }
                                }%>
                        </select></td>                 
                        <%  }%>
                    </tr>                                         
                    <tr>    
                        <td class="col-md-3"><center><p>Descripción:</p></center></td>
                    <td class="col-md-4"><center><div><input name="detalles" value="<%=empleo.getDetalles()%>" class="form-control inputSection" type="text" /></div></center></td>
                    </tr>                                       
                    <tr>   
                        <td class="col-md-3"><center><p>Cargo:</p></center></td>
                    <td  class="col-md-4"> <select name="idCargo" form="editarEmpl" class="form-control inputSection">
                            <%
                                List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                                for (Cargo cargo : c) {
                                    List<Cargo> car = cons.consultarCargo();
                                    for (Cargo ca : car) {
                                        if (ca.getIdCargo() == cargo.getIdCargo()) {
                            %>
                            <option value="<%=ca.getIdCargo()%>" selected><%=ca.getNombreCargo()%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=ca.getIdCargo()%>"><%=ca.getNombreCargo()%></option>                     
                            <%  }
                                }%>
                        </select></td>                 
                        <%  }%>
                    </tr>                                             
                    <tr>
                        <td class="col-md-3"><center><p>Salario:</p></center></td>
                    <td class="col-md-4"> <select name="idSalario" form="editarEmpl" class="form-control inputSection">
                            <%
                                List<Salario> s = cons.consultarSalarioId(empleo.getIdSalario());
                                for (Salario salario : s) {
                                    List<Salario> sal = cons.consultarSalario();
                                    for (Salario sa : sal) {
                                        if (sa.getIdSalario() == salario.getIdSalario()) {
                            %>
                            <option value="<%=sa.getIdSalario()%>" selected><%=sa.getSalario()%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=sa.getIdSalario()%>"><%=sa.getSalario()%></option>                     
                            <%  }
                                }%>
                        </select></td>                 
                        <%  }%>
                    </tr>                   
                    <tr> 
                        <td class="col-md-3"><center><p>Experiencia:</p></center></td>
                    <td class="col-md-3"><center><div><input name="experiencia" value="<%=empleo.getExperiencia()%>" class="form-control inputSection" type="text" /></div></center></td>
                    </tr>              
                    </tbody> 
                </table>
                <%  }%>
                <Center>
                    <input type="submit" value="Guardar" class="btn btn-success" name="editarEmpleo"/>
                    <input type="submit" value="Cancelar" class="btn btn-default" formaction="empleos.jsp" formnovalidate/>
                </center>
            </form>
        </div>
        <div class="col-md-2">
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
