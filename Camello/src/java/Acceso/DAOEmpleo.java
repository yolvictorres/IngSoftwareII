package Acceso;

import Modelo.Empleo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class DAOEmpleo implements CRUD{

    Conexion con = new Conexion();

    @Override
    public String crear(Object obj) {
        Empleo empleo = (Empleo) obj;
        String consulta = "insert into publicar_empresa (cod_ciudad, cod_jornada, detalle_publicacion, cargo, experiencia_requerida) values (?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, empleo.getIdCiudad());
            pst.setInt(2, empleo.getIdJornada());
            pst.setString(3, empleo.getDetalles());
            pst.setString(4, empleo.getCargo());
            pst.setString(5, empleo.getExperiencia());
            int filas = pst.executeUpdate();
            respuesta = "Empleo creado exitosamente";
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

    @Override
    public String editar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> filtrar(String tabla, String dato) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
