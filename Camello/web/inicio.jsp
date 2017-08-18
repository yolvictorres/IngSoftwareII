<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String idEmpresa;
            String nombreEmpresa;

            if (sesion.getAttribute("id") != null && sesion.getAttribute("nombre") != null) {
                idEmpresa = sesion.getAttribute("id").toString();
                nombreEmpresa = sesion.getAttribute("nombre").toString();
        %>
        <div>
            <nav class="navbar-inverse">
                <div class="container" style="position: relative; width: 30%; right: 30%;">
                    <div>
                        <img src="images/camello.png" style="width: 30%; height: 25%;"/>
                    </div>
                </div>
            </nav>
        </div>
        <h1>Bienvenido <%=nombreEmpresa%></h1>
        <a href='Sesioncerrada'><h5>Cerrar Session </h5></a>  
        <%
            } else {
                out.print("<script>location.replace('index.jsp');</script>");
            }
        %>

    </body>
</html>
