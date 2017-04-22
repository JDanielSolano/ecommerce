<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Salida</title>
    </head>
    <body>

        <%
            session.invalidate();
        %>
        <jsp:forward page="Ingreso.jsp"></jsp:forward>
    </body>
</html>