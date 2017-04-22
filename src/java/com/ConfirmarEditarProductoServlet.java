package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ConfirmarEditarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String marca = req.getParameter("marca");
        String descripcion = req.getParameter("descripcion");
        String precio = req.getParameter("precio");
        String imagen = req.getParameter("imagen");

        System.out.println(id);
        System.out.println(marca);
        System.out.println(descripcion);
        System.out.println(precio);
        System.out.println(imagen);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            String sql = "UPDATE producto SET marca=?, descripcion=?, precio=?, imagen=?"
                    + " WHERE id=?";
            PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
            ps.setString(1, marca);
            ps.setString(2, descripcion);
            ps.setString(3, precio);
            ps.setString(4, imagen);
            ps.setString(5, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("ListaProductos.jsp").forward(req, resp);
    }

}
