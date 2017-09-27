package Acceso;

import Modelo.Empleo;
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

    public List<Empleo> filtro(String Ciudad) {
        List<Empleo> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select from publicar_empresa where cod_cargo = ?";
            pst = conn.prepareStatement(consulta);
            pst.setNString(1, Ciudad);
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
