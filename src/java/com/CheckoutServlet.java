package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String usuarioID = req.getParameter("usuarioID");
        System.out.println(usuarioID);
        String pedido = req.getParameter("pedido");
        System.out.println(pedido);
        String total = req.getParameter("total");
        System.out.println(total);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(
                    "insert into orden (id,usuarioID,pedido,total) values (default,?,?,?)"
            );

            ps.setString(1, usuarioID);
            ps.setString(2, pedido);
            ps.setString(3, total);

            ps.executeUpdate();
            ps.close();

            resp.sendRedirect("Inicio");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
