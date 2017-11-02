<%@page import="Acceso.DAOPersona"%>
<%@page import="Modelo.Postulados"%>
<%@page import="java.util.ArrayList"%>
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
    String dis = null;
    if (request.getParameter("idCargo") != null) {
        dis = request.getParameter("idCargo");
    }

%>
<html>
    <head>        
        <title>Empleos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <% if (request.getAttribute("respuestac") != null || request.getAttribute("respuestae") != null) {%>
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
        <script type="text/javascript" language="javascript" src="TableFilter/tablefilter.js"></script>        
        <script type="text/javascript" src="js/bootstrap.min.js"></script> 
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
        <div class="col-md-3 left panel-info">
            <div class="well">
                <div class="alert alert-dismissible alert-info">
                    <center><b>Crear empleos</b></center>
                </div>
                <div class="panel-body">
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
                        <div><input name="detalles" placeholder="Descripción" class="form-control inputSection" type="text" required=""/></div>
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
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel-heading"> <center><h1>Empleos Publicados</h1></center></div>
                    <%if (request.getAttribute("respuestae") != null) {%>
            <div class="alert alert-success">
                <center> El empleo se editó<strong> correctamente!</strong> </center>
            </div>
            <b><center>**Espere a que la página se recargue**</center></b> 
                    <% }%>
                    <%if (request.getAttribute("respuestac") != null) {%>
            <div class="alert alert-success">
                <center> El empleo se creo<strong> correctamente!</strong> </center>
            </div>
            <b><center>**Espere a que la página se recargue**</center></b> 
                    <% }%>

            <table id="example" class="display table table-striped table-bordered table-condensed table-hover" width="100%"></table>
            <b>Filtrar empleos</b>
            <table id="table1" class="display table table-striped table-bordered  table-hover">
                <thead>                               
                <th>Ciudad</th>
                <th>Cargo</th>
                <th>Salario</th>
                <th colspan="2">Acciones</th>
                </thead>
                <tbody>    
                    <%
                        int id = Integer.parseInt(idEmpresa);
                        DAOEmpleo daoem = new DAOEmpleo();
                        List<Empleo> y = new ArrayList<Empleo>();
                        if (request.getParameter("Ciudad") != null) {
                            int Ciudad = 0;
                            Ciudad = Integer.parseInt(request.getParameter("Ciudad"));
                            if (Ciudad != 0) {
                                y = daoem.filtro(Ciudad);
                            } else {
                                y = daoem.consultarIdE(id);
                            }
                        } else {
                            y = daoem.consultarIdE(id);
                        }

                        for (Empleo empleo : y) {

                    %>
                    <tr><center>     
                    <%                        List<Ciudad> ci = cons.consultarCiudadId(empleo.getIdCiudad());
                        for (Ciudad ciudad : ci) {
                    %>     
                    <td class="col-md-3"><p><%=ciudad.getNombreCiudad()%></p></td>
                            <%  }%>

                    <%
                        List<Cargo> c = cons.consultarCargoId(empleo.getIdCargo());
                        for (Cargo cargo : c) {
                    %>     
                    <td class="col-md-3"><p><%=cargo.getNombreCargo()%></p></td>
                            <%  }%>
                            <%
                                List<Salario> s = cons.consultarSalarioId(empleo.getIdSalario());
                                for (Salario salario : s) {
                            %>     
                    <td class="col-md-3"><p ><%=salario.getSalario()%></p></td>
                        <%  }%>
                    <td class="col-md-1"><input type="button" name="edit" value="Detalles" class="btn btn-primary" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    <td class="col-md-1"><input type="button" name="edit" value="Editar" class="btn btn-default" id="button" onclick="location.href = 'editarEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></td>
                    </tr>    

                    <%  }%>
                    </tbody> 
            </table>
            <script language="javascript" type="text/javascript">
                //<![CDATA[  
                var table10_Props = {
                    paging: true,
                    paging_length: 3,
                    results_per_page: ['# Empleos por página', [3, 6, 9]],
                    rows_counter: true,
                    rows_counter_text: "Rows:",
                    btn_reset: true,
                    col_0: 'select',
                    col_1: 'select',
                    col_2: 'select',
                    col_3: 'none',
                    col_4: 'none',
                    display_all_text: " Seleccionar ",
                    sort_num_asc: [2],
                    sort_num_desc: [3],
                    refresh_filters: true
                };
                var tf10 = setFilterGrid("table1", table10_Props);
                //]]>  
            </script>  


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
                int idPerson = Integer.parseInt(idPersona);
        %>
        <div class="col-md-3 left panel-info">
            <div class="well">
                <div class="alert alert-dismissible alert-warning">
                    <b>Empleos a los que te has postulado</b>
                </div>
                <div class="panel-body">         
                    <table id="table2" class="table table-condensed table-bordered table-hover">
                        <tbody>
                            <tr></tr>
                            <%
                                DAOEmpleo daoem = new DAOEmpleo();
                                List<Postulados> p = daoem.verificarEmpleosPostulados(idPerson);
                                for (Postulados postulado : p) {
                            %>
                            <tr>
                                <%
                                    List<Empleo> em = daoem.consultarIdP(postulado.getCodigoEmpleo());
                                    for (Empleo empleo : em) {
                                        DAOEmpresa daoemp = new DAOEmpresa();
                                        List<Empresa> emp = daoemp.consultarXID(empleo.getIdEmpresa());
                                        for (Empresa empresa : emp) {
                                %>                            
                                <td class="col-md-1"><center><img src="<%=empresa.getRutaLogo()%>" alt="usuariopersona" class="img-rounded"></center></td>
                                <% }%>
                                <%
                                    Consultas cons = new Consultas();
                                    List<Cargo> car = cons.consultarCargoId(empleo.getIdCargo());
                                    for (Cargo cargo : car) {
                                %>
                        <td class="col-md-1"><%=cargo.getNombreCargo()%></td>
                        <%}%>
                        <td class="col-md-1"><center><input type="button" name="edit" value="Ver" class="btn btn-warning btn-xs" id="button" onclick="location.href = 'detallesEmpleo.jsp?id=' + (<%=empleo.getIdEmpleo()%>);"></center></td> 
                       <%
                           int estadou = daoem.estadoPostulado(idPerson,empleo.getIdEmpleo(),1);
                           if(estadou == 1){
                       %> 
            <td class="col-md-1"><center><button class="btn btn-warning  btn-xs" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Preseleccionado"><i class="pe-7s-check pe-2x pe-va"></i></button></<center></td>
                        <% }%>
                    <%
                           int estadod = daoem.estadoPostulado(idPerson,empleo.getIdEmpleo(),0);
                           if(estadod == 1){
                       %> 
            <td class="col-md-1"><center><button class="btn btn-warning  btn-xs" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Pendiente"><i class="pe-7s-less pe-2x pe-va"></i></button></<center></td>
                        <% }%>
                    <%
                           int estadot = daoem.estadoPostulado(idPerson,empleo.getIdEmpleo(),2);
                           if(estadot == 1){
                       %> 
            <td class="col-md-1"><center><button class="btn btn-warning  btn-xs" id="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Rechazado"><i class="pe-7s-close-circle pe-2x pe-va"></i></button></<center></td>
                        <% }%>
                    </tr>
                        <% }
                            }%>
                        </tbody>
                    </table>
                    <script language="javascript" type="text/javascript">
                        //<![CDATA[  
                        var table2_Props = {
                            rows_counter: true,
                            rows_counter_text: "Rows:",
                            col_0: 'none',
                            col_1: 'select',
                            col_2: 'none',
                            display_all_text: " Seleccionar "
                        };
                        var tf2 = setFilterGrid("table2", table2_Props);
                        //]]>  
                    </script>  
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel-heading"> <center><h1>Encuentra empleo</h1></center></div><br>

            <b>Filtrar empleos</b>
            <table class="table table-condensed table-bordered table-hover" id="table1">
                <thead>                
                <th>Empresa</th>
                <th>Ciudad</th>
                <th>Cargo</th>
                <th>Salario</th>                
                <th colspan="2">Acciones</th>
                </thead>
                <tbody>  
                    <%
                        if (dis == null) {
                            Consultas cons = new Consultas();
                            List<Empleo> y = daoem.consultar();
                            for (Empleo empleo : y) {
                    %>
                    <tr><center>   
                    <%
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
                    </tr>
                    <% } else {
                    %>
                    <input type="button" name="edit" value="Postulado" class="btn btn-default disabled" id="button">
                    <%
                            }
                        }%>
                    </tbody> 
                    </table>
                    <script language="javascript" type="text/javascript">
                        //<![CDATA[  
                        var table10_Props = {
                            paging: true,
                            paging_length: 3,
                            results_per_page: ['# Empleos por página', [3, 6, 9]],
                            rows_counter: true,
                            rows_counter_text: "Rows:",
                            btn_reset: true,
                            col_0: 'select',
                            col_1: 'select',
                            col_2: 'select',
                            col_3: 'select',
                            col_4: 'none',
                            col_5: 'none',
                            display_all_text: " Seleccionar ",
                            sort_num_asc: [2],
                            sort_num_desc: [3],
                            refresh_filters: true
                        };
                        var tf1 = setFilterGrid("table1", table10_Props);
                        //]]>  
                    </script>  

                    <%
                        if (y.size() == 0) {
                    %>
                    <div class="alert alert-warning">
                        <p> Aún no se han publicado empleos, porfavor vuelve más tarde.</p>            
                    </div>            
                    <% }
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
