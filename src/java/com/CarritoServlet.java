package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class CarritoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String action = req.getParameter("action");

        if (action.equals("Eliminar")) {

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");

                String sql = "DELETE FROM carrito WHERE id=?";
                PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
            req.getRequestDispatcher("Carrito.jsp").forward(req, resp);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String cantidad = req.getParameter("cantidad");
        System.out.println(cantidad);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            String sql = "UPDATE carrito SET cantidad =? where id = ?";

            PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
            ps.setString(1, cantidad);
            ps.setString(2, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("Carrito.jsp");

    }

}
