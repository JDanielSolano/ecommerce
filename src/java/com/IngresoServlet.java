package com;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import dao.Usuario;

public class IngresoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String usuario = req.getParameter("usuario");
            String contrasena = req.getParameter("contrasena");

            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost/ilgambino", "root", "");
            Statement st = (Statement) con.createStatement();
            ResultSet rs = st.executeQuery("select * from cliente where usuario='"
                    + usuario + "'");
            if (rs.next()) {
                if (rs.getString(5).equals(contrasena)) {

                    String rol = rs.getString("rol");
                    Long id = rs.getLong("id");
                    String foto = rs.getString("foto");

                    req.getSession().setAttribute("user", new Usuario(id, usuario, contrasena, rol, foto));

                    String sql = "DELETE FROM carrito WHERE usuarioID=?";
                    PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setLong(1, id);
                    ps.executeUpdate();

                    resp.sendRedirect("Inicio");

                } else {

                    System.out.println("Contraseña inválida.");
                    resp.sendRedirect("Ingreso.jsp");
                }
            } else {

                System.out.println("Contraseña inválida.");
                resp.sendRedirect("Ingreso.jsp");
            }

        } catch (Exception e) {
            System.out.println("¡Error!");
        }

    }

}
