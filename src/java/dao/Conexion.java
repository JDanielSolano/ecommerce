package dao;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static Conexion conexion;

    static {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Conexion) DriverManager.getConnection("jdbc://localhost/ilgambino", "root", "");
        } catch (ClassNotFoundException e) {

        } catch (SQLException e) {

        }

    }

    public static Conexion getConnection() {
        return conexion;
    }

}
