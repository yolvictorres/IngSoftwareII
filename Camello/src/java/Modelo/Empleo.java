package Modelo;

public class Empleo {

    private int idEmpleo;
    private int idPublicador;
    private String detalles;
    private String fecha;    
    private String cargo;
    private String experiencia;

    public Empleo(int idEmpleo, int idPublicador, String detalles, String fecha, String cargo, String experiencia) {
        this.idEmpleo = idEmpleo;
        this.idPublicador = idPublicador;
        this.detalles = detalles;
        this.fecha = fecha;
        this.cargo = cargo;
        this.experiencia = experiencia;
    }

    public int getIdEmpleo() {
        return idEmpleo;
    }

    public void setIdEmpleo(int idEmpleo) {
        this.idEmpleo = idEmpleo;
    }

    public int getIdPublicador() {
        return idPublicador;
    }

    public void setIdPublicador(int idPublicador) {
        this.idPublicador = idPublicador;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }
    
    
}
