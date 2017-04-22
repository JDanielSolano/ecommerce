<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.*"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.mysql.jdbc.Connection" %>
<%@ page import ="com.mysql.jdbc.PreparedStatement" %>
<%@page import="java.util.ArrayList"%>





<%
    PreparedStatement ps = null;
    ArrayList<Producto> listaProducto = new ArrayList<Producto>();

    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
        ps = (PreparedStatement) cnx.prepareStatement("select * from producto");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Producto producto = new Producto();
            producto.setId(rs.getInt("id"));
            producto.setMarca(rs.getString("marca"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setPrecio(rs.getFloat("precio"));
            producto.setImagen(rs.getString("imagen"));

            listaProducto.add(producto);

        }

    } catch (Exception e) {
    }


%>




<%        Usuario usuario = (Usuario) request.getSession().getAttribute("user");

    if (usuario == null) {

        System.out.println("Usuario anónimo.");
        response.sendRedirect("Ingreso.jsp");

    } else if (usuario.getRol().equals("admin")) {

        response.sendRedirect("ListaPedido.jsp");

    } else if (usuario.getRol().equals("user")) {

    }


%>

<%       ArrayList<Carrito> listaCarrito = new ArrayList<Carrito>();

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
        <title>Inicio | il Gambino</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/Template/css/style.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/ico/favicon.png">
    </head>
    <body>
        <!-- Barra superior -->
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
                                                <% for (Carrito c : listaCarrito) {%>
                                                <tr>
                                                    <td class="image"><a href="<%= c.getImagen()%>"><img
                                                                title="producto" alt="producto"
                                                                src="<%= c.getImagen()%>" height="50" width="50"></a></td>
                                                    <td class="name"><a href="product.html"><%= c.getMarca()%></a></td>
                                                    <td class="quantity">x&nbsp;<%= c.getCantidad()%></td>
                                                    <td class="total">$<%= c.getPrecio()%></td>
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
            <!--Resto de página -->
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
                                    <% } %> 
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
                                        <li><a href="Inicio" class="active">Inicio</a></li>
                                        <li class="dropdown"><a href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                            <ul role="menu" class="sub-menu">
                                                <li><a href="Carrito.jsp">Carrito</a></li>
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
        <section id="slider">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span>il</span>GAMBINO</h1>
                                        <h2>¡Las mejores marcas!</h2>
                                        <p>A precios super cómodos y completamente originales, con garantía incluída contra defectos de fábrica. </p>
                                    </div>
                                    <div class="col-sm-6"> <img src="images/inicio/zapato1.jpg" class="girl img-responsive" alt="Nike" /> </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>il</span>GAMBINO</h1>
                                        <h2>Stock bastante amplio.</h2>
                                        <p>Tenis y zapatos de alta gama con stock amplio, varias tallas, acá lo tenemos. </p>
                                    </div>
                                    <div class="col-sm-6"> <img src="images/inicio/zapato2.jpg" class="girl img-responsive" alt="Gucci" /> </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>il</span>GAMBINO</h1>
                                        <h2>Envíos a todo el país.</h2>
                                        <p>Solo compre y escriba su dirección para enviarle el producto en la comodidad de su casa.</p>
                                    </div>
                                    <div class="col-sm-6"> <img src="images/inicio/zapato3.jpg" class="girl img-responsive" alt="New Balance" /> </div>
                                </div>
                            </div>
                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev"> <i class="fa fa-angle-left"></i> </a> <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next"> <i class="fa fa-angle-right"></i> </a> </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Categorías</h2>
                            <div class="panel-group category-products" id="accordian">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordian" href="#deportivo" class="active"> <span class="badge pull-right"><i class="fa fa-plus"></i></span> Deportivo </a> </h4>
                                    </div>
                                    <div id="deportivo" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Nike </a></li>
                                                <li><a href="#">Under Armour </a></li>
                                                <li><a href="#">Adidas </a></li>
                                                <li><a href="#">Puma</a></li>
                                                <li><a href="#">New Balance </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordian" href="#hombres"> <span class="badge pull-right"><i class="fa fa-plus"></i></span> Hombres </a> </h4>
                                    </div>
                                    <div id="hombres" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Ralph Lauren</a></li>
                                                <li><a href="#">Emerica</a></li>
                                                <li><a href="#">Perry Ellis</a></li>
                                                <li><a href="#">Maui & Sons</a></li>
                                                <li><a href="#">DC Shoes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordian" href="#mujeres"> <span class="badge pull-right"><i class="fa fa-plus"></i></span> Mujeres </a> </h4>
                                    </div>
                                    <div id="mujeres" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Gucci</a></li>
                                                <li><a href="#">Guess</a></li>
                                                <li><a href="#">Valentino</a></li>
                                                <li><a href="#">Dior</a></li>
                                                <li><a href="#">Versace</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="shipping text-center"> <img src="images/inicio/envio.jpg" alt="" /> </div>
                        </div>
                    </div>
                    <!-- Productos-->
                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <h2 class="title text-center">Más populares</h2>
                            <% for (Producto p : listaProducto) {%>
                            <div class="col-sm-4"> 
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">  <img alt="" src="<%= p.getImagen()%>"/>
                                            <h2>‎₡<%= p.getPrecio()%></h2>
                                            <p><%= p.getMarca()%></p>
                                            <a href="Producto?id=<%= p.getId()%>&action=Mostrar" title="Añadir al Carrito" 
                                               class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Añadir al carrito</a> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>       
                        </div>
                    </div>
                </div>
            </div>

        </section>




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
    </body>
</html>
