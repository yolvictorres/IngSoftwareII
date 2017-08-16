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
            <nav class="navbar-inverse">
                <div class="container">
                    <div class="navbar-header" >
                        <h1 style="color: whitesmoke">Logo</h1>
                    </div>
                </div>
            </nav>
        </div>
        <h1>Inicio de Sesión</h1>
        <div class="jumbotron boxlogin">
            <h2 class="col-lg-12 registerSection">Inicio de Sesión</h2>
            <form action="">
                <div style="position: relative; width: 30%;">
                    <input type="image" src="images/persona.png" style="width: 30%; height: 20%; left: 60%;" formaction="vista/registroPersona.jsp"/>
                    <input type="image" src="images/empresa.png" style="width: 30%; height: 20%; left: 20%;" formaction="vista/registroEmpresa.jsp"/>
                </div>
                <div><input type="text" placeholder="Nombre" class="form-control inputSection"></div>
                <div><input type="password" placeholder="Contraseña" class="form-control inputSection"></div>
                <div><input type="submit" value="Ingresar" class="btn btn-success"></div>
            </form>
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
