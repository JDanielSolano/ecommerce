<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.*"%>
<%
    Producto pro = (Producto) request.getAttribute("producto");


%>

<%        Usuario usuario = (Usuario) request.getSession().getAttribute("user");

    if (usuario == null) {

        System.out.println("Visitante anónimo.");
        response.sendRedirect("Ingreso.jsp");

    } else if (usuario.getRol().equals("admin")) {

        response.sendRedirect("ListaPedido.jsp");

    } else if (usuario.getRol().equals("user")) {

    }


%>




<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Producto | il Gambino</title>
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
                                    <i class="carticon"></i> Carrito <span class="label label-success font14">0 productos</span> +₡2000<b class="caret"></b></a>
                                <ul class="dropdown-menu topcartopen">
                                    <li>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="textright"><b>Sub-Total:</b></td>
                                                    <td class="textright">₡</td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Envío:</b></td>
                                                    <td class="textright">‎₡2000</td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Impuestos (13%):</b></td>
                                                    <td class="textright">₡</td>
                                                </tr>
                                                <tr>
                                                    <td class="textright"><b>Total:</b></td>
                                                    <td class="textright">₡</td>
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
                            <div class="logo pull-left"> <a href="index.jsp"><img src="images/inicio/logo.png" alt="" /></a> 
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
                                    <% }%> 
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
                                        <li><a href="index.jsp" class="active">Inicio</a></li>
                                        <li class="dropdown"><a href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                            <ul role="menu" class="sub-menu">
                                                <li><a href="tienda.jsp">Productos</a></li>
                                                <li><a href="carrito.jsp">Carrito</a></li>
                                                <li><a href="ingreso.jsp">Ingreso</a></li>
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
            <section id="product">
                <div class="container">
                    <div class="row">
                        <div class="span5">
                            <ul class="thumbnails mainimage">
                                <li class="span5">
                                    <a  rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom" href="<%= pro.getImagen()%>">
                                        <img alt="" src="<%= pro.getImagen()%>">
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="span7">
                            <div class="row">
                                <div class="span7">
                                    <h1 class="productname"><span class="bgnone"><%= pro.getMarca()%></span></h1>
                                    <div class="productprice">
                                        <form action="AnadirCarrito" method="post">   
                                            <div class="prnewprice">₡<%= pro.getPrecio()%></div>
                                    </div>
                                    <div class="quantitybox">
                                        <div>
                                            <label>Cantidad: </label>
                                            <input type="text" name="cantidad" value="1">
                                        </div>
                                        <p>
                                            <input type="hidden" name="id" value="<%= pro.getId()%>">
                                            <input type="hidden" name="usuarioID" value="<%= usuario.getId()%>">
                                            <br>
                                            <input type="submit" class="btn btn-warning" value="Comprar">
                                            <br>
                                            <br>
                                        </p>
                                    </div>
                                    <div class="productdesc">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="description">
                                                <h2>Producto: <%= pro.getMarca()%></h2>
                                                <p>Descripción: <%= pro.getDescripcion()%></p>
                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- Footer -->
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
