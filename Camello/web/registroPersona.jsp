<%-- 
    Document   : registroPersona
    Created on : 16/08/2017, 11:23:56 AM
    Author     : diego
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro Persona</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <% if (request.getAttribute("respuesta") != null) {%>
        <meta http-equiv="refresh" content="3;URL=index.jsp">
        <% }%>
    </head>
    <body>
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
                        <a class="navbar-brand" href="index.jsp">Camello</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
        </div>
        <%if (request.getAttribute("respuesta") != null) {%>
        <br><br><br>
        <div class="alert alert-success">
            <center> El usuario se creó<strong> exitosamente!</strong> </center>
        </div>
        <b><center>**Espere a que la página se recargue**</center></b> 
                <% }%>
        <div class="col-md-2">

        </div>
        <div class="col-md-8">
            <div class="jumbotron boxlogin">
                <h2 class="col-lg-12 registerSection">Registro Persona</h2>
                <form action="ServletPersona" method="post">

                    <div><input name="cedula" placeholder="Número de cédula" class="form-control inputSection" type="number" min="1" required/></div>
                    <div><input name="nombres" placeholder="Nombres" class="form-control inputSection" type="text" required/></div>
                    <div><input name="apellidos" placeholder="Apellidos" class="form-control inputSection" type="text" required/></div>
                    <div><input name="correo" placeholder="Correo" class="form-control inputSection" type="email" required/></div>
                    <div><input name="clave" placeholder="Contraseña" class="form-control inputSection" type="password" required/></div><br>
                    <div>
                        <center><input type="submit" value="Registrar" class="btn btn-success" name="crearPersona"/></center>
                        <center><input type="submit" value="Cancelar" class="btn btn-danger" formaction="index.jsp" formnovalidate/></center>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-2">

        </div>
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>        
        <!--<script type="text/javascript" src="js/lib/angular.js"></script>--->
        <!--<script type="text/javascript" src="js/lib/angular.min.js"></script>--->
    </body>
</html>
