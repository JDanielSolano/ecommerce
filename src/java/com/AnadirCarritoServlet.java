package com;

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

import dao.Producto;

public class AnadirCarritoServlet extends HttpServlet {

    public String marca, descripcion, imagen, productoID, usuarioID, cantidad;
    float precio;
    private PreparedStatement ps = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        productoID = req.getParameter("id");
        usuarioID = req.getParameter("usuarioID");
        cantidad = req.getParameter("cantidad");
        System.out.println(productoID);
        System.out.println(cantidad);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            Statement stmt = (Statement) cnx.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM producto WHERE id = " + productoID);
            Producto producto = new Producto();

            while (rs.next()) {

                producto.setId(rs.getInt(1));
                producto.setMarca(rs.getString("marca"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getFloat("precio"));
                producto.setImagen(rs.getString("imagen"));

                marca = producto.getMarca();
                descripcion = producto.getDescripcion();
                precio = producto.getPrecio();
                imagen = producto.getImagen();

            }
            System.out.println(productoID);
            System.out.println(usuarioID);
            System.out.println(cantidad);
            System.out.println(marca);
            System.out.println(descripcion);
            System.out.println(precio);
            System.out.println(imagen);

            ps = (PreparedStatement) cnx.prepareStatement(
                    "insert into carrito (id,productoID,usuarioID,cantidad,marca,descripcion,precio,imagen) values (default,?,?,?,?,?,?,?)"
            );

            ps.setString(1, productoID);
            ps.setString(2, usuarioID);
            ps.setString(3, cantidad);
            ps.setString(4, marca);
            ps.setString(5, descripcion);
            ps.setFloat(6, precio);
            ps.setString(7, imagen);

            ps.executeUpdate();
            ps.close();

        } catch (Exception e) {
        }

        resp.sendRedirect("Carrito.jsp");

    }

}
