package Modelo;

public class Publicador {

    private int idPublicador;
    private String nombrePublicador;
    private String detallesPublicador;
    private String correoPublicador;
    private String campoLaboral;
    private String rutaLogo;

    public Publicador() {
    }

    public Publicador(int id_publicador, String nombrePublicador, String detallesPublicador, String correoPublciador, String rutaLogo) {
        this.idPublicador = id_publicador;
        this.nombrePublicador = nombrePublicador;
        this.detallesPublicador = detallesPublicador;
        this.correoPublicador = correoPublciador;
        this.rutaLogo = rutaLogo;
    }

    public int getId_publicador() {
        return idPublicador;
    }

    public void setId_publicador(int id_publicador) {
        this.idPublicador = id_publicador;
    }

    public String getNombrePublicador() {
        return nombrePublicador;
    }

    public void setNombrePublicador(String nombrePublicador) {
        this.nombrePublicador = nombrePublicador;
    }

    public String getDetallesPublicador() {
        return detallesPublicador;
    }

    public void setDetallesPublicador(String detallesPublicador) {
        this.detallesPublicador = detallesPublicador;
    }

    public String getCorreoPublciador() {
        return correoPublicador;
    }

    public void setCorreoPublciador(String correoPublciador) {
        this.correoPublicador = correoPublciador;
    }

    public String getCampoLaboral() {
        return campoLaboral;
    }

    public void setCampoLaboral(String campoLaboral) {
        this.campoLaboral = campoLaboral;
    }

    public String getRutaLogo() {
        return rutaLogo;
    }

    public void setRutaLogo(String rutaLogo) {
        this.rutaLogo = rutaLogo;
    }

}
