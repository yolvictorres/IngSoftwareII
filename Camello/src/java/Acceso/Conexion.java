package Acceso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author IAN
 */
public class Conexion {

    private String USERNAME = "root";
    private String CONTRASENA = "";
    private String HOST = "localhost";
    private String PORT = "80";
    private String DATABASE = "camello";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + "/" + DATABASE;
    private Connection con;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, CONTRASENA);
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR" + e);
        } catch (SQLException e) {
            System.err.println("Error " + e);
        }
    }

    public Connection getconexion() {
        return con;
    }

//    public boolean Autenticacion(String correo, String contraseña) {
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try {
//            String consulta = "select * from Persona where correo = ? and contrasena = ?";
//            pst = getconexion().prepareStatement(consulta);
//            pst.setString(1, correo);
//            pst.setString(2, contraseña);
//            rs = pst.executeQuery();
//
//            if (rs.absolute(1)) {
//                return true;
//            }
//        } catch (Exception e) {
//            System.err.println("Error" + e);
//        } finally {
//            try {
//                if (getconexion() != null) {
//                    getconexion().close();
//                }
//                if (pst != null) {
//                    pst.close();
//                }
//                if (rs != null) {
//                    rs.close();
//                }
//            } catch (Exception e) {
//                System.err.println("Error" + e);
//            }
//
//        }
//
//        return false;
//    }

//     public static void main(String[] args){
//        Conexion con = new Conexion();
//    }
}
