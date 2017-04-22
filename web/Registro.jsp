<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Registro | il Gambino</title>
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
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="Ingreso.jsp" class="active"><i class="fa fa-lock"></i> Ingreso</a></li>
                                </ul>
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
                                            <li><a href="Tienda.jsp">Productos</a></li>
                                            <li><a href="Carrito.jsp">Carrito</a></li>
                                            <li><a href="Ingreso">Ingreso</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="Contacto.jsp">Contacto</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>


        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-1">
                    <div class="login-form">
                        <h1>Registrarse</h1>
                        <p> Si ya tiene una cuenta con nosotros, por favor ingrese desde el panel principal.</p>
                        <br>
                        <form action="Registro" method="Post" class="form-horizontal">
                            <br><input type="text" name="usuario" placeholder="Nombre de usuario*"><br>
                            <br><input type="password" name="contrasena" placeholder="Contraseña*"><br>
                            <br><input type="text" name="nombre" placeholder="Nombre*"><br>
                            <br><input type="text" name="apellidos" placeholder="Apellidos*"><br>
                            <br><input type="text" name="correo" placeholder="Correo electrónico*"><br>
                            <br><input type="text" name="foto" placeholder="Foto">
                            <button type="submit" class="btn btn-default">Registrarse</button>
                            <br><br>
                            <br><br>
                            <br><br>
                        </form>
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