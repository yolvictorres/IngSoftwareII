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
public class conexion {
    private String USERNAME = "root";
    private String CONTRASENA = "";
    private String HOST = "localhost";
    private String PORT = "80";
    private String DATABASE = "futbolcolombia";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+"/"+DATABASE;
    private Connection con;
    
    public conexion(){
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL,USERNAME,CONTRASENA);
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR"+e);
        }   catch(SQLException e){
            System.err.println("Error "+e);
        }
    }
     public Connection getconexion(){
         return con;
     }
     
//     public static void main(String[] args){
//        conexion con = new conexion();
//    }
    
}
