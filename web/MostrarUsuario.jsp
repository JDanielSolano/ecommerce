<%@page import="dao.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    
    
    <%
       Usuario u = (Usuario)request.getAttribute("usuario");
    %>
      
       
       <table>
            
            <tr>
                 <td>ID: </td>
                 <td><%= u.getId()%></td>
            </tr>
            
            <tr>
                 <td>Usuario: </td>
                 <td><%= u.getUsuario()%></td>
            </tr>
            
            <tr>
                 <td>Nombre: </td>
                 <td><%= u.getNombre()%></td>
            </tr>
            
            <tr>
                 <td>Apellidos: </td>
                 <td><%= u.getApellidos()%></td>
            </tr>
            
            <tr>
                 <td>Contrasena: </td>
                 <td><%= u.getContrasena()%></td>
            </tr>
            
            <tr>
                 <td>Correo: </td>
                 <td><%= u.getCorreo()%></td>
            </tr>
            
            <tr>
                 <td>Rol: </td>
                 <td><%= u.getRol()%></td>
            </tr>
            
           
       
       </table>
</body>
</html>