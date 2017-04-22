<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.*"%>

<%        Usuario usuario = (Usuario) request.getSession().getAttribute("user");

    if (usuario == null) {

        System.out.println("Usuario anónimo.");
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
        <title>Ingreso | il Gambino</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
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
                                    <i class="carticon"></i> Carrito <span class="label label-success font14">0 productos</span> - ‎₡0<b class="caret"></b></a>
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
                            <div class="logo pull-left"> <a href="index.jsp"><img src="images/inicio/logo.png" alt="" /></a> </div>
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
                                        <li><a href="index.jsp">Inicio</a></li>
                                        <li class="dropdown"><a href="#">Tienda<i class="fa fa-angle-down"></i></a>
                                            <ul role="menu" class="sub-menu">
                                                <li><a href="Carrito.jsp">Carrito</a></li>
                                                <li><a href="Ingreso">Ingreso</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contacto.jsp" class="active" >Contacto</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </header>
        <div id="contact-page" class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="contact-form">
                        <h2 class="title text-center">Envíenos un mensaje</h2>
                        <div class="status alert alert-success" style="display: none"></div>
                        <form id="main-contact-form" class="contact-form row"  name="sentMessage" novalidate>
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" placeholder="Su nombre *" id="name" required data-validation-required-message="Por favor ingrese su nombre.">
                                <p class="help-block text-danger"></p>

                            </div>
                            <div class="form-group col-md-6">
                                <input type="email" class="form-control" placeholder="Su correo electrónico *" id="email" required data-validation-required-message="Por favor ingrese su correo electrónico.">
                                <p class="help-block text-danger"></p>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Su mensaje *" id="message" required data-validation-required-message="Por favor escriba un mensaje."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>

                                <div class="clearfix"></div>
                                <div class="col-lg-12 text-right">
                                    <div id="success"></div>
                                    <button type="submit" class="btn btn-warning">Enviar</button>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="contact-info">
                        <h2 class="title text-center">Información</h2>
                        <address>
                            <p>Il Gambino.</p>
                            <p>San José, CR</p>
                            <p>Teléfono: (+506) 8080 2020</p>
                            <p>Fax: (+506) 2224 7271</p>
                            <p>Correo: info@ilgambino.com</p>
                        </address>
                        <div class="social-networks">
                            <h2 class="title text-center">Redes Sociales</h2>
                            <ul>
                                <li> <a href="#"><i class="fa fa-facebook"></i></a> </li>
                                <li> <a href="#"><i class="fa fa-twitter"></i></a> </li>
                                <li> <a href="#"><i class="fa fa-google-plus"></i></a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                        <p class="pull-right">Diseñado por <span><a target="_blank" href="#">il Gambino</a></span></p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/contacto.js" type="text/javascript"></script>
        <script src="js/jquery.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/jquery.scrollUp.min.js"></script> 
        <script src="js/jquery.prettyPhoto.js"></script> 
        <script src="js/main.js"></script>
    </body>
</html>
