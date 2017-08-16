<%-- 
    Document   : registro persona
    Created on : 16-ago-2017, 9:19:55
    Author     : IAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form action="ServletPersona" method="post">
            <label>Formulario Persona</label>
            <input type="number" name="cedula" placeholder="Ingrese su numero de cedula" required=""/>
            <input type="text" name="nombres" placeholder="Ingrese sus nombres" required=""/>
            <input type="text" name="apellidos" placeholder="Ingrese sus apellidos" required=""/>
            <input type="email" name="correo" placeholder="Ingrese su correo" required=""/>
            <input type="password" name="clave" placeholder="Ingrese su contraseña" required=""/>
            <input type="submit" value="Enviar" name="crearPersona"/>
        </form>
        
    </body>
</html>
