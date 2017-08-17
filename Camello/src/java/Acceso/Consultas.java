package Acceso;

import Modelo.Pais;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class Consultas {
    
    Conexion con = new Conexion();
    
        public List<Pais> consultarNombrePais(String nombrePais) {
        List<Pais> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from pais where nom_pais= ? ";
            pst = conn.prepareStatement(consulta);
            pst.setString(1, nombrePais);
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new Pais(rs.getInt("idPais"),
                        rs.getString("nombrePais")));                      
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return y;
    }
}
