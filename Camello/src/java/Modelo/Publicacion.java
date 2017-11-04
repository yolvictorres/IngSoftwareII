package Modelo;

public class Publicacion {

    private int idPublicacion;
    private String detalle;
    private String fecha;
    private int idUsuario;
    private int idCiudad;
    
    public Publicacion() {
    }

    public Publicacion(int id_publicacion, int idUsuario,int idCiudad,String detalle,String fecha) {
        this.idPublicacion = id_publicacion;
        this.detalle = detalle;
        this.idUsuario = idUsuario;
        this.idCiudad = idCiudad;
        this.fecha = fecha;
    }

    public int getId_publicacion() {
        return idPublicacion;
    }

    public void setId_publicacion(int id_publicacion) {
        this.idPublicacion = id_publicacion;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }
    
}
