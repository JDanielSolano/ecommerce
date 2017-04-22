package com;

import dao.Producto;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class ProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String marca = req.getParameter("marca");
        String descripcion = req.getParameter("descripcion");
        String precio = req.getParameter("precio");
        String imagen = req.getParameter("imagen");

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(
                    "insert into producto (id,marca,descripcion,precio,imagen) values (default,?,?,?,?)"
            );

            ps.setString(1, marca);
            ps.setString(2, descripcion);
            ps.setString(3, precio);
            ps.setString(4, imagen);

            ps.executeUpdate();
            ps.close();
            

        } catch (Exception e) {

            e.printStackTrace();
        }
        resp.sendRedirect("ListaProductos.jsp");
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
            Producto producto = new Producto();
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                Statement stmt = (Statement) cnx.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM producto WHERE id = " + id);

                while (rs.next()) {
                    producto.setId(rs.getInt(1));
                    producto.setMarca(rs.getString("marca"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getFloat("precio"));
                    producto.setImagen(rs.getString("imagen"));

                    req.setAttribute("producto", producto);

                }

            } catch (Exception e) {
            }

            req.getRequestDispatcher("MostrarProducto_1.jsp").forward(req, resp);

        } else if (action.equals("Editar")) {

            System.out.println(action);

            Producto producto = new Producto();
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                Statement stmt = (Statement) cnx.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM producto WHERE id = " + id);

                while (rs.next()) {
                    producto.setId(rs.getInt(1));
                    producto.setMarca(rs.getString("marca"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecio(rs.getFloat("precio"));
                    producto.setImagen(rs.getString("imagen"));

                    req.setAttribute("producto", producto);

                }

            } catch (Exception e) {
            }

            req.getRequestDispatcher("EditarProducto.jsp").forward(req, resp);

        } else if (action.equals("Eliminar")) {

            System.out.println(action);

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
                String sql = "DELETE FROM producto WHERE id=?";
                PreparedStatement ps = (PreparedStatement) cnx.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
            req.getRequestDispatcher("ListaProductos.jsp").forward(req, resp);
        }

    }

}
