package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;

public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String usuario = req.getParameter("usuario");
        String nombre = req.getParameter("nombre");
        String apellidos = req.getParameter("apellidos");
        String contrasena = req.getParameter("contrasena");
        String correo = req.getParameter("correo");
        String foto = req.getParameter("foto");
        String rol = "user";

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
                resp.sendRedirect("Registro_1.jsp");
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

                resp.sendRedirect("Ingreso_1.jsp");

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}
