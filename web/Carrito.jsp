<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>


<%

    Usuario usuario = (Usuario) request.getSession().getAttribute("user");

    if (usuario == null) {

        System.out.println("Visitante anónimo.");
        response.sendRedirect("Ingreso.jsp");

    } else if (usuario.getRol().equals("admin")) {

        response.sendRedirect("ListaPedido.jsp");

    } else if (usuario.getRol().equals("user")) {

    }


%>

<%    PreparedStatement ps = null;
    ArrayList<Carrito> listaCarrito = new ArrayList<Carrito>();

    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
        ps = (PreparedStatement) cnx.prepareStatement("select * from carrito where usuarioID=" + usuario.getId());
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Carrito carrito = new Carrito();
            carrito.setId(rs.getInt("id"));
            carrito.setProductoID(rs.getInt("productoID"));
            carrito.setUsuarioID(rs.getInt("usuarioID"));
            carrito.setCantidad(rs.getInt("cantidad"));
            carrito.setMarca(rs.getString("marca"));
            carrito.setDescripcion(rs.getString("descripcion"));
            carrito.setPrecio(rs.getFloat("precio"));
            carrito.setImagen(rs.getString("imagen"));

            listaCarrito.add(carrito);

        }

    } catch (Exception e) {
    }

    float Envio = 2000, SubTotal = 0, Total = 0, Impuestos = 0;
    int cantidad = 0;
    String Pedido = "";

    for (Carrito c : listaCarrito) {
        cantidad = cantidad + c.getCantidad();
        SubTotal = SubTotal + (c.getPrecio() * c.getCantidad());
        Pedido = Pedido + " \n Producto: " + c.getMarca() + " || Cantidad: " + c.getCantidad() + "\n";

    }

    System.out.println(Pedido);
    Impuestos = (SubTotal / 100) * (13 + 1 / 2);
    if (cantidad == 0) {
        Total = SubTotal + Envio;
    } else {
        Total = SubTotal + Envio + Impuestos;
    }
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carrito | il Gambino</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/Template/css/style.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/ico/favicon.png">

    </head>
    <body onload="setupZoom()">

        <header id="header">
            <div class="header_top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +506 8080 2020</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> info@ilgambino.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <ul class="nav pull-right left-tablet">
                            <li class="dropdown hover topcart">
                                <a  class="dropdown-toggle" href="#">
                                    <i class="carticon"></i> Carrito <span class="label label-success font14"><%= cantidad%> productos
                                    </span> +₡<%= Envio%><b class="caret"></b></a>
                                <ul class="dropdown-menu topcartopen">
                                    <li>
                                        <table>
                                            <tbody>
                                                <% for (Carrito p : listaCarrito) {%>
                                                <tr>
                                                    <td class="image"><a href="<%= p.getImagen()%>"><img
                                                                title="product" alt="product"
                                                                src="<%= p.getImagen()%>" height="50" width="50"></a></td>
                                                    <td class="name"><a href="product.html"><%= p.getMarca()%></a></td>
                                                    <td class="quantity">x&nbsp;<%= p.getCantidad()%></td>
                                                    <td class="total">$<%= p.getPrecio()%></td>
                                                    <td class="remove"><i class="icon-remove"></i></td>
                                                </tr>
                                                <%}%>	
                                            </tbody>
                                        </table>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="textright"><b>Sub-Total:</b></td>
                                                    <td class="textright">$<%= SubTotal%></td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Envío:</b></td>
                                                    <td class="textright">‎₡2000</td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Impuestos (13%):</b></td>
                                                    <td class="textright">$<%= Impuestos%></td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Total:</b></td>
                                                    <td class="textright">$<%= Total%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="well pull-right">
                                            <a href="#" class="btn btn-success">Ver carrito</a>
                                            <a href="#" class="btn btn-success">Checkout</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-middle">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left"> <a href="Inicio"><img src="images/inicio/logo.png" alt="" /></a> 
                            </div>
                            <div class="btn-group pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown"> Costa Rica </button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown"> CRC </button>
                                </div>
                            </div>
                        </div>
                        <div class="span8">
                            <div class="row">
                                <div class="pull-right logintext">
                                    <% if (!(usuario == null)) {%>  
                                    <table>
                                        <tr>
                                            <td>
                                                <span  class="frame">
                                                    <img width="50" height="50" alt="" src="<%= usuario.getFoto()%>">
                                                </span>   
                                            </td>
                                            <td>
                                                Bienvenido(a),  
                                                <%= usuario.getUsuario()%>
                                                <br>
                                                <a href="Salida.jsp">Cerrar sesión</a>
                                            </td>
                                        </tr>
                                    </table> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                                </div>
                                <div class="mainmenu pull-left">
                                    <ul class="nav navbar-nav collapse navbar-collapse">
                                        <li><a href="Inicio">Inicio</a></li>
                                        <li class="dropdown"><a class="active" href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                            <ul role="menu" class="sub-menu">
                                                <li><a class="active" href="Carrito.jsp">Carrito</a></li>
                                                <li><a href="Ingreso.jsp">Ingreso</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contacto.jsp">Contacto</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </header>
        <div id="maincontainer">
            <section id="checkout">
                <div class="container">
                    <h1 class="headingmain">
                        <span>Carrito de compras</span>
                    </h1>
                    <div class="cart-info">


                        <form action="Carrito" method="post"> 

                            <table class="table table-striped table-bordered">
                                <tr>


                                    <td>Marca </td>
                                    <td>Imagen </td>
                                    <td>Descripcion</td>
                                    <td>Precio</td>
                                    <td>Cantidad</td>
                                    <td>Acción</td>


                                </tr>

                                <% for (Carrito c : listaCarrito) {%>
                                <tr>


                                    <td><%= c.getMarca()%></td>
                                    <td><a href="<%= c.getImagen()%>" ><IMG SRC="<%= c.getImagen()%>"  WIDTH="50" HEIGHT="50" /></a></td>
                                    <td><%= c.getDescripcion()%></td>
                                    <td><%= c.getPrecio()%></td>
                                    <td><input type="text" name="cantidad" value="<%= c.getCantidad()%>"/>  </td>

                                    <td> 
                                        <input type="hidden" name="id" value="<%= c.getId()%>">
                                        <input type="submit" class="btn btn-success" value="Editar" /> 
                                        <a href="Carrito?id=<%= c.getId()%>&action=Eliminar">
                                            <input type="button" class="btn btn-danger" value="Eliminar" /> </a> 
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                        </form>
                    </div>
                    <div class="row">
                        <div class="pull-right">
                            <div class="span4 pull-right">
                                <table class="table table-striped table-bordered ">
                                    <tr>
                                        <td class="textright"><b>Sub-Total:</b></td>
                                        <td class="textright">₡<%= SubTotal%></td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>Envío:</b></td>
                                        <td class="textright">‎₡2000</td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>Impuestos (13%):</b></td>
                                        <td class="textright">₡<%= Impuestos%></td>
                                    </tr>
                                    <tr>
                                        <td class="textright"><b>Total:</b></td>
                                        <td class="textright">₡<%= Total%></td>
                                    </tr>
                                </table>


                                <form action="Checkout">
                                    <input type="hidden" name="usuarioID" value="<%= usuario.getId()%>">
                                    <input type="hidden" name="pedido" value="<%= Pedido%>">
                                    <input type="hidden" name="total" value="<%= Total%>">
                                    <script>
                                        function myFunction() {
                                            alert("Producto Comprado!");
                                        }
                                    </script>



                                    <input type="submit" value="Comprar"
                                           class="btn btn-warning" onclick="myFunction()">


                                    <input type="submit"
                                           value="Continuar comprando"
                                           class="btn btn-warning">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <br>
        <br>

        <footer id="footer">
            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Servicios</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Ayuda en línea</a></li>
                                    <li><a href="#">Contáctenos</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Políticas</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Términos de uso</a></li>
                                    <li><a href="#">Políticas de privacidad</a></li>
                                    <li><a href="#">Reembolsos</a></li>
                                    <li><a href="#">Sistema de pago</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>il Gambino</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Información de la compañía</a></li>
                                    <li><a href="#">Empleos</a></li>
                                    <li><a href="#">Tiendas</a></li>
                                    <li><a href="#">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2016 il Gambino Inc. Todos los derechos reservados.</p>
                        <p class="pull-right">Diseñado por <span><a target="_blank" href="">il Gambino</a></span></p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/jquery.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/jquery.scrollUp.min.js"></script>  
        <script src="js/jquery.prettyPhoto.js"></script> 
        <script src="js/main.js"></script>

        <% }%>
    </body>
</html>