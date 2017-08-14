package Modelo;

public class Publicacion {

    private int idPublicacion;
    private String detalle;
    private String fecha;
    private String idUsuario;
    private String nombreCiudad;
    
    public Publicacion() {
    }

    public Publicacion(int id_publicacion, String detalle, String idUsuario, String nombreCiudad) {
        this.idPublicacion = id_publicacion;
        this.detalle = detalle;
        this.idUsuario = idUsuario;
        this.nombreCiudad = nombreCiudad;
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

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }
    
}
