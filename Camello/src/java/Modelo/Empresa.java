package Modelo;

public class Empresa {

    private int idEmpresa;
    private String nombreEmpresa;
    private String detallesEmpresa;
    private String correoEmpresa;
    private String campoLaboral;
    private String rutaLogo;
    private String claveEmpresa;

    public Empresa() {
    }

    public Empresa(int idEmpresa, String nombreEmpresa, String detallesEmpresa, String correoEmpresa, String campoLaboral) {
        this.idEmpresa = idEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.detallesEmpresa = detallesEmpresa;
        this.correoEmpresa = correoEmpresa;
        this.campoLaboral = campoLaboral;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getDetallesEmpresa() {
        return detallesEmpresa;
    }

    public void setDetallesEmpresa(String detallesEmpresa) {
        this.detallesEmpresa = detallesEmpresa;
    }

    public String getCorreoEmpresa() {
        return correoEmpresa;
    }

    public void setCorreoEmpresa(String correoEmpresa) {
        this.correoEmpresa = correoEmpresa;
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

    public String getClaveEmpresa() {
        return claveEmpresa;
    }

    public void setClaveEmpresa(String claveEmpresa) {
        this.claveEmpresa = claveEmpresa;
    }



}
