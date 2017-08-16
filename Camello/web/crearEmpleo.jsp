<%-- 
    Document   : crearEmpleo
    Created on : 16/08/2017, 03:59:55 PM
    Author     : usuario
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Pais"%>
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
        <form action="ServletEmpresa" method="post" id="crearEmpleo">
            <label>Formulario Empleo</label>
             <%
                    Consultas cons = new Consultas();
                    Pais pais = new Pais();
                    String nombrePais = (request.getParameter("nombrePais"));
                    List<Pais> y = cons.consultarNombrePais(nombrePais);
                    for (Pais p : y) {
                %>
            <a>Selecciones Pais: </a><br>
            <select name="pais" form="crearEmpleo">
                <% for (int x = 0; x < pos.length; x++) {%>
                <option value="<%=pos[x]%>"><%=pos[x]%></option>
                <% }%>
            </select> 
            <%  }%>
            <input type="number" name="idCiudad" placeholder="ciudad" required=""/>
            <input type="number" name="idJornada" placeholder="Jornada" required=""/>
            <input type="text" name="detalles" placeholder="detalles" required=""/>
            <input type="text" name="cargo" placeholder="cargo" required=""/>
            <input type="text" name="experiencia" placeholder="experiencia" required=""/>
            <input type="submit" value="Enviar" name="crearEmpleo"/>
        </form>
    </body>
</html>
