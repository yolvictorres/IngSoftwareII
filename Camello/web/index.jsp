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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/modern-business.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.jsp"><img  class="navbar-brand" src="images/camello.png" style="width: 11%; height: 11%;"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="col-md-2"><br><br><br>
            <div class="alert alert-success">
                <p> ¿Estás buscando un trabajo perfecto para ti? </p>
                <p> Estás en el lugar indicado, <strong>Camello es tu mejor solución </strong> regístrate como persona para conocer los mejores empleos.</p>
            </div>
        </div>
        <div class="col-md-8">

            <div class="jumbotron boxlogin">
                <h2 class="col-lg-12 registerSection">Registro</h2>
                <div style="position: relative; width: 50%; left: 22%;">
                    <form action="">
                        <span><a href='registroPersona.jsp'></a><input type="image" src="images/persona.png" style="width: 40%; height: 25%;" formaction="registroPersona.jsp" /></span>
                        <span><a href='registroEmpresa.jsp'></a><input type="image" src="images/empresa.png" style="width: 40%; height: 25%;" formaction="registroEmpresa.jsp"/></span>
                    </form>
                </div>
                <h2 class="col-lg-12 registerSection">Inicio de Sesión</h2>            
                <form action="ServletConsultas">
                    <div><input type="text" name="correo" placeholder="Correo" class="form-control inputSection"></div>
                    <div><input type="password" name="clave" placeholder="Contraseña" class="form-control inputSection"></div>
                    <div><input type="submit" value="Ingresar" class="btn btn-success" name="btniniciar"></div>
                </form>
            </div>
        </div>
        <div class="col-md-2"><br><br><br>
            <div class="alert alert-success">
                <p> ¿Estás buscando los mejores trabajadores para tu empresa? </p>
                <p> No busqués más, <strong>Camello es la solución  perfecta</strong> regístrate como empresa y publica empleos para encontrar a los mejores y más capacitados.</p>
            </div>            
        </div>
        <script type="text/javascript" src="js/lib/bootstrap.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap_1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="js/lib/angular.js"></script>--->
        <!--<script type="text/javascript" src="js/lib/angular.min.js"></script>--->
    </body>
</html>
