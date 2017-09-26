package Acceso;

import Modelo.Empresa;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOEmpresa implements CRUDyBuscar {

    Conexion con = new Conexion();

    @Override
    public String crear(Object obj) {
        Empresa empresa = (Empresa) obj;
        String consulta = "insert into empresa(cod_empresa, nom_empresa, correo, clave) values (?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, empresa.getIdEmpresa());
            pst.setString(2, empresa.getNombreEmpresa());
            pst.setString(3, empresa.getCorreoEmpresa());
            pst.setString(4, empresa.getClaveEmpresa());
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

    public String subirImagen(Object obj) {
        Empresa empresa = (Empresa) obj;
        String consulta = "insert into empresa(ruta_logo) values (?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, empresa.getRutaLogo());
            int filas = pst.executeUpdate();
            respuesta = "Logo subido con éxito";
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

    public List<Empresa> consultarXID(int idEmpresa) {
        List<Empresa> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from empresa where cod_empresa = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idEmpresa);
            rs = pst.executeQuery();
            while (rs.next()) {
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
        Empresa empresa = (Empresa) obj;
        String consulta = "update empresa set nom_empresa=?, descripcion=?, correo=?, telefono=? where cod_empresa=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, empresa.getNombreEmpresa());
            pst.setString(2, empresa.getDescripcionEmpresa());
            pst.setString(3, empresa.getCorreoEmpresa());
            pst.setInt(4, empresa.getTelefonoEmpresa());
            pst.setInt(5, empresa.getIdEmpresa());
            int filas = pst.executeUpdate();
            respuesta = "Usuario editado con exito";
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
