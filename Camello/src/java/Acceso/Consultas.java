package Acceso;

import Modelo.Pais;
import Modelo.Ciudad;
import Modelo.Empresa;
import Modelo.Jornada;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Consultas {

    Conexion con = new Conexion();

    public List<Pais> consultarPaisxNombre(String nombrePais) {
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

    public List<Pais> consultarPais() {
        List<Pais> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from pais";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Pais(rs.getInt("COD_PAIS"),
                        rs.getString("NOM_PAIS")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Ciudad> consultarCiudadId(int idCiudad) {
        List<Ciudad> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from ciudad where cod_ciudad = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idCiudad);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Ciudad(rs.getInt("COD_CIUDAD"),
                        rs.getInt("COD_PAIS"),
                        rs.getString("NOM_CIUDAD")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Ciudad> consultarCiudad() {
        List<Ciudad> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from ciudad";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Ciudad(rs.getInt("COD_CIUDAD"),
                        rs.getInt("COD_PAIS"),
                        rs.getString("NOM_CIUDAD")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Jornada> consultarJornada() {
        List<Jornada> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from jornada";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Jornada(rs.getInt("COD_JORNADA"),
                        rs.getString("NOM_JORNADA")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Jornada> consultarJornadaId(int idJornada) {
        List<Jornada> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from jornada where cod_jornada= ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idJornada);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Jornada(rs.getInt("COD_JORNADA"),
                        rs.getString("NOM_JORNADA")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Empresa> validarEmpresa(Object obj) {
        Empresa empresa = (Empresa) obj;
        Connection conn = null;
        ResultSet rs = null;
        List<Empresa> y = new ArrayList<>();
        PreparedStatement pst = null;
        try {

            conn = con.getconexion();
            String consulta = "select * from empresa where correo = ? and clave = ?";
            pst = conn.prepareStatement(consulta);
            pst.setString(1, empresa.getCorreoEmpresa());
            pst.setString(2, empresa.getClaveEmpresa());
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new Empresa(rs.getInt("cod_empresa"),
                        rs.getInt("cod_c_laboral"),
                        rs.getString("nom_empresa"),
                        rs.getString("correo"),
                        rs.getInt("telefono"),
                        rs.getString("descripcion"),
                        rs.getString("ruta_logo")));
            }

        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Persona> validarPersona(Object obj) {
        Persona persona = (Persona) obj;
        Connection conn = null;
        ResultSet rs = null;
        List<Persona> y = new ArrayList<>();
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from persona where correo = ? and clave = ?";
            pst = conn.prepareStatement(consulta);
            pst.setString(1, persona.getCorreoPersona());
            pst.setString(2, persona.getClavePersona());
            rs = pst.executeQuery();
            if (rs.next()) {

                y.add(new Persona(rs.getInt("cod_persona"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getInt("telefono"),
                        rs.getDate("fecha_nacimiento"),
                        rs.getString("correo"),
                        rs.getString("ruta_foto"),
                        rs.getString("hoja_de_vida")));
            }

        } catch (SQLException e) {
            System.err.println("Error" + e);
        }

        return y;

    }

}
