<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Producto | il Gambino</title>
</head>
<body>
    
    
    <%
       Producto pro = (Producto) request.getAttribute("producto");
    %>
      
       
       <table>
            
            <tr>
                 <td>ID: </td>
                 <td><%= pro.getId()%></td>
            </tr>
            
            <tr>
                 <td>Marca: </td>
                 <td><%= pro.getMarca()%></td>
            </tr>
            
            <tr>
                 <td>Descripcion: </td>
                 <td><%= pro.getDescripcion()%></td>
            </tr>
            
            <tr>
                 <td>Precio: </td>
                 <td><%= pro.getPrecio()%></td>
            </tr>
            
            <tr>
                 <td>Imagen: </td>
                 <td><IMG SRC="<%= pro.getImagen()%>"  WIDTH="50" HEIGHT="50" /></td>
            </tr>
            
          
           
       
       </table>
</body>
</html>