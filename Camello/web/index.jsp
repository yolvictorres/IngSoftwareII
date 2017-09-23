<%-- 
    Document   : newjsp
    Created on : 16/08/2017, 11:06:41 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio de Sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid" style="position: relative; width: 30%; right: 30%;">            
                    <div>
                        <img src="images/camello.png" style="width: 25%; height: 20%;"/>
                    </div>
                </div>
            </nav>
        </div>
        <div class="jumbotron boxlogin">
            <h2 class="col-lg-12 registerSection">Registro</h2>
            <div style="position: relative; width: 50%; left: 15%;">
                <form action="">
                <span><a href='registroPersona.jsp'></a><input type="image" src="images/persona.png" style="width: 30%; height: 25%;" formaction="registroPersona.jsp" /></span>
                <span><a href='registroEmpresa.jsp'></a><input type="image" src="images/empresa.png" style="width: 30%; height: 25%;" formaction="registroEmpresa.jsp"/></span>
                </form>
            </div>
            <h2 class="col-lg-12 registerSection">Inicio de Sesión</h2>            
            <form action="ServletConsultas" method="post">
                <div><input type="email" name="correo" placeholder="Correo" class="form-control inputSection" required></div>
                <div><input type="password" name="clave" placeholder="Contraseña" class="form-control inputSection" required></div>
                <div><input type="submit" value="Ingresar" class="btn btn-success" name="btniniciar"></div>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>        
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <!--<script type="text/javascript" src="js/lib/angular.js"></script>--->
        <!--<script type="text/javascript" src="js/lib/angular.min.js"></script>--->
    </body>
</html>
