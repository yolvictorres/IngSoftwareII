package Acceso;

import Modelo.Empleo;
import Modelo.Postulados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOEmpleo implements CRUD {

    Conexion con = new Conexion();

    @Override
    public String crear(Object obj) {
        Empleo empleo = (Empleo) obj;
        String consulta = "insert into publicar_empresa (cod_p_empresa, cod_empresa, cod_ciudad, cod_jornada, detalle_publicacion, cod_cargo, cod_salario, experiencia_requerida) values (?, ?, ?, ?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, empleo.getIdEmpleo());
            pst.setInt(2, empleo.getIdEmpresa());
            pst.setInt(3, empleo.getIdCiudad());
            pst.setInt(4, empleo.getIdJornada());
            pst.setString(5, empleo.getDetalles());
            pst.setInt(6, empleo.getIdCargo());
            pst.setInt(7, empleo.getIdSalario());
            pst.setString(8, empleo.getExperiencia());
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
        Empleo empleo = (Empleo) obj;
        String consulta = "update publicar_empresa set  cod_empresa=?, cod_ciudad=?, cod_jornada=?, detalle_publicacion=?, cod_cargo=?, cod_salario=?, experiencia_requerida=? where cod_p_empresa=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, empleo.getIdEmpresa());
            pst.setInt(2, empleo.getIdCiudad());
            pst.setInt(3, empleo.getIdJornada());
            pst.setString(4, empleo.getDetalles());
            pst.setInt(5, empleo.getIdCargo());
            pst.setInt(6, empleo.getIdSalario());
            pst.setString(7, empleo.getExperiencia());
            pst.setInt(8, empleo.getIdEmpleo());
            int filas = pst.executeUpdate();
            respuesta = "Empleo fué editado con éxito";
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
    public List<Empleo> consultar() {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
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

    public List<Empleo> consultarIdP(int idEmpleo) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa where cod_p_empresa = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idEmpleo);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
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

    public List<Empleo> consultarIdE(int idEmpresa) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa where cod_empresa = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idEmpresa);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
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

    public List<Empleo> consultarIdC(String idCargo) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa where cod_cargo = ?";
            pst = conn.prepareStatement(consulta);
            pst.setNString(1, idCargo);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
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

    public List<Empleo> filtro(int Ciudad) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa where ";
            if (Ciudad != 0) {
                consulta += "cod_ciudad = ?";
            }

            pst = conn.prepareStatement(consulta);
            pst.setInt(1, Ciudad);

            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

    public String postular(Object obj) {
        Postulados postulados = (Postulados) obj;
        String consulta = "insert into postulados (cod_p_empresa, cod_empresa, cod_persona, estado_postulado, estado_notificacion, estado_envio) values (?, ?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, postulados.getCodigoEmpleo());
            pst.setInt(2, postulados.getCodigoEmpresa());
            pst.setInt(3, postulados.getCodigoPersona());
            pst.setInt(4, postulados.getEstadoPostulados());            
            pst.setInt(5, postulados.getEstadoNotificacion());
            pst.setInt(6, postulados.getEstadoEnvio());
            int filas = pst.executeUpdate();
            respuesta = "Postulado correctamente";
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

    public int verificarPostulado(int idPersona, int idEmpleo) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM postulados WHERE cod_p_empresa = ? AND cod_persona = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idEmpleo);
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

    public List<Postulados> verificarEmpleosPostulados(int idPersona) {
        List<Postulados> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from postulados where cod_persona = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Postulados(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_persona"),
                        rs.getInt("estado_envio"),
                        rs.getInt("estado_postulado"),
                        rs.getInt("estado_notificacion"),
                        rs.getString("mensaje")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }
        public List<Postulados> mostrarNuevosPostulados(int EP, int idEmpresa) {
        List<Postulados> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from postulados where estado_postulado = ? AND cod_empresa = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, EP);
            pst.setInt(2, idEmpresa);
            rs = pst.executeQuery();
             while (rs.next()) {
                y.add(new Postulados(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_persona"),
                        rs.getInt("estado_envio"),
                        rs.getInt("estado_postulado"),
                        rs.getInt("estado_notificacion"),
                        rs.getString("mensaje")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }
        public int notificarNuevosPostulados(int idEmpresa) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM postulados WHERE estado_postulado = 0 AND cod_empresa = ?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idEmpresa);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }
        
       public String aceptarPostulado(Object obj) {
        Postulados postulado = (Postulados) obj;
        String consulta = "update postulados set  estado_postulado =?, mensaje =? where cod_p_empresa=? and cod_persona =?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, postulado.getEstadoPostulados());            
            pst.setString(2, postulado.getMensaje());
            pst.setInt(3, postulado.getCodigoEmpleo());
            pst.setInt(4, postulado.getCodigoPersona());
            int filas = pst.executeUpdate();
            respuesta = "Persona Aceptada";
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
       
        public String descartarPostulado(Object obj) {
        Postulados postulado = (Postulados) obj;
        String consulta = "update postulados set  estado_postulado =?, mensaje =? where cod_p_empresa=? and cod_persona =?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, postulado.getCodigoEmpleo());            
            pst.setString(2, postulado.getMensaje());
            pst.setInt(3, postulado.getCodigoEmpleo());
            pst.setInt(4, postulado.getCodigoPersona());
            int filas = pst.executeUpdate();
            respuesta = "Persona Descartada";
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
           public int verificarNotificaciones(int idPersona) {
        int postul = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "SELECT count(cod_persona) AS total FROM postulados WHERE cod_persona =? AND estado_notificacion =0 AND estado_postulado =1 OR estado_postulado =2";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            rs = pst.executeQuery();
            while (rs.next()) {
                postul = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return postul;
    }
            public List<Postulados> mostrarNotificaciones (int idPersona) {
        List<Postulados> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from postulados WHERE cod_persona =? AND estado_notificacion =0 AND estado_postulado =1 OR estado_postulado =2";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idPersona);
            rs = pst.executeQuery();
             while (rs.next()) {
                y.add(new Postulados(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_persona"),
                        rs.getInt("estado_envio"),
                        rs.getInt("estado_postulado"),
                        rs.getInt("estado_notificacion"),
                        rs.getString("mensaje")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }
            
             public String QuitarNotificacion(Object obj) {
        Postulados postulado = (Postulados) obj;
        String consulta = "update postulados set  estado_notificacion =? where cod_empresa=? and cod_persona =?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, postulado.getEstadoNotificacion());            
            pst.setInt(2, postulado.getCodigoEmpresa());
            pst.setInt(3, postulado.getCodigoPersona());
            int filas = pst.executeUpdate();
            respuesta = "Notificacion vista";
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
             public List<Empleo> consultarIntereses(int idpersona) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from publicar_empresa , cargo , intereses where intereses.cod_persona = ? && cargo.cod_cargo = intereses.cod_cargo && publicar_empresa.cod_cargo = intereses.cod_cargo";
            //pst = conn.prepareStatement(consulta);
            //rs = pst.executeQuery();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, idpersona);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new Empleo(rs.getInt("cod_p_empresa"),
                        rs.getInt("cod_empresa"),
                        rs.getInt("cod_ciudad"),
                        rs.getInt("cod_jornada"),
                        rs.getInt("cod_cargo"),
                        rs.getInt("cod_salario"),
                        rs.getString("detalle_publicacion"),
                        rs.getString("fecha"),
                        rs.getString("experiencia_requerida")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
        return y;
    }

}
