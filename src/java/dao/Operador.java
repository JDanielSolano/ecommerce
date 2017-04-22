package dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import dao.Usuario;

public class Operador {

    private PreparedStatement ps = null;

    public ArrayList<Producto> getAllProducto() {

        ArrayList<Producto> listaProducto = new ArrayList<Producto>();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            ps = (PreparedStatement) cnx.prepareStatement("select * from producto");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setId(rs.getInt("id"));
                producto.setMarca(rs.getString("marca"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getFloat("precio"));
                producto.setImagen(rs.getString("imagen"));

                listaProducto.add(producto);

            }

        } catch (Exception e) {
        }

        return listaProducto;
    }

    public ArrayList<Pedido> getAllPedido() {

        ArrayList<Pedido> listaPedido = new ArrayList<Pedido>();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            ps = (PreparedStatement) cnx.prepareStatement("select * from orden");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt("id"));
                pedido.setUsuarioID(rs.getInt("usuarioID"));
                pedido.setPedido(rs.getString("pedido"));
                pedido.setTotal(rs.getFloat("total"));

                listaPedido.add(pedido);

            }

        } catch (Exception e) {
        }

        return listaPedido;
    }

    public ArrayList<Usuario> getAllUsuario() {

        ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            ps = (PreparedStatement) cnx.prepareStatement("select * from cliente");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getLong("id"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setRol(rs.getString("rol"));
                usuario.setFoto(rs.getString("foto"));

                listaUsuario.add(usuario);

            }

        } catch (Exception e) {
        }

        return listaUsuario;

    }

    public Usuario MostrarUsuario(String id) {

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
            }

        } catch (Exception e) {
        }

        return usuario;
    }

    public void anadirUsuario(Usuario usuario) {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ilgambino", "root", "");
            ps = (PreparedStatement) cnx.prepareStatement(
                    "insert into cliente (id,usuario,nombre,apellidos,contrasena,correo,rol) values (default,?,?,?,?,?,?)"
            );

            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApellidos());
            ps.setString(4, usuario.getContrasena());
            ps.setString(5, usuario.getCorreo());
            ps.setString(6, usuario.getRol());

            ps.executeUpdate();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

    }
}
