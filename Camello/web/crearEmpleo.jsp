<%-- 
    Document   : crearEmpleo
    Created on : 16/08/2017, 03:59:55 PM
    Author     : usuario
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Pais"%>
<%@page import="Modelo.Ciudad"%>
<%@page import="Modelo.Jornada"%>
<%@page import="Acceso.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Crear Empleo</h1>
        <form action="ServletEmpleo" method="post" id="crearEmpl" name="crearEmpl">
            <label>Formulario Empleo</label>

            <select name="idCiudad" form="crearEmpl">                       
                <%
                    HttpSession sesion = request.getSession();
                    int a = 1, b = 999999999;
                    double idEmpre = Math.round(Math.random()*(b-a)+(a));
                    int idEmpr =  (int) idEmpre;
                    Consultas cons = new Consultas();
                    List<Ciudad> ciu = cons.consultarCiudad();
                    for (Ciudad c : ciu) {
                %>  
                <option value="<%=c.getIdCiudad()%>"><%=c.getNombreCiudad()%></option>                      
                <% }%>
            </select>
            <select name="idJornada" form="crearEmpl">                       
                <%
                    List<Jornada> jor = cons.consultarJornada();
                    for (Jornada j : jor) {
                %>  
                <option value="<%=j.getIdJornada()%>"><%=j.getNombreJornada()%></option>                      
                <% }%>
            </select>
            <input type="hidden" name="idEmpleo" value="<%=idEmpr%>"/>
            <input type="hidden" name="idEmpresa" value="<%=sesion.getAttribute("idEmpresa").toString()%>"/>
            <input type="text" name="detalles" placeholder="detalles" required=""/>
            <input type="text" name="cargo" placeholder="cargo" required=""/>
            <input type="text" name="experiencia" placeholder="experiencia" required=""/>
            <input type="submit" value="Enviar" name="crearEmpleo"/>
        </form>
    </body>
</html>
