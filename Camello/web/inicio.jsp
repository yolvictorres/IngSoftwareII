<%-- 
    Document   : inicio
    Created on : 18/08/2017, 10:53:27 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>
        <link  rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/foundation.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar" aria-controls="mainNavBar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div style="position: relative; width: 30%;">
                        <img src="images/camello.png"/>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="mainNavBar">
                    <ul class="nav navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="#"><h3>Inicio</h3></a></li>
                        <li class="nav-item"><a href="#"><h3>Empleos</h3></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><h3>Perfil<b class="caret"></b></h3></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#"><h5>Ver Perfil</h5></a>
                                <a class="dropdown-item" href="#"><h5>Cerrar Sesión</h5></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>        
        <script type="text/javascript" src="js/scripts.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <!--<script type="text/javascript" src="js/lib/angular.js"></script>--->
        <!--<script type="text/javascript" src="js/lib/angular.min.js"></script>--->
    </body>
</html>
