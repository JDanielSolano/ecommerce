package com;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import dao.Usuario;

@MultipartConfig(maxFileSize = 16177215)
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String usuario = req.getParameter("usuario");
        String nombre = req.getParameter("nombre");
        String apellidos = req.getParameter("apellidos");
        String contrasena = req.getParameter("contrasena");
        String correo = req.getParameter("correo");
        String rol = req.getParameter("rol");
        String foto = req.getParameter("foto");

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");

            Statement stmt = (Statement) cnx.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cliente where usuario='"
                    + usuario + "'Or correo='" + correo + "'    ");
            int contador = 0;
            while (rs.next()) {
                if (usuario.equals(rs.getString(2)) || correo.equals(rs.getString(6))) {
                    contador++;

                }
            }

            if (contador > 0) {
                resp.sendRedirect("AnadirUsuario.jsp");
            } else {
                try (PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(
                        "insert into cliente (id,usuario,nombre,apellidos,contrasena,correo,rol,foto) values (default,?,?,?,?,?,?,?)"
                )) {
                    ps.setString(1, usuario);
                    ps.setString(2, nombre);
                    ps.setString(3, apellidos);
                    ps.setString(4, contrasena);
                    ps.setString(5, correo);
                    ps.setString(6, rol);
                    ps.setString(7, foto);

                    ps.executeUpdate();
                }

                resp.sendRedirect("ListaUsuario.jsp");

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String action = req.getParameter("action");

        if (action.equals(null)) {

        }

        if (action.equals("Mostrar")) {
            System.out.println(action);
            Usuario usuario = new Usuario();
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                Statement stmt = (Statement) cnx.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM cliente WHERE id = " + id);

                while (rs.next()) {
                    usuario.setId(rs.getLong(1));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setRol(rs.getString("rol"));

                    req.setAttribute("usuario", usuario);

                }

            } catch (Exception e) {
            }

            req.getRequestDispatcher("MostrarUsuario.jsp").forward(req, resp);
        } else if (action.equals("Editar")) {

            System.out.println(action);

            Usuario usuario = new Usuario();
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                Statement stmt = (Statement) cnx.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM cliente WHERE id = " + id);

                while (rs.next()) {
                    usuario.setId(rs.getLong(1));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setRol(rs.getString("rol"));
                    usuario.setFoto(rs.getString("foto"));

                    req.setAttribute("usuario", usuario);

                }

            } catch (Exception e) {
            }

            req.getRequestDispatcher("EditarUsuario.jsp").forward(req, resp);

        } else if (action.equals("Eliminar")) {

            System.out.println(action);

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                String sql = "DELETE FROM cliente WHERE id=?";
                PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
            req.getRequestDispatcher("ListaUsuario.jsp").forward(req, resp);
        }

    }

}
