<%@page import="dao.Operador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Confirmar anadir</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="dao.Usuario" scope="request">
            <jsp:setProperty name="usuario" property="usuario" param="usuario" />
            <jsp:setProperty name="usuario" property="nombre" param="nombre" />
            <jsp:setProperty name="usuario" property="apellidos" param="apellidos" />
            <jsp:setProperty name="usuario" property="contrasena" param="contrasena" />
            <jsp:setProperty name="usuario" property="correo" param="correo" />
            <jsp:setProperty name="usuario" property="rol" param="rol" />

            <%
                Operador op = new Operador();
                op.anadirUsuario(usuario);  

            %>



            <h2>¡Usuario añadido!</h2>

        </jsp:useBean>
    </body>
</html>