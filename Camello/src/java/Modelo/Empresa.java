package Modelo;

public class Empresa {

    private int idEmpresa;
    private int idCampoLaboral;
    private String nombreEmpresa;
    private String correoEmpresa;   
    private String claveEmpresa;
    private int telefonoEmpresa;
    private String descripcionEmpresa;
    private String rutaLogo;
    

    public Empresa() {
    }

    public Empresa(int idEmpresa, int idCampoLaboral, String nombreEmpresa, String correoEmpresa, int telefonoEmpresa, String descripcionEmpresa) {
        this.idEmpresa = idEmpresa;
        this.idCampoLaboral = idCampoLaboral;
        this.nombreEmpresa = nombreEmpresa;
        this.correoEmpresa = correoEmpresa;
        this.telefonoEmpresa = telefonoEmpresa;
        this.descripcionEmpresa = descripcionEmpresa;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdCampoLaboral() {
        return idCampoLaboral;
    }

    public void setIdCampoLaboral(int idCampoLaboral) {
        this.idCampoLaboral = idCampoLaboral;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getCorreoEmpresa() {
        return correoEmpresa;
    }

    public void setCorreoEmpresa(String correoEmpresa) {
        this.correoEmpresa = correoEmpresa;
    }

    public String getClaveEmpresa() {
        return claveEmpresa;
    }

    public void setClaveEmpresa(String claveEmpresa) {
        this.claveEmpresa = claveEmpresa;
    }

    public int getTelefonoEmpresa() {
        return telefonoEmpresa;
    }

    public void setTelefonoEmpresa(int telefonoEmpresa) {
        this.telefonoEmpresa = telefonoEmpresa;
    }

    public String getDescripcionEmpresa() {
        return descripcionEmpresa;
    }

    public void setDescripcionEmpresa(String descripcionEmpresa) {
        this.descripcionEmpresa = descripcionEmpresa;
    }

    public String getRutaLogo() {
        return rutaLogo;
    }

    public void setRutaLogo(String rutaLogo) {
        this.rutaLogo = rutaLogo;
    }

    


}
