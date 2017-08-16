<%-- 
    Document   : registroEmpresa
    Created on : 16-ago-2017, 11:46:48
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
        <h1>Registro Empresa:</h1>
        <form action="ServletEmpresa" method="post">
            <label>Formulario Empresa</label>
            <input type="number" name="nit" placeholder="Ingrese su numero de NIT" required=""/>
            <input type="text" name="nombre" placeholder="Ingrese nombre de la empresa" required=""/>
            <input type="email" name="correo" placeholder="Ingrese correo empresarial" required=""/>
            <input type="password" name="clave" placeholder="Ingrese contraseña" required=""/>
            <input type="submit" value="Enviar" name="crearEmpresa"/>
        </form>
    </body>
</html>
