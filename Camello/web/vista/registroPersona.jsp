<%-- 
    Document   : registroPersona
    Created on : 16/08/2017, 11:23:56 AM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Persona</title>
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

        <div class="jumbotron boxlogin">
            <h2 class="col-lg-12 registerSection">Registo Persona</h2>
            <form action="">

                <div><input placeholder="Nombre" class="form-control inputSection"></div>
                <div><input placeholder="Apellido" class="form-control inputSection"></div>
                <div class="genreSection">    
                    <h5>
                        Genero:
                        <select name="Genero" class="" id="txtGenero">
                            <option>Masculino</option>
                            <option>Femenino</option>
                            <option>Otro</option>
                        </select>
                    </h5>
                </div>
                <div><input placeholder="Edad" class="form-control inputSection" type="number" min="0"></div><br>
                <div><input type="submit" value="Ingresar" class="btn btn-success"></div>
            </form>
        </div>
    </body>
</html>
