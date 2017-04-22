<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>


<%

    Usuario usuario = (Usuario) request.getSession().getAttribute("user");

    if (usuario == null) {

        System.out.println("Visitante anónimo.");
        response.sendRedirect("Ingreso.jsp");

    } else if (usuario.getRol().equals("admin")) {

    } else {

        response.sendRedirect("Inicio");
    }

%>

<%    Operador operador = new Operador();
    ArrayList<Pedido> listaPedidos = operador.getAllPedido();

%>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    
    <head>
        <meta charset="utf-8" />
        <title>Administración</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <link href="css/Admin/css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/Admin/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link href="css/Admin/css/style.css" rel="stylesheet" />
        <link href="css/Admin/css/style-responsive.css" rel="stylesheet" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html"><span>Administración</span></a>


                    <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img width="22" height="22" src="<%= usuario.getFoto()%>" alt="">
                                    <span class="usuario"><%= usuario.getUsuario()%></span>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-menu-title">
                                        <span>Opciones</span>
                                    </li>
                                    <li><a href="Salida.jsp"><i class="halflings-icon off"></i> Cerrar sesión</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>	

        <div class="container-fluid-full">
            <div class="row-fluid">


                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <li><a href="ListaPedido.jsp"><i class="icon-shopping-cart"></i><span class="hidden-tablet"> Pedidos</span></a></li>	
                            <li><a href="ListaUsuario.jsp"><i class="icon-user"></i><span class="hidden-tablet"> Usuarios</span></a></li>
                            <li><a href="ListaProductos.jsp"><i class="icon-gift"></i><span class="hidden-tablet"> Productos</span></a></li>
                        </ul>
                    </div>
                </div>

                <div id="content" class="span10">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">Administración</a> 
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">Pedidos</a></li>
                    </ul>

                    <div class="row-fluid sortable">		
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon white user"></i><span class="break"></span>Pedidos</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>ID de Usuario</th>
                                            <th>Pedido</th>
                                            <th>Precio Total</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% for (Pedido p : listaPedidos) {%>
                                        <tr>
                                            <td><%= p.getId()%></td>
                                            <td><%= p.getUsuarioID()%></td>
                                            <td><%= p.getPedido()%></td>
                                            <td>₡<%= p.getTotal()%></td>
                                            <td> <a href="Pedido?id=<%= p.getId()%>&action=Entregar"> <input class="btn btn-primary" type="button" value="Entregar"> </a> </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p><span style="text-align:left;float:left">&copy; 2016 <a href="#">Daniel Solano</a></span></p>
        </footer>


        <script src="css/Admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery-migrate-1.0.0.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.ui.touch-punch.js" type="text/javascript"></script>
        <script src="css/Admin/js/modernizr.js" type="text/javascript"></script>
        <script src="css/Admin/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.cookie.js" type="text/javascript"></script>
        <script src='css/Admin/js/fullcalendar.min.js' type="text/javascript"></script>
        <script src='css/Admin/js/jquery.dataTables.min.js' type="text/javascript"></script>
        <script src="css/Admin/js/excanvas.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.flot.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.flot.pie.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.flot.stack.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.flot.resize.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.chosen.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.cleditor.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.noty.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.elfinder.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.raty.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.iphone.toggle.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.gritter.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.imagesloaded.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.masonry.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.knob.modified.js" type="text/javascript"></script>
        <script src="css/Admin/js/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="css/Admin/js/counter.js" type="text/javascript"></script>
        <script src="css/Admin/js/retina.js" type="text/javascript"></script>
        <script src="css/Admin/js/custom.js" type="text/javascript"></script>
        
    </body>
    
</html>
