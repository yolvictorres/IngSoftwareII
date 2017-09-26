<%@page import="Modelo.Jornada"%>
<%@page import="Modelo.Salario"%>
<%@page import="Modelo.Cargo"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Acceso.Consultas"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Acceso.DAOEmpresa"%>
<%@page import="Modelo.Empleo"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.DAOEmpleo"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String dis=null;
    if(request.getParameter("idCargo")!=null){
        dis=request.getParameter("idCargo");
        }
            
%>
<html>
    <head>        
        <title>Empleos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <!-- Optional - Adds useful class to manipulate icon font display -->
        <link rel="stylesheet" href="pe-icon-7-stroke/css/helper.css">
        <% if (request.getAttribute("respuesta") != null) {%>
        <meta http-equiv="refresh" content="3;URL=empleos.jsp">
        <% }%>
        <script>
            function pasar(){
                document.filtrarEmpl.submit();
            }
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


        <div class="col-md-3 left panel-info">
            <div class="panel-heading">
                <b>Filtrar empleos</b>
            </div>
            <div class="panel-body">
                <form action="ServletEmpleo" method="post" id="filtrarEmpl" name="filtrarEmpl">
                    <select name="idCiudad" form="crearEmpl" class="form-control inputSection">                       
                        <%
                            Consultas cons = new Consultas();
                            List<Salario> sal = cons.consultarSalario();
                            for (Salario s : sal) {
                        %>  
                        <option value="<%=s.getIdSalario()%>"><%=s.getSalario()%></option>                      
                        <% }%>
                    </select>
                    <input type="submit" value="Filtrar" class="btn btn-success" name="crearEmpleo"/>
                </form>
            </div>
        </div>

        <div class="col-md-7">
            <center><h1>Empleos Publicados</h1></center>
                <%if (request.getAttribute("respuesta") != null) {%>
            <div class="alert alert-success">
                <center> El empleo se editó<strong> correctamente!</strong> </center>
            </div>
            <b><center>**Espere a que la página se recargue**</center></b> 

            <% }%>
            <input type="button" name="edit" value="Crear Empleo" class="button" id="button" onclick="location.href = 'crearEmpleo.jsp'">
            <%
                DAOEmpleo daoem = new DAOEmpleo();
                int id = Integer.parseInt(idEmpresa);
                List<Empleo> y = daoem.consultarIdE(id);
                for (Empleo empleo : y) {
            %>
            <table class="table table-bordered">
                <thead>                               
                <th>Cargo</th>
                <th>Ciudad</th>
                <th>Detalles</th>
                <th>Editar</th>
                </thead>
                <tbody>                
                    <tr><center>                                               
                    <%
                        List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                        for (Cargo cargo : c) {
                    %>     
                    <td class="col-md-4"><center><a ><%=cargo.getNombreCargo()%></a></center></td>
                        <%  }%>
                        <%
                            List<Ciudad> z = cons.consultarCiudadId(empleo.getIdCiudad());
                            for (Ciudad ciudad : z) {
                        %>     
                    <td class="col-md-4"><center><a ><%=ciudad.getNombreCiudad()%></a></center></td>
                        <%  }%>
                    <td class="col-md-1"><input type="button" name="edit" value="Ver" class="button" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    <td class="col-md-1"><input type="button" name="edit" value="Editar" class="button" id="button" onclick="location.href = 'editarEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    </tr>              

                    </tbody> 
            </table>
            <%  }%>
            <%
                if (y.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p> Aún no has publicado empleos, has click en el botón <strong>Crear Empleo</strong> y comienza ahora.</p>            
            </div>            
            <% }%>
        </div>
        <div class="col-md-2">
        </div>

        <%
            }
            if (sesion.getAttribute("idPersona") != null) {
        %>


        <div class="col-md-3 left panel-info">
            <div class="panel-heading">
                <b>Filtrar empleos</b>
            </div>
            <div class="panel-body">
                <form action="empleos.jsp" method="post" id="filtrarEmpl" name="filtrarEmpl">
                    <select name="idCargo" form="filtrarEmpl" class="form-control inputSection">                       
                        <%
                            Consultas cons = new Consultas();
                            List<Cargo> car = cons.consultarCargo();
                            for (Cargo ca : car) {
                        %>  
                        <option value="<%=ca.getIdCargo()%>"><%=ca.getNombreCargo()%></option>                      
                        <% }%>
                    </select>
                    <center>
                        <input type="submit" value="Filtrar" class="btn btn-success" name="crearEmpleo"/>
                    </center>
                </form>
            </div>
        </div>

        <div class="col-md-7">
            <center><h1>Encuentra empleo</h1></center>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        
                    </div>
                </div>
            </div>
            <%
                if(dis==null){
                DAOEmpleo daoem = new DAOEmpleo();
                List<Empleo> y = daoem.consultar();
                for (Empleo empleo : y) {
            %>
            <table class="table table-bordered">
                <thead>                
                <th>Empresa</th>
                <th>Cargo</th>
                <th>Detalles</th>
                </thead>
                <tbody>  
                    <tr><center>   
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <td class="col-md-5"><center><a ><%=empresa.getNombreEmpresa()%></a></center></td>   
                        <%  }%>
                        <%

                            List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                            for (Cargo cargo : c) {
                        %>     
                    <td class="col-md-4"><center><a ><%=cargo.getNombreCargo()%></a></center></td>
                        <%  }%>
                    <td class="col-md-1"><input type="button" name="edit" value="Ver" class="button" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>  
                    </tr>                                 
                    </tbody> 
            </table>
            <%  }%>
            <%
                if (y.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p> Aún no se han publicado empleos, porfavor vuelve más tarde.</p>            
            </div>            
            <% }
                }else if(dis!=null){
                    DAOEmpleo daoem = new DAOEmpleo();
                    List<Empleo> y = daoem.consultarIdC(dis);
                    for (Empleo empleo : y) {
            %>
            <table class="table table-bordered">
                <thead>                
                <th>Empresa</th>
                <th>Cargo</th>
                <th>Detalles</th>
                </thead>
                <tbody>  
                    <tr><center>   
                    <%
                        DAOEmpresa daoe = new DAOEmpresa();
                        List<Empresa> x = daoe.consultarXID(empleo.getIdEmpresa());
                        for (Empresa empresa : x) {
                    %>
                    <td class="col-md-5"><center><a ><%=empresa.getNombreEmpresa()%></a></center></td>   
                        <%  }%>
                        <%

                            List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                            for (Cargo cargo : c) {
                        %>     
                    <td class="col-md-4"><center><a ><%=cargo.getNombreCargo()%></a></center></td>
                        <%  }%>
                    <td class="col-md-1"><input type="button" name="edit" value="Ver" class="button" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>  
                    </tr>                                 
                    </tbody> 
            </table>
            <%  }%>
            <%
                if (y.size() == 0) {
            %>
            <div class="alert alert-warning">
                <p> Aún no se han publicado empleos, porfavor vuelve más tarde.</p>            
            </div>            
            <% }
                    }
            %>

            <div class="center-block"> 
                <center>
                    <ul class="pagination pagination-lg">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </center>
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
