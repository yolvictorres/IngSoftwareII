package Modelo;

public class Empleo {

    private int idEmpleo;
    private int idEmpresa;
    private int idCiudad;
    private int idJornada;
    private String detalles;
    private String fecha;    
    private String cargo;
    private String experiencia;

    public Empleo(int idEmpleo, int idEmpresa, int idCiudad, int idJornada, String detalles, String fecha, String cargo, String experiencia) {
        this.idEmpleo = idEmpleo;
        this.idEmpresa = idEmpresa;
        this.idCiudad = idCiudad;
        this.idJornada = idJornada;
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

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdPublicador(int idPublicador) {
        this.idEmpresa = idPublicador;
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

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int ciudad) {
        this.idCiudad = ciudad;
    }

    public int getIdJornada() {
        return idJornada;
    }

    public void setIdJornada(int jornada) {
        this.idJornada = jornada;
    }
    
    
}
