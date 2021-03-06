package Acceso;

import Modelo.Amigos;
import Modelo.Persona;
import Modelo.Postulados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

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

    public String subirImagen(Object obj) {
        Persona persona = (Persona) obj;
        String consulta = "update persona set ruta_foto=? where cod_persona=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, persona.getRutaFoto());
            pst.setInt(2, persona.getIdPersona());
            int filas = pst.executeUpdate();
            respuesta = "Foto subida con éxito";
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

    public String subirDocumento(Object obj) {
        Persona persona = (Persona) obj;
        String consulta = "update persona set hoja_de_vida=? where cod_persona=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, persona.getRutaHojadevida());
            pst.setInt(2, persona.getIdPersona());
            int filas = pst.executeUpdate();
            respuesta = "Documento guardado con éxito";
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
        Persona persona = (Persona) obj;
        String consulta = "update persona set nombres=?, apellidos=?, telefono=?, correo=? where cod_persona=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, persona.getNombresPersona());
            pst.setString(2, persona.getApellidosPersona());
            pst.setInt(3, persona.getTelefono());
            pst.setString(4, persona.getCorreoPersona());
            pst.setInt(5, persona.getIdPersona());
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
    public List<Persona> consultar() {
        List<Persona> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from persona";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
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

    public List<Persona> consultarXID(int idPersona) {
        List<Persona> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from persona where cod_persona = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            rs = pst.executeQuery();
            while (rs.next()) {
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

    public ResultSet listar() {
        Conexion con = new Conexion();
        String com = "select * from persona";
        ResultSet rs = con.getDatos(com);
        return rs;
    }

    public ResultSet mostrar() {
        Conexion con = new Conexion();
        String com = "Select cod_persona, nombre from persona";
        ResultSet rs = con.getDatos(com);
        return rs;
    }

    public String solicitarUnirseAMiRed(Object obj) {
        Amigos amigos = (Amigos) obj;
        String consulta = "insert into amigos (cod_persona, cod_amigo, estado_solicitud, notificacion_solicitud) values (?, ?, ? ,?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, amigos.getIdPersona());
            pst.setInt(2, amigos.getIdAmigo());
            pst.setInt(3, amigos.getEstado());
            pst.setInt(4, amigos.getNotificacion());
            int filas = pst.executeUpdate();
            respuesta = "Solicitud enviada correctamente";
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

    public int verificarSolicitud(int idPersona, int idAmigo, int Estado) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM amigos WHERE cod_persona= ? AND cod_amigo = ? AND estado_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, idAmigo);
            pst.setInt(3, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public int numeroSolicitudesPendientes(int idPersona, int Estado) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_amigo) AS total FROM amigos WHERE cod_amigo= ? AND estado_solicitud = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public int solicitudesPendientes(int idPersona, int idAmigo, int Estado) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM amigos WHERE cod_persona= ? AND cod_amigo = ? AND estado_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idAmigo);
            pst.setInt(2, idPersona);
            pst.setInt(3, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public int verificarAmigos(int idPersona, int idAmigo, int Estado) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM amigos WHERE cod_persona= ? AND cod_amigo=?  AND estado_solicitud =? OR cod_amigo =? AND cod_persona = ? AND estado_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, idAmigo);
            pst.setInt(3, Estado);
            pst.setInt(4, idPersona);
            pst.setInt(5, idAmigo);
            pst.setInt(6, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public int numeroUnidosAMiRed(int idPersona) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_amigo) AS total FROM amigos WHERE cod_amigo= ? AND estado_solicitud = 1 OR cod_persona =? AND estado_solicitud = 1";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, idPersona);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public List<Amigos> mostrarSolicitudesPendientes(int idPersona, int Estado) {
        List<Amigos> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from amigos where cod_amigo = ? AND estado_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Amigos(rs.getInt("cod_persona"),
                        rs.getInt("cod_amigo"),
                        rs.getInt("estado_solicitud"),
                        rs.getInt("notificacion_solicitud")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public String EstadoAmigo(Object obj) {
        Amigos amigos = (Amigos) obj;
        String consulta = "update amigos set  estado_solicitud =? where cod_persona =? and cod_amigo =?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, amigos.getEstado());
            pst.setInt(2, amigos.getIdPersona());
            pst.setInt(3, amigos.getIdAmigo());
            int filas = pst.executeUpdate();
            respuesta = "Estado actualizado";
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

    public List<Amigos> mostrarMired(int idPersona, int Estado) {
        List<Amigos> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from amigos where cod_amigo = ? AND estado_solicitud =? OR cod_persona =? AND estado_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, Estado);
            pst.setInt(3, idPersona);
            pst.setInt(4, Estado);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Amigos(rs.getInt("cod_persona"),
                        rs.getInt("cod_amigo"),
                        rs.getInt("estado_solicitud"),
                        rs.getInt("notificacion_solicitud")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public List<Amigos> notificarMiRed(int idPersona, int Estado, int Notificacion) {
        List<Amigos> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from amigos where cod_persona =? AND estado_solicitud = ? AND notificacion_solicitud =?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, Estado);
            pst.setInt(3, Notificacion);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Amigos(rs.getInt("cod_persona"),
                        rs.getInt("cod_amigo"),
                        rs.getInt("estado_solicitud"),
                        rs.getInt("notificacion_solicitud")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public int numeroNotificacionMiRed(int idPersona) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_amigo) AS total FROM amigos WHERE cod_persona =? AND estado_solicitud = 1 AND notificacion_solicitud =0 OR cod_persona =? AND estado_solicitud = 2 AND notificacion_solicitud =0";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            pst.setInt(2, idPersona);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }

    public String notificacionVista(Object obj) {
        Amigos amigos = (Amigos) obj;
        String consulta = "update amigos set  notificacion_solicitud =? where cod_persona =? and cod_amigo =?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, amigos.getNotificacion());
            pst.setInt(2, amigos.getIdPersona());
            pst.setInt(3, amigos.getIdAmigo());
            int filas = pst.executeUpdate();
            respuesta = "Actualizacion vista";
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
