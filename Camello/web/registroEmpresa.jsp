<%-- 
    Document   : registroEmpresa
    Created on : 16/08/2017, 11:24:14 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Registro Empresa</title>
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
        <div>
            <nav class="navbar-inverse">
                <div class="container" style="position: relative; width: 30%; right: 30%;">
                    <div>
                        <img src="images/camello.png" style="width: 30%; height: 25%;"/>
                    </div>
                </div>
            </nav>
        </div>

        <div class="jumbotron boxlogin">
            <h2 class="col-lg-12 registerSection">Registo Empresa</h2>
            <form action="ServletEmpresa" method="post">
                <div><input name="nit" placeholder="Nit" class="form-control inputSection" type="number" min="1" required/></div>
                <div><input name="nombre" placeholder="Nombre" class="form-control inputSection" type="text" required/></div>
                <div><input name="correo" placeholder="Correo" class="form-control inputSection" type="email" required/></div>
                <div><input name="clave" placeholder="Contraseña" class="form-control inputSection" type="password" required/></div>
                <div>
                    <input type="submit" value="Registrar" class="btn btn-success" name="crearEmpresa"/>
                    <input type="submit" value="Cancelar" class="btn btn-danger" formaction="../index.jsp" formnovalidate/>
                </div>
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
