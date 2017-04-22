package com;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class PedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");

        if (action.equals("Entregar")) {

            System.out.println(action);

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                String sql = "DELETE FROM orden WHERE id=?";
                PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
            req.getRequestDispatcher("ListaPedido.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        super.doPost(req, resp);
    }

}
