package Acceso;

import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class DAOPersona implements CRUDyBuscar {

    Conexion con = new Conexion();

    @Override
    public String crear(Object obj) {
        Persona persona = (Persona) obj;
        String consulta = "insert into persona (cod_persona, nombres, apellidos, correo, clave) values (?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, persona.getIdPersona());
            pst.setString(2, persona.getNombresPersona());
            pst.setString(3, persona.getApellidosPersona());
            pst.setString(4, persona.getCorreoPersona());
            pst.setString(5, persona.getClavePersona());
            int filas = pst.executeUpdate();
            respuesta = "Usuario creado con éxito";
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

    @Override
    public List<?> buscarPersona(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> buscarEmpleo(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> buscarEmpresa(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> buscarMensaje(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> buscarPublicacion(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
