package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ConfirmarEditarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
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
            String sql = "UPDATE cliente SET usuario=?, nombre=?, apellidos=?, contrasena=?, correo=?, rol=?, foto=?"
                    + " WHERE id=?";
            PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, nombre);
            ps.setString(3, apellidos);
            ps.setString(4, contrasena);
            ps.setString(5, correo);
            ps.setString(6, rol);
            ps.setString(7, foto);
            ps.setString(8, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("ListaUsuario.jsp").forward(req, resp);
    }

}
