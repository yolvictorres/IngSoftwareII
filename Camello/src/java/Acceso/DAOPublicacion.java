package Acceso;

import Modelo.Empleo;
import Modelo.Publicacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPublicacion implements CRUD{

    Conexion con = new Conexion();
    @Override
    public String crear(Object obj) {
        Publicacion publicacion = (Publicacion) obj;
        String consulta = "insert into publicar_persona (cod_p_persona,cod_persona, detalle_publicacion) values (?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, publicacion.getId_publicacion());
            pst.setInt(2, publicacion.getIdUsuario());
            pst.setString(3, publicacion.getDetalle());    
            int filas = pst.executeUpdate();
            respuesta = "Publicacion creado exitosamente";
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }
        return respuesta;
    }
    public List<Publicacion> consultarP() {
        List<Publicacion> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_persona";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Publicacion(rs.getInt("cod_p_publicacion"),
                        rs.getInt("cod_persona"),
                        rs.getInt("cod_ciudad"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//                if (pst != null) {
//                    pst.close();
//                }
//                if (rs != null) {
//                    rs.close();
//                }
//            } catch (SQLException e) {
//                System.err.println("Error" + e);
//            }
//        }
        return y;
    }
    
    @Override
    public String editar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Publicacion> consultar() {
        List<Publicacion> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = " select * from publicar_persona ";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Publicacion(rs.getInt("cod_p_persona"),
                        rs.getInt("cod_persona"),
                        rs.getInt("cod_ciudad"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//                if (pst != null) {
//                    pst.close();
//                }
//                if (rs != null) {
//                    rs.close();
//                }
//            } catch (SQLException e) {
//                System.err.println("Error" + e);
//            }
//        }
        return y;
    }

    @Override
    public List<?> filtrar(String tabla, String dato) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
